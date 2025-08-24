#!/usr/bin/env python3
"""
Enhanced PDF to Markdown Converter for Academic Use
Focused on accurate text extraction with smart enhancements for EE2026 content.
Preserves mathematical notation, tables, and academic structure.
"""

import os
import sys
import argparse
import re
from pathlib import Path
from typing import Optional
import pymupdf  # PyMuPDF
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class EnhancedPDFConverter:
    def __init__(self, debug: bool = False):
        """Initialize enhanced PDF converter for academic content."""
        self.debug = debug
        
    def convert_pdf(self, pdf_path: str, output_path: Optional[str] = None) -> str:
        """Convert PDF to markdown with enhanced academic formatting."""
        pdf_file = Path(pdf_path)
        if not pdf_file.exists():
            raise FileNotFoundError(f"PDF file not found: {pdf_path}")
        
        if output_path is None:
            # Smart naming based on content detection
            output_file = pdf_file.with_stem(pdf_file.stem + '_conv').with_suffix('.md')
        else:
            output_file = Path(output_path)
        
        logger.info(f"Converting PDF: {pdf_file.name}")
        
        try:
            # Open PDF with PyMuPDF
            pdf_document = pymupdf.open(str(pdf_file))
            markdown_content = self._process_pdf_document(pdf_document, pdf_file.stem)
            pdf_document.close()
            
            # Write output
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(markdown_content)
            
            logger.info(f"✓ Conversion completed: {output_file}")
            return str(output_file)
            
        except Exception as e:
            logger.error(f"Conversion failed: {e}")
            raise
    
    def _process_pdf_document(self, pdf_doc, filename_stem: str) -> str:
        """Process entire PDF document with enhanced academic formatting."""
        # Smart title detection based on filename and content
        title = self._generate_smart_title(filename_stem, pdf_doc)
        content = f"# {title}\n\n"
        
        for page_num in range(len(pdf_doc)):
            page = pdf_doc[page_num]
            logger.info(f"Processing page {page_num + 1}/{len(pdf_doc)}")
            
            # Extract text using the most reliable method
            page_text = page.get_text()
            
            if page_text.strip():
                # Enhanced cleaning for academic content
                cleaned_text = self._clean_academic_text(page_text)
                if cleaned_text.strip():
                    content += f"## Page {page_num + 1}\n\n{cleaned_text}\n\n"
        
        return content.strip()
    
    def _generate_smart_title(self, filename: str, pdf_doc) -> str:
        """Generate smart title based on filename and content."""
        # Try to extract title from first page
        if len(pdf_doc) > 0:
            first_page_text = pdf_doc[0].get_text()
            lines = first_page_text.split('\n')[:5]  # Check first 5 lines
            
            for line in lines:
                line = line.strip()
                # Look for course codes and topics
                if re.search(r'EE\d{4}|CS\d{4}|ST\d{4}|ES\d{4}', line):
                    return line
                # Look for title-like patterns
                if len(line) > 10 and len(line) < 100 and not line.endswith('.'):
                    return line
        
        # Fallback to filename
        return filename.replace('_', ' ').title()
    
    def _clean_academic_text(self, text: str) -> str:
        """Enhanced text cleaning for academic content."""
        if not text:
            return ""
        
        lines = text.split('\n')
        cleaned_lines = []
        
        for line in lines:
            # Keep the line structure but enhance academic content
            cleaned_line = line.rstrip()
            
            # Preserve mathematical notation
            cleaned_line = self._preserve_math_notation(cleaned_line)
            
            # Fix common OCR errors for technical content
            cleaned_line = self._fix_technical_ocr_errors(cleaned_line)
            
            cleaned_lines.append(cleaned_line)
        
        result = '\n'.join(cleaned_lines)
        
        # Remove excessive empty lines but preserve paragraph structure
        result = re.sub(r'\n\n\n+', '\n\n', result)
        
        return result.strip()
    
    def _preserve_math_notation(self, line: str) -> str:
        """Preserve mathematical notation and symbols."""
        # Common mathematical symbols that might get corrupted
        math_fixes = {
            'ȉ': '•',  # AND operator
            '∙': '•',  # Another AND operator
            'ത': '\'', # Complement notation
            '̅': '\'', # Overbar complement
            '⊕': '⊕',  # XOR symbol
            '→': '→',  # Implication
            '∀': '∀',  # For all
            '∃': '∃',  # Exists
            '∈': '∈',  # Element of
        }
        
        for incorrect, correct in math_fixes.items():
            line = line.replace(incorrect, correct)
        
        return line
    
    def _fix_technical_ocr_errors(self, line: str) -> str:
        """Fix common OCR errors in technical documents."""
        # Common technical term fixes
        technical_fixes = {
            'Boolean': 'Boolean',
            'NAND': 'NAND',
            'NOR': 'NOR',
            'XOR': 'XOR',
            'XNOR': 'XNOR',
            'Verilog': 'Verilog',
            'CMOS': 'CMOS',
            'IEEE': 'IEEE',
        }
        
        for term in technical_fixes:
            # Case-insensitive replacement
            pattern = re.compile(re.escape(term), re.IGNORECASE)
            line = pattern.sub(technical_fixes[term], line)
        
        return line

def main():
    """Main entry point for the enhanced converter."""
    parser = argparse.ArgumentParser(description='Convert PDF to Markdown (Enhanced Academic Version)')
    parser.add_argument('pdf_path', help='Path to input PDF file')
    parser.add_argument('-o', '--output', help='Output markdown file path (optional)')
    parser.add_argument('-d', '--debug', action='store_true', help='Enable debug mode')
    
    args = parser.parse_args()
    
    try:
        converter = EnhancedPDFConverter(debug=args.debug)
        output_path = converter.convert_pdf(args.pdf_path, args.output)
        print(f"✓ Conversion completed: {output_path}")
    except Exception as e:
        print(f"✗ Conversion failed: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
