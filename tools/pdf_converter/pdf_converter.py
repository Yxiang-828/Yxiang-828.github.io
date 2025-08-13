#!/usr/bin/env python3
"""
Professional PDF to Markdown Converter
Uses PyMuPDF (fitz) for superior text extraction, layout analysis, and mathematical content preservation.
Handles images, tables, mathematical expressions, and complex academic layouts properly.
"""

import os
import sys
import argparse
import re
import json
from pathlib import Path
from typing import Optional, List, Dict, Tuple, Any
import pymupdf  # PyMuPDF
import pandas as pd
from collections import defaultdict
import logging
from PIL import Image
import io

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# Optional OCR support
try:
    import pytesseract
    import cv2
    import numpy as np
    OCR_AVAILABLE = True
    logger.info("OCR support available (Tesseract)")
except ImportError as e:
    OCR_AVAILABLE = False
    logger.warning(f"OCR support not available: {e}")

class ProfessionalPDFConverter:
    def __init__(self, debug: bool = False):
        """Initialize professional PDF converter with PyMuPDF."""
        self.debug = debug
        self.image_counter = 0
        self.table_counter = 0
        
    def convert_pdf(self, pdf_path: str, output_path: Optional[str] = None) -> str:
        """Convert PDF to markdown with professional-grade processing."""
        pdf_file = Path(pdf_path)
        if not pdf_file.exists():
            raise FileNotFoundError(f"PDF file not found: {pdf_path}")
        
        if output_path is None:
            output_file = pdf_file.with_stem(pdf_file.stem + '_conv').with_suffix('.md')
        else:
            output_file = Path(output_path)
        
        logger.info(f"Converting PDF: {pdf_file.name}")
        
        try:
            # Open PDF with PyMuPDF
            pdf_document = pymupdf.open(str(pdf_file))
            markdown_content = self._process_pdf_document(pdf_document)
            pdf_document.close()
            
            # Write output
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(markdown_content)
            
            logger.info(f"✓ Conversion completed: {output_file}")
            return str(output_file)
            
        except Exception as e:
            logger.error(f"Conversion failed: {e}")
            raise
    
    def _process_pdf_document(self, pdf_doc) -> str:
        """Process entire PDF document with advanced extraction."""
        content = f"# PDF Content\n\n"
        
        for page_num in range(len(pdf_doc)):
            page = pdf_doc[page_num]
            
            logger.info(f"Processing page {page_num + 1}/{len(pdf_doc)}")
            
            page_content = self._process_page_advanced(page, page_num + 1)
            content += page_content
        
        return self._post_process_document(content)
    
    def _process_page_advanced(self, page, page_num: int) -> str:
        """Advanced page processing with PyMuPDF."""
        content = f"\n## Page {page_num}\n\n"
        
        # Get page dimensions
        rect = page.rect
        
        # Extract text blocks with detailed information
        text_blocks = page.get_text("dict")
        
        # Extract images
        image_content = self._extract_images(page, page_num)
        if image_content:
            content += image_content + "\n"
        
        # Extract and process text with layout preservation
        text_content = self._process_text_blocks_advanced(text_blocks, rect)
        content += text_content
        
        # Extract tables
        table_content = self._extract_tables_advanced(page, page_num)
        if table_content:
            content += table_content + "\n"
        
        return content
    
    def _extract_images(self, page, page_num: int) -> str:
        """Extract and analyze images from the page, including OCR when available."""
        image_list = page.get_images()
        if not image_list:
            return ""
        
        content = "### Images and Figures\n\n"
        
        for img_index, img in enumerate(image_list):
            self.image_counter += 1
            
            # Get image information
            xref = img[0]
            base_image = page.parent.extract_image(xref)
            image_bytes = base_image["image"]
            image_ext = base_image["ext"]
            
            # Get image position and size
            img_rects = page.get_image_rects(img)
            if img_rects:
                rect = img_rects[0]
                content += f"**Figure {self.image_counter}**: {image_ext.upper()} image "
                content += f"(Position: {rect.x0:.0f}, {rect.y0:.0f}, "
                content += f"Size: {rect.width:.0f}×{rect.height:.0f})\n\n"
            else:
                content += f"**Figure {self.image_counter}**: {image_ext.upper()} image\n\n"
            
            # Try to extract text from image using OCR
            if OCR_AVAILABLE and len(image_bytes) > 1000:  # Only process reasonably sized images
                try:
                    extracted_text = self._extract_text_from_image(image_bytes)
                    if extracted_text.strip():
                        content += f"*Image content (OCR):*\n```\n{extracted_text.strip()}\n```\n\n"
                    else:
                        content += "*Image appears to be graphical/diagram without readable text*\n\n"
                except Exception as e:
                    content += f"*Could not extract text from image: {str(e)}*\n\n"
            else:
                if not OCR_AVAILABLE:
                    content += "*OCR not available - install Tesseract for text extraction*\n\n"
                else:
                    content += "*Image too small for text extraction*\n\n"
        
        return content
    
    def _extract_text_from_image(self, image_bytes: bytes) -> str:
        """Extract text from image using OCR."""
        if not OCR_AVAILABLE:
            return ""
        
        try:
            # Re-import modules to ensure they're available
            import pytesseract
            import cv2
            import numpy as np
            
            # Convert bytes to PIL Image
            image = Image.open(io.BytesIO(image_bytes))
            
            # Convert to RGB if necessary
            if image.mode != 'RGB':
                image = image.convert('RGB')
            
            # Convert PIL Image to OpenCV format
            cv_image = cv2.cvtColor(np.array(image), cv2.COLOR_RGB2BGR)
            
            # Preprocess image for better OCR results
            gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
            
            # Apply thresholding to get better text contrast
            _, thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
            
            # Use Tesseract to extract text
            extracted_text = pytesseract.image_to_string(thresh, config='--psm 6')
            
            return self._clean_ocr_text(extracted_text)
            
        except Exception as e:
            logger.warning(f"OCR extraction failed: {e}")
            return ""
    
    def _clean_ocr_text(self, text: str) -> str:
        """Clean up OCR-extracted text."""
        if not text:
            return ""
        
        # Remove excessive whitespace
        text = re.sub(r'\s+', ' ', text)
        
        # Remove very short fragments (likely OCR noise)
        lines = text.split('\n')
        cleaned_lines = []
        
        for line in lines:
            line = line.strip()
            if len(line) > 2:  # Keep lines with more than 2 characters
                cleaned_lines.append(line)
        
        return '\n'.join(cleaned_lines)
    
    def _process_text_blocks_advanced(self, text_dict: Dict, page_rect) -> str:
        """Process text blocks with advanced layout analysis."""
        if not text_dict or "blocks" not in text_dict:
            return ""
        
        content = ""
        
        for block in text_dict["blocks"]:
            if "lines" not in block:  # Skip image blocks
                continue
            
            block_content = self._process_text_block(block, page_rect)
            if block_content.strip():
                content += block_content + "\n\n"
        
        return content
    
    def _process_text_block(self, block: Dict, page_rect) -> str:
        """Process individual text block with intelligent formatting."""
        lines = block.get("lines", [])
        if not lines:
            return ""
        
        # Reconstruct text from spans with proper spacing
        block_text = ""
        
        for line in lines:
            line_text = ""
            
            for span in line.get("spans", []):
                span_text = span.get("text", "").strip()
                if span_text:
                    # Add proper spacing between spans
                    if line_text and not line_text.endswith(" "):
                        line_text += " "
                    line_text += span_text
            
            if line_text.strip():
                block_text += line_text.strip() + "\n"
        
        # Clean and format the block
        return self._format_text_block_intelligently(block_text.strip())
    
    def _format_text_block_intelligently(self, text: str) -> str:
        """Intelligently format text blocks based on content analysis."""
        if not text:
            return ""
        
        # Clean up spacing
        text = re.sub(r'\s+', ' ', text)
        text = text.strip()
        
        # Split into lines for processing
        lines = [line.strip() for line in text.split('\n') if line.strip()]
        
        if not lines:
            return ""
        
        # Single line processing
        if len(lines) == 1:
            return self._format_single_line(lines[0])
        
        # Multi-line processing
        formatted_lines = []
        for line in lines:
            formatted_line = self._format_single_line(line)
            formatted_lines.append(formatted_line)
        
        # Join with appropriate spacing
        return '\n'.join(formatted_lines)
    
    def _format_single_line(self, line: str) -> str:
        """Format a single line based on its content type."""
        if not line:
            return ""
        
        # Detect and format headers
        if self._is_header(line):
            level = self._get_header_level(line)
            return f"{'#' * level} {line}"
        
        # Detect and format mathematical expressions
        if self._is_mathematical_expression(line):
            cleaned_math = self._clean_mathematical_notation(line)
            return f"`{cleaned_math}`"
        
        # Detect and format lists
        if self._is_list_item(line):
            cleaned_item = self._clean_list_item(line)
            return f"• {cleaned_item}"
        
        # Detect and format definitions or important statements
        if self._is_definition_or_important(line):
            return f"**{line}**"
        
        # Regular text
        return line
    
    def _is_header(self, text: str) -> bool:
        """Detect if text is a header."""
        if len(text) < 3 or len(text) > 120:
            return False
        
        # Section numbering patterns
        if re.match(r'^\d+(\.\d+)*[\s:]', text):
            return True
        
        # Topic/chapter patterns
        if re.match(r'^(Topic|Chapter|Section|Part)\s+\d+', text, re.IGNORECASE):
            return True
        
        # Definition patterns
        if re.match(r'^(Definition|Theorem|Lemma|Corollary|Proof)', text, re.IGNORECASE):
            return True
        
        # Short lines that are likely headers (title case or all caps)
        words = text.split()
        if len(words) <= 8 and (text.isupper() or text.istitle()):
            return True
        
        # Lines ending with colon (but not containing multiple colons)
        if text.endswith(':') and text.count(':') == 1:
            return True
        
        return False
    
    def _get_header_level(self, text: str) -> int:
        """Determine appropriate header level."""
        if re.match(r'^(Topic|Chapter)\s+\d+', text, re.IGNORECASE):
            return 2
        elif re.match(r'^\d+\.\d+\.\d+', text):
            return 4
        elif re.match(r'^\d+\.\d+', text):
            return 3
        elif re.match(r'^(Definition|Theorem|Lemma|Corollary)', text, re.IGNORECASE):
            return 3
        elif text.isupper() and len(text) < 50:
            return 2
        else:
            return 3
    
    def _is_mathematical_expression(self, text: str) -> bool:
        """Detect mathematical expressions with high accuracy."""
        # Mathematical symbols
        math_symbols = ['=', '≤', '≥', '≠', '≈', '∀', '∃', '∈', '∉', '∩', '∪', '⊕', '⊗', 
                       '∧', '∨', '¬', '→', '↔', '⇒', '⇔', '²', '³', '√', '∑', '∏', '∫']
        
        if any(symbol in text for symbol in math_symbols):
            return True
        
        # Function notation patterns
        if re.search(r'[A-Z][a-z]*\s*\([^)]*\)', text):
            return True
        
        # Subscript/superscript patterns
        if re.search(r'[A-Z]_[a-zA-Z0-9]|\d+\^[a-zA-Z0-9]', text):
            return True
        
        # Equation patterns
        if re.search(r'[A-Z]\s*=\s*[A-Z]', text):
            return True
        
        # Complex mathematical expressions
        if re.search(r'[A-Z]\([A-Z]\([^)]*\)\)', text):
            return True
        
        return False
    
    def _clean_mathematical_notation(self, text: str) -> str:
        """Clean and standardize mathematical notation."""
        # Fix function notation spacing
        text = re.sub(r'([A-Z][a-z]*)\s*\(\s*([^)]*)\s*\)', r'\1(\2)', text)
        
        # Fix subscripts
        text = re.sub(r'([A-Z][a-z]*)\s*_\s*([a-zA-Z0-9]+)', r'\1_{\2}', text)
        
        # Fix superscripts
        text = re.sub(r'(\d+)\s*\^\s*([a-zA-Z0-9]+)', r'\1^{\2}', text)
        
        # Fix nested functions
        text = re.sub(r'([A-Z])\s*\(\s*([A-Z])\s*\(\s*([^)]*)\s*\)\s*\)', r'\1(\2(\3))', text)
        
        # Fix operator spacing
        text = re.sub(r'\s*=\s*', ' = ', text)
        text = re.sub(r'\s*⊕\s*', ' ⊕ ', text)
        text = re.sub(r'\s*→\s*', ' → ', text)
        text = re.sub(r'\s*↔\s*', ' ↔ ', text)
        
        # Clean up spacing
        text = re.sub(r'\s+', ' ', text).strip()
        
        return text
    
    def _is_list_item(self, text: str) -> bool:
        """Detect list items."""
        # Common bullet points
        if re.match(r'^[•○▪▫‣⁃-]\s', text):
            return True
        
        # Numbered lists
        if re.match(r'^\d+[.)]\s', text):
            return True
        
        # Letter lists
        if re.match(r'^[a-zA-Z][.)]\s', text):
            return True
        
        return False
    
    def _clean_list_item(self, text: str) -> str:
        """Remove list markers from text."""
        return re.sub(r'^[•○▪▫‣⁃-]\s*|^\d+[.)]\s*|^[a-zA-Z][.)]\s*', '', text).strip()
    
    def _is_definition_or_important(self, text: str) -> bool:
        """Detect definitions or important statements."""
        # Definition patterns
        if re.search(r'\b(Definition|Theorem|Lemma|Corollary|Proof)\b', text, re.IGNORECASE):
            return True
        
        # Important terms in quotes
        if re.search(r'"[^"]*"', text) and len(text) < 100:
            return True
        
        # Key-value definitions
        if ':' in text and len(text) < 100 and not text.endswith(':'):
            return True
        
        return False
    
    def _extract_tables_advanced(self, page, page_num: int) -> str:
        """Extract tables using PyMuPDF's advanced table detection."""
        try:
            tables = page.find_tables()
            if not tables:
                return ""
            
            content = ""
            
            for table in tables:
                self.table_counter += 1
                content += f"### Table {self.table_counter}\n\n"
                
                # Extract table data
                table_data = table.extract()
                
                if table_data and len(table_data) > 0:
                    # Convert to pandas DataFrame for better handling
                    df = pd.DataFrame(table_data[1:], columns=table_data[0] if table_data[0] else None)
                    
                    # Clean the DataFrame
                    df = df.fillna('')
                    df = df.map(lambda x: str(x).strip() if x else '')
                    
                    # Convert to markdown table
                    markdown_table = self._dataframe_to_markdown(df)
                    content += markdown_table + "\n\n"
            
            return content
            
        except Exception as e:
            logger.warning(f"Table extraction failed on page {page_num}: {e}")
            return ""
    
    def _dataframe_to_markdown(self, df: pd.DataFrame) -> str:
        """Convert pandas DataFrame to clean markdown table."""
        if df.empty:
            return ""
        
        lines = []
        
        # Header row
        headers = [str(col).replace('|', '\\|') for col in df.columns]
        lines.append("| " + " | ".join(headers) + " |")
        
        # Separator row
        lines.append("| " + " | ".join("---" for _ in headers) + " |")
        
        # Data rows
        for _, row in df.iterrows():
            escaped_cells = [str(cell).replace('|', '\\|') for cell in row]
            lines.append("| " + " | ".join(escaped_cells) + " |")
        
        return "\n".join(lines)
    
    def _post_process_document(self, content: str) -> str:
        """Final document cleanup and optimization."""
        # Remove excessive empty lines
        content = re.sub(r'\n{3,}', '\n\n', content)
        
        # Fix broken words across lines
        content = re.sub(r'(\w)-\n(\w)', r'\1\2', content)
        
        # Ensure proper paragraph spacing
        content = re.sub(r'([.!?])\n([A-Z])', r'\1\n\n\2', content)
        
        # Fix header spacing
        content = re.sub(r'\n(#{1,6})\s*([^\n]+)\n([^\n#])', r'\n\1 \2\n\n\3', content)
        
        # Clean up mathematical expressions that got split
        content = re.sub(r'`([^`]*)\n([^`]*)`', r'`\1 \2`', content)
        
        # Remove trailing whitespace
        lines = content.split('\n')
        cleaned_lines = [line.rstrip() for line in lines]
        
        return '\n'.join(cleaned_lines).strip()

def main():
    parser = argparse.ArgumentParser(description="Professional PDF to Markdown Converter")
    parser.add_argument("input", help="PDF file path")
    parser.add_argument("-o", "--output", help="Output markdown file path")
    parser.add_argument("--debug", action="store_true", help="Enable debug logging")
    
    args = parser.parse_args()
    
    if args.debug:
        logging.getLogger().setLevel(logging.DEBUG)
    
    converter = ProfessionalPDFConverter(debug=args.debug)
    
    try:
        result = converter.convert_pdf(args.input, args.output)
        print(f"✓ Conversion completed successfully: {result}")
    except Exception as e:
        print(f"✗ Conversion failed: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) == 1:
        print("Professional PDF to Markdown Converter")
        print("Usage: python pdf_converter_professional.py <pdf_file> [-o output.md] [--debug]")
        print("\nExample:")
        print("  python pdf_converter_professional.py document.pdf")
        print("  python pdf_converter_professional.py document.pdf -o output.md")
    else:
        main()
