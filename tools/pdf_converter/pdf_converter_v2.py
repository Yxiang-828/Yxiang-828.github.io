#!/usr/bin/env python3
"""
Advanced PDF to Markdown Converter for Academic Content
Uses multiple extraction strategies to preserve mathematical notation and complex layouts.
"""

import os
import sys
import argparse
import re
from pathlib import Path
import pdfplumber
import PyPDF2
from typing import Optional, List, Dict, Tuple

class AdvancedPDFConverter:
    def __init__(self):
        """Initialize advanced PDF converter."""
        pass
    
    def extract_text_advanced(self, pdf_path: str) -> str:
        """Advanced extraction that tries multiple methods for best results."""
        try:
            with pdfplumber.open(pdf_path) as pdf:
                all_content = ""
                
                for page_num, page in enumerate(pdf.pages, 1):
                    page_content = f"\n## Page {page_num}\n\n"
                    
                    # Method 1: Try layout-preserving extraction
                    layout_text = self._extract_with_layout_preservation(page)
                    
                    if layout_text:
                        page_content += layout_text
                    else:
                        # Method 2: Fallback to regular extraction with post-processing
                        regular_text = page.extract_text()
                        if regular_text:
                            page_content += self._post_process_extracted_text(regular_text)
                    
                    # Add tables
                    tables = page.extract_tables()
                    if tables:
                        page_content += self._format_tables_properly(tables)
                    
                    all_content += page_content
                
                return self._final_cleanup(all_content)
                
        except Exception as e:
            print(f"Error in advanced extraction: {e}")
            return self._fallback_extraction(pdf_path)
    
    def _extract_with_layout_preservation(self, page) -> str:
        """Extract text while preserving spatial layout for mathematical content."""
        try:
            # Get page dimensions
            page_width = page.width
            page_height = page.height
            
            # Extract text with bounding boxes
            words = page.extract_words()
            if not words:
                return ""
            
            # Group words into lines based on y-coordinate
            lines = self._group_words_into_lines(words)
            
            # Reconstruct text with proper spacing
            content = ""
            for line_words in lines:
                line_text = self._reconstruct_line_from_words(line_words, page_width)
                if line_text.strip():
                    formatted_line = self._format_line_intelligently(line_text)
                    content += formatted_line + "\n\n"
            
            return content
            
        except Exception as e:
            print(f"Layout preservation failed: {e}")
            return ""
    
    def _group_words_into_lines(self, words: List[Dict]) -> List[List[Dict]]:
        """Group words into lines based on y-coordinate proximity."""
        if not words:
            return []
        
        # Sort words by y-coordinate first
        words_sorted = sorted(words, key=lambda w: (w['top'], w['x0']))
        
        lines = []
        current_line = [words_sorted[0]]
        current_y = words_sorted[0]['top']
        
        for word in words_sorted[1:]:
            # If word is close to current line (within reasonable distance)
            if abs(word['top'] - current_y) < 5:  # 5 points tolerance
                current_line.append(word)
            else:
                # Start new line
                if current_line:
                    lines.append(current_line)
                current_line = [word]
                current_y = word['top']
        
        # Add last line
        if current_line:
            lines.append(current_line)
        
        return lines
    
    def _reconstruct_line_from_words(self, words: List[Dict], page_width: float) -> str:
        """Reconstruct line text from words with intelligent spacing."""
        if not words:
            return ""
        
        # Sort words by x-coordinate
        words_sorted = sorted(words, key=lambda w: w['x0'])
        
        line_text = ""
        prev_word = None
        
        for word in words_sorted:
            word_text = word['text'].strip()
            if not word_text:
                continue
            
            if prev_word:
                # Calculate spacing
                gap = word['x0'] - prev_word['x1']
                avg_char_width = (prev_word['x1'] - prev_word['x0']) / max(len(prev_word['text']), 1)
                
                # Intelligent spacing based on content and gap size
                if gap > avg_char_width * 2:  # Large gap
                    if self._should_preserve_large_spacing(prev_word['text'], word_text):
                        line_text += "   "  # Multiple spaces for alignment
                    else:
                        line_text += " "
                elif gap > avg_char_width * 0.5:  # Normal gap
                    line_text += " "
                # No space for small gaps (e.g., mathematical expressions)
            
            line_text += word_text
            prev_word = word
        
        return line_text
    
    def _should_preserve_large_spacing(self, prev_text: str, current_text: str) -> bool:
        """Determine if large spacing should be preserved (e.g., for alignment, tables)."""
        # Preserve spacing around mathematical operators
        math_operators = {'=', '→', '↔', '⊕', '∈', '∪', '∩'}
        if any(op in prev_text or op in current_text for op in math_operators):
            return True
        
        # Preserve spacing for table-like content
        if (prev_text.isdigit() and current_text.isalpha()) or (prev_text.isalpha() and current_text.isdigit()):
            return True
        
        # Preserve spacing for variable definitions
        if len(prev_text) == 1 and prev_text.isupper() and len(current_text) == 1 and current_text.isupper():
            return True
        
        return False
    
    def _format_line_intelligently(self, line: str) -> str:
        """Format line based on content analysis."""
        line = line.strip()
        if not line:
            return ""
        
        # Clean up common artifacts
        line = re.sub(r'\s+', ' ', line)
        
        # Detect headers
        if self._is_header(line):
            level = self._get_header_level(line)
            return f"{'#' * level} {line}"
        
        # Detect and format mathematical expressions
        if self._contains_mathematical_content(line):
            cleaned_math = self._clean_mathematical_expression(line)
            return cleaned_math
        
        # Detect lists
        if self._is_list_item(line):
            return f"• {self._clean_list_item(line)}"
        
        # Detect definitions or important terms
        if self._is_definition_or_important(line):
            return f"**{line}**"
        
        return line
    
    def _is_header(self, line: str) -> bool:
        """Detect if line is a header."""
        if len(line) < 3 or len(line) > 100:
            return False
        
        # Section numbering
        if re.match(r'^\d+(\.\d+)*[\s:]', line):
            return True
        
        # Topic/chapter patterns
        if re.match(r'^(Topic|Chapter|Section|Part)\s+\d+', line, re.IGNORECASE):
            return True
        
        # Short uppercase or title case lines
        if len(line) < 60 and (line.isupper() or (line.istitle() and line.count(' ') < 5)):
            return True
        
        # Lines ending with colon
        if line.endswith(':') and len(line) < 80 and not line.count(':') > 1:
            return True
        
        return False
    
    def _get_header_level(self, line: str) -> int:
        """Determine header level."""
        if re.match(r'^(Topic|Chapter)\s+\d+', line, re.IGNORECASE):
            return 2
        elif re.match(r'^\d+\.\d+\.\d+', line):
            return 4
        elif re.match(r'^\d+\.\d+', line):
            return 3
        elif line.isupper() and len(line) < 40:
            return 2
        else:
            return 3
    
    def _contains_mathematical_content(self, line: str) -> bool:
        """Detect mathematical content with high accuracy."""
        # Mathematical symbols
        math_symbols = ['=', '≤', '≥', '≠', '≈', '∀', '∃', '∈', '∉', '∩', '∪', '⊕', '⊗', 
                       '∧', '∨', '¬', '→', '↔', '⇒', '⇔', '²', '³', '√', '∑', '∏', '∫']
        
        if any(symbol in line for symbol in math_symbols):
            return True
        
        # Function notation patterns
        if re.search(r'[A-Z]\s*\([^)]*\)', line):
            return True
        
        # Subscript/superscript patterns
        if re.search(r'[A-Z]_[a-zA-Z0-9]|[0-9]\^[a-zA-Z0-9]', line):
            return True
        
        # Equation-like patterns
        if re.search(r'\b[A-Z]\s*=\s*[A-Z]', line):
            return True
        
        return False
    
    def _clean_mathematical_expression(self, line: str) -> str:
        """Clean mathematical expressions for better readability."""
        # Fix common spacing issues in mathematical notation
        
        # Function calls: E ( x ) → E(x)
        line = re.sub(r'([A-Z])\s*\(\s*([^)]*)\s*\)', r'\1(\2)', line)
        
        # Subscripts: E _ k → E_k
        line = re.sub(r'([A-Z])\s*_\s*([a-zA-Z0-9])', r'\1_\2', line)
        
        # Superscripts: 2 ^ k → 2^k
        line = re.sub(r'(\d+)\s*\^\s*([a-zA-Z0-9]+)', r'\1^\2', line)
        
        # Nested functions: D ( E ( x ) ) → D(E(x))
        line = re.sub(r'([A-Z])\s*\(\s*([A-Z])\s*\(\s*([^)]*)\s*\)\s*\)', r'\1(\2(\3))', line)
        
        # Operators with proper spacing
        line = re.sub(r'\s*=\s*', ' = ', line)
        line = re.sub(r'\s*⊕\s*', ' ⊕ ', line)
        line = re.sub(r'\s*→\s*', ' → ', line)
        
        # Clean excessive whitespace
        line = re.sub(r'\s+', ' ', line).strip()
        
        return f"`{line}`"
    
    def _is_list_item(self, line: str) -> bool:
        """Detect list items."""
        line = line.strip()
        return bool(re.match(r'^[•○▪▫‣⁃-]\s|^\d+[.)]\s|^[a-zA-Z][.)]\s', line))
    
    def _clean_list_item(self, line: str) -> str:
        """Clean list item markers."""
        return re.sub(r'^[•○▪▫‣⁃-]\s*|^\d+[.)]\s*|^[a-zA-Z][.)]\s*', '', line.strip())
    
    def _is_definition_or_important(self, line: str) -> bool:
        """Detect definitions or important terms."""
        if re.search(r'(Definition|Theorem|Lemma|Corollary|Proof)[:.]', line, re.IGNORECASE):
            return True
        
        if len(line) < 80 and ':' in line and not line.endswith(':'):
            return True
        
        return False
    
    def _format_tables_properly(self, tables: List) -> str:
        """Format tables with academic focus."""
        if not tables:
            return ""
        
        content = ""
        for i, table in enumerate(tables, 1):
            if not table or not any(row for row in table if row):
                continue
            
            content += f"\n### Table {i}\n\n"
            
            # Process table rows
            processed_rows = []
            for row in table:
                if row and any(cell for cell in row if cell and str(cell).strip()):
                    cleaned_row = []
                    for cell in row:
                        if cell is None:
                            cleaned_row.append("")
                        else:
                            cell_text = str(cell).replace('\n', ' ').strip()
                            cell_text = re.sub(r'\s+', ' ', cell_text)
                            cleaned_row.append(cell_text)
                    processed_rows.append(cleaned_row)
            
            # Generate markdown table
            if processed_rows:
                for row_idx, row in enumerate(processed_rows):
                    escaped_cells = [cell.replace('|', '\\|') for cell in row]
                    content += "| " + " | ".join(escaped_cells) + " |\n"
                    
                    if row_idx == 0:  # Header separator
                        content += "| " + " | ".join("---" for _ in row) + " |\n"
                
                content += "\n"
        
        return content
    
    def _post_process_extracted_text(self, text: str) -> str:
        """Post-process text when layout preservation fails."""
        lines = text.split('\n')
        processed_content = ""
        
        for line in lines:
            line = line.strip()
            if line:
                formatted = self._format_line_intelligently(line)
                processed_content += formatted + "\n\n"
        
        return processed_content
    
    def _final_cleanup(self, content: str) -> str:
        """Final cleanup of the converted content."""
        # Remove excessive empty lines
        content = re.sub(r'\n{3,}', '\n\n', content)
        
        # Fix broken words across lines
        content = re.sub(r'(\w)-\n(\w)', r'\1\2', content)
        
        # Ensure proper paragraph spacing
        content = re.sub(r'([.!?])\n([A-Z])', r'\1\n\n\2', content)
        
        # Clean up mathematical expressions that got split
        content = re.sub(r'`([^`]*)\n([^`]*)`', r'`\1 \2`', content)
        
        return content.strip()
    
    def _fallback_extraction(self, pdf_path: str) -> str:
        """Fallback method using PyPDF2."""
        try:
            with open(pdf_path, 'rb') as file:
                pdf_reader = PyPDF2.PdfReader(file)
                text = ""
                for page_num, page in enumerate(pdf_reader.pages, 1):
                    page_text = page.extract_text()
                    if page_text:
                        text += f"\n## Page {page_num}\n\n"
                        text += self._post_process_extracted_text(page_text)
                return self._final_cleanup(text)
        except Exception as e:
            print(f"Fallback extraction failed: {e}")
            return ""
    
    def convert_pdf(self, pdf_path: str, output_path: Optional[str] = None) -> str:
        """Convert PDF to markdown with advanced processing."""
        pdf_file = Path(pdf_path)
        if not pdf_file.exists():
            raise FileNotFoundError(f"PDF file not found: {pdf_path}")
        
        if output_path is None:
            output_file = pdf_file.with_stem(pdf_file.stem + '_advanced_conv').with_suffix('.md')
        else:
            output_file = Path(output_path)
        
        print(f"Converting with advanced processing: {pdf_file.name}")
        
        extracted_text = self.extract_text_advanced(str(pdf_file))
        
        if not extracted_text:
            raise Exception("Could not extract text from PDF")
        
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(extracted_text)
            print(f"✓ Advanced conversion completed: {output_file}")
            return str(output_file)
        except Exception as e:
            raise Exception(f"Error writing output file: {e}")

def main():
    parser = argparse.ArgumentParser(description="Advanced PDF to Markdown Converter")
    parser.add_argument("input", help="PDF file path")
    parser.add_argument("-o", "--output", help="Output markdown file path")
    
    args = parser.parse_args()
    
    converter = AdvancedPDFConverter()
    
    try:
        converter.convert_pdf(args.input, args.output)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) == 1:
        print("Usage: python pdf_converter_v2.py <pdf_file> [-o output.md]")
    else:
        main()
