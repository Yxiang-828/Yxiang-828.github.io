#!/usr/bin/env python3
"""
PDF to Markdown Converter
Converts PDF files to clean markdown files with table extraction and image analysis.
Supports both single files and batch processing.
"""

import os
import sys
import argparse
from pathlib import Path
import pdfplumber
import PyPDF2
from typing import Optional

class PDFConverter:
    def __init__(self, use_pdfplumber: bool = True):
        """
        Initialize PDF converter.
        
        Args:
            use_pdfplumber: If True, use pdfplumber (better for complex layouts).
                           If False, use PyPDF2 (faster but simpler extraction).
        """
        self.use_pdfplumber = use_pdfplumber
    
    def extract_text_pdfplumber(self, pdf_path: str) -> str:
        """Extract text using pdfplumber with markdown formatting and table extraction."""
        markdown_content = ""
        try:
            with pdfplumber.open(pdf_path) as pdf:
                for page_num, page in enumerate(pdf.pages, 1):
                    markdown_content += f"\n## Page {page_num}\n\n"
                    
                    # Extract tables first
                    tables = page.extract_tables()
                    if tables:
                        for i, table in enumerate(tables, 1):
                            markdown_content += f"### Table {i}\n\n"
                            if table:
                                # Convert table to markdown format
                                for row_idx, row in enumerate(table):
                                    if row:  # Skip empty rows
                                        row_text = " | ".join(str(cell) if cell else "" for cell in row)
                                        markdown_content += f"| {row_text} |\n"
                                        if row_idx == 0:  # Add header separator
                                            separator = " | ".join("---" for _ in row)
                                            markdown_content += f"| {separator} |\n"
                                markdown_content += "\n"
                    
                    # Extract images and visual elements
                    images = page.images
                    if images:
                        markdown_content += f"### Visual Elements on Page {page_num}\n\n"
                        for i, img in enumerate(images, 1):
                            x0, y0, x1, y1 = img['x0'], img['y0'], img['x1'], img['y1']
                            width = x1 - x0
                            height = y1 - y0
                            markdown_content += f"- **Image {i}**: Position ({x0:.1f}, {y0:.1f}), Size: {width:.1f} x {height:.1f}\n"
                        markdown_content += "\n"
                    
                    # Extract regular text
                    page_text = page.extract_text()
                    if page_text:
                        # Clean up text and format for markdown
                        lines = page_text.split('\n')
                        for line in lines:
                            line = line.strip()
                            if line:
                                # Simple heuristic for headers (lines in ALL CAPS or short lines)
                                if len(line) < 60 and (line.isupper() or line.count(' ') < 3):
                                    markdown_content += f"### {line}\n\n"
                                else:
                                    markdown_content += f"{line}\n\n"
                    
        except Exception as e:
            print(f"Error with pdfplumber: {e}")
            return ""
        return markdown_content
    
    def extract_text_pypdf2(self, pdf_path: str) -> str:
        """Extract text using PyPDF2 (faster, simpler extraction)."""
        text = ""
        try:
            with open(pdf_path, 'rb') as file:
                pdf_reader = PyPDF2.PdfReader(file)
                for page_num, page in enumerate(pdf_reader.pages, 1):
                    page_text = page.extract_text()
                    if page_text:
                        text += f"\n## Page {page_num}\n\n"
                        text += page_text + "\n\n"
        except Exception as e:
            print(f"Error with PyPDF2: {e}")
            return ""
        return text
    
    def convert_pdf_to_text(self, pdf_path: str, output_path: Optional[str] = None) -> str:
        """
        Convert PDF to markdown format.
        
        Args:
            pdf_path: Path to the PDF file
            output_path: Optional path for output markdown file. If None, creates .md file next to PDF
            
        Returns:
            Path to the created markdown file
        """
        pdf_file = Path(pdf_path)
        if not pdf_file.exists():
            raise FileNotFoundError(f"PDF file not found: {pdf_path}")
        
        # Determine output file path
        if output_path is None:
            output_file = pdf_file.with_stem(pdf_file.stem + '_conv').with_suffix('.md')
        else:
            output_file = Path(output_path)
        
        print(f"Converting: {pdf_file.name}")
        
        # Extract text using the preferred method
        if self.use_pdfplumber:
            extracted_text = self.extract_text_pdfplumber(str(pdf_file))
            if not extracted_text:  # Fallback to PyPDF2 if pdfplumber fails
                print("pdfplumber failed, trying PyPDF2...")
                extracted_text = self.extract_text_pypdf2(str(pdf_file))
        else:
            extracted_text = self.extract_text_pypdf2(str(pdf_file))
        
        if not extracted_text:
            raise Exception("Could not extract text from PDF")
        
        # Clean up the text
        cleaned_text = self._clean_text(extracted_text)
        
        # Write to output file
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(cleaned_text)
            print(f"✓ Converted successfully: {output_file}")
            return str(output_file)
        except Exception as e:
            raise Exception(f"Error writing output file: {e}")
    
    def _clean_text(self, text: str) -> str:
        """Clean and format the extracted text."""
        # Remove excessive whitespace
        lines = text.split('\n')
        cleaned_lines = []
        
        for line in lines:
            line = line.strip()
            if line:  # Only keep non-empty lines
                cleaned_lines.append(line)
            elif cleaned_lines and cleaned_lines[-1]:  # Add single empty line between paragraphs
                cleaned_lines.append('')
        
        return '\n'.join(cleaned_lines)
    
    def convert_folder(self, folder_path: str, output_folder: Optional[str] = None) -> list:
        """
        Convert all PDF files in a folder.
        
        Args:
            folder_path: Path to folder containing PDF files
            output_folder: Optional output folder. If None, creates text files next to PDFs
            
        Returns:
            List of paths to created markdown files
        """
        folder = Path(folder_path)
        if not folder.exists():
            raise FileNotFoundError(f"Folder not found: {folder_path}")
        
        pdf_files = list(folder.glob("*.pdf"))
        if not pdf_files:
            print("No PDF files found in the folder.")
            return []
        
        # Create output directory if specified
        if output_folder:
            output_path = Path(output_folder)
            output_path.mkdir(exist_ok=True)
        
        converted_files = []
        for pdf_file in pdf_files:
            try:
                if output_folder:
                    output_file = Path(output_folder) / f"{pdf_file.stem}_conv.md"
                    result = self.convert_pdf_to_text(str(pdf_file), str(output_file))
                else:
                    result = self.convert_pdf_to_text(str(pdf_file))
                converted_files.append(result)
            except Exception as e:
                print(f"✗ Error converting {pdf_file.name}: {e}")
        
        print(f"\nConverted {len(converted_files)} out of {len(pdf_files)} files.")
        return converted_files

def main():
    parser = argparse.ArgumentParser(description="Convert PDF files to markdown format")
    parser.add_argument("input", help="PDF file or folder path")
    parser.add_argument("-o", "--output", help="Output file or folder path")
    parser.add_argument("-b", "--batch", action="store_true", 
                       help="Batch mode: treat input as folder")
    parser.add_argument("--pypdf2", action="store_true", 
                       help="Use PyPDF2 instead of pdfplumber (faster but simpler)")
    
    args = parser.parse_args()
    
    # Create converter instance
    converter = PDFConverter(use_pdfplumber=not args.pypdf2)
    
    try:
        if args.batch or Path(args.input).is_dir():
            # Batch conversion
            converter.convert_folder(args.input, args.output)
        else:
            # Single file conversion
            converter.convert_pdf_to_text(args.input, args.output)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

def show_help():
    """Display help information."""
    print("PDF to Markdown Converter")
    print("=" * 50)
    print("\nUsage:")
    print("  python pdf_converter.py <pdf_file>")
    print("  python pdf_converter.py <pdf_file> -o output.md")
    print("  python pdf_converter.py <folder> -b")
    print("  python pdf_converter.py <folder> -b -o output_folder")
    print("\nExamples:")
    print("  python pdf_converter.py document.pdf")
    print("  python pdf_converter.py document.pdf -o converted.md")
    print("  python pdf_converter.py ./pdfs/ -b")
    print("  python pdf_converter.py ./pdfs/ -b -o ./converted/")

if __name__ == "__main__":
    if len(sys.argv) == 1:
        show_help()
    else:
        main()