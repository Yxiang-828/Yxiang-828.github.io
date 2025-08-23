#!/usr/bin/env python3
"""
Clean and Simple PDF to Markdown Converter
Focused on accurate text extraction with minimal formatting interference.
Preserves original layout and mathematical notation without over-processing.
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

class SimplePDFConverter:
    def __init__(self, debug: bool = False):
        """Initialize simple PDF converter."""
        self.debug = debug
        
    def convert_pdf(self, pdf_path: str, output_path: Optional[str] = None) -> str:
        """Convert PDF to markdown with clean text extraction."""
        pdf_file = Path(pdf_path)
        if not pdf_file.exists():
            raise FileNotFoundError(f"PDF file not found: {pdf_path}")
        
        if output_path is None:
            output_file = pdf_file.with_stem(pdf_file.stem + '_simple_conv').with_suffix('.md')
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
        """Process entire PDF document with clean extraction."""
        content = f"# EE2026 Tutorial 2 - Questions\n\n"
        
        for page_num in range(len(pdf_doc)):
            page = pdf_doc[page_num]
            logger.info(f"Processing page {page_num + 1}/{len(pdf_doc)}")
            
            # Extract text using the simplest, most reliable method
            page_text = page.get_text()
            
            if page_text.strip():
                # Clean the text minimally
                cleaned_text = self._clean_text_minimal(page_text)
                if cleaned_text.strip():
                    content += f"## Page {page_num + 1}\n\n{cleaned_text}\n\n"
        
        return content.strip()
    
    def _clean_text_minimal(self, text: str) -> str:
        """Minimal text cleaning to preserve original structure."""
        if not text:
            return ""
        
        # Remove excessive empty lines but preserve structure
        lines = text.split('\n')
        cleaned_lines = []
        
        for line in lines:
            # Keep the line as-is, just strip trailing whitespace
            cleaned_line = line.rstrip()
            cleaned_lines.append(cleaned_line)
        
        # Join lines back together
        result = '\n'.join(cleaned_lines)
        
        # Remove only truly excessive empty lines (3+ consecutive)
        result = re.sub(r'\n\n\n+', '\n\n', result)
        
        return result.strip()

def main():
    """Main entry point for the converter."""
    parser = argparse.ArgumentParser(description='Convert PDF to Markdown (Simple Version)')
    parser.add_argument('pdf_path', help='Path to input PDF file')
    parser.add_argument('-o', '--output', help='Output markdown file path (optional)')
    parser.add_argument('-d', '--debug', action='store_true', help='Enable debug mode')
    
    args = parser.parse_args()
    
    try:
        converter = SimplePDFConverter(debug=args.debug)
        output_path = converter.convert_pdf(args.pdf_path, args.output)
        print(f"✓ Conversion completed: {output_path}")
    except Exception as e:
        print(f"✗ Conversion failed: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
