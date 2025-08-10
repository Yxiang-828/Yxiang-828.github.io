#!/usr/bin/env python3
"""
PDF to Text Converter
Converts PDF files to clean text files for easy reading and analysis.
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
        """Extract text using pdfplumber (better for tables and complex layouts)."""
        text = ""
        try:
            with pdfplumber.open(pdf_path) as pdf:
                for page_num, page in enumerate(pdf.pages, 1):
                    page_text = page.extract_text()
                    if page_text:
                        text += f"\n--- Page {page_num} ---\n"
                        text += page_text + "\n"
        except Exception as e:
            print(f"Error with pdfplumber: {e}")
            return ""
        return text
    
    def extract_text_pypdf2(self, pdf_path: str) -> str:
        """Extract text using PyPDF2 (faster, simpler extraction)."""
        text = ""
        try:
            with open(pdf_path, 'rb') as file:
                pdf_reader = PyPDF2.PdfReader(file)
                for page_num, page in enumerate(pdf_reader.pages, 1):
                    page_text = page.extract_text()
                    if page_text:
                        text += f"\n--- Page {page_num} ---\n"
                        text += page_text + "\n"
        except Exception as e:
            print(f"Error with PyPDF2: {e}")
            return ""
        return text
    
    def convert_pdf_to_text(self, pdf_path: str, output_path: Optional[str] = None) -> str:
        """
        Convert a single PDF to text.
        
        Args:
            pdf_path: Path to the PDF file
            output_path: Optional path for output text file. If None, creates .txt file next to PDF
            
        Returns:
            Path to the created text file
        """
        pdf_file = Path(pdf_path)
        
        if not pdf_file.exists():
            raise FileNotFoundError(f"PDF file not found: {pdf_file}")
        
        # Determine output path
        if output_path is None:
            output_file = pdf_file.with_suffix('.txt')
        else:
            output_file = Path(output_path)
        
        print(f"Converting: {pdf_file.name}")
        
        # Extract text
        if self.use_pdfplumber:
            text = self.extract_text_pdfplumber(str(pdf_file))
        else:
            text = self.extract_text_pypdf2(str(pdf_file))
        
        if not text.strip():
            print(f"Warning: No text extracted from {pdf_file.name}")
            text = f"No readable text found in {pdf_file.name}\n"
        
        # Clean up text
        text = self.clean_text(text)
        
        # Add header with file info
        header = f"PDF Source: {pdf_file.name}\n"
        header += f"Converted on: {self.get_timestamp()}\n"
        header += f"Method: {'pdfplumber' if self.use_pdfplumber else 'PyPDF2'}\n"
        header += "="*60 + "\n\n"
        
        final_text = header + text
        
        # Write to file
        try:
            with open(str(output_file), 'w', encoding='utf-8') as f:
                f.write(final_text)
            print(f"✓ Saved to: {output_file}")
            return str(output_file)
        except Exception as e:
            print(f"Error writing file: {e}")
            raise
    
    def clean_text(self, text: str) -> str:
        """Clean up extracted text."""
        # Remove excessive whitespace
        lines = text.split('\n')
        cleaned_lines = []
        
        for line in lines:
            line = line.strip()
            if line:  # Skip empty lines
                cleaned_lines.append(line)
        
        # Join with single newlines, but preserve page breaks
        result = ""
        for line in cleaned_lines:
            if line.startswith("--- Page"):
                result += "\n\n" + line + "\n"
            else:
                result += line + "\n"
        
        return result
    
    def get_timestamp(self) -> str:
        """Get current timestamp."""
        from datetime import datetime
        return datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    def batch_convert(self, input_folder: str, output_folder: Optional[str] = None):
        """
        Convert all PDF files in a folder.
        
        Args:
            input_folder: Folder containing PDF files
            output_folder: Optional output folder. If None, creates txt files next to PDFs
        """
        input_path = Path(input_folder)
        
        if not input_path.exists():
            raise FileNotFoundError(f"Input folder not found: {input_folder}")
        
        pdf_files = list(input_path.glob("*.pdf"))
        
        if not pdf_files:
            print(f"No PDF files found in {input_folder}")
            return
        
        print(f"Found {len(pdf_files)} PDF files")
        
        if output_folder:
            output_path = Path(output_folder)
            output_path.mkdir(exist_ok=True)
        
        for pdf_file in pdf_files:
            try:
                if output_folder:
                    output_file = Path(output_folder) / f"{pdf_file.stem}.txt"
                else:
                    output_file = None
                
                self.convert_pdf_to_text(str(pdf_file), str(output_file) if output_file else None)
                
            except Exception as e:
                print(f"Failed to convert {pdf_file.name}: {e}")
        
        print(f"\n✓ Batch conversion complete!")

def main():
    parser = argparse.ArgumentParser(description="Convert PDF files to text")
    parser.add_argument("input", help="PDF file or folder path")
    parser.add_argument("-o", "--output", help="Output file or folder path")
    parser.add_argument("-b", "--batch", action="store_true", help="Batch convert all PDFs in folder")
    parser.add_argument("--method", choices=['pdfplumber', 'pypdf2'], default='pdfplumber',
                       help="Extraction method (default: pdfplumber)")
    
    args = parser.parse_args()
    
    # Initialize converter
    use_pdfplumber = args.method == 'pdfplumber'
    converter = PDFConverter(use_pdfplumber=use_pdfplumber)
    
    try:
        if args.batch:
            converter.batch_convert(args.input, args.output)
        else:
            converter.convert_pdf_to_text(args.input, args.output)
            
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    # If no command line arguments, provide interactive mode
    if len(sys.argv) == 1:
        print("=== PDF to Text Converter ===")
        print("Usage examples:")
        print("  python pdf_converter.py file.pdf")
        print("  python pdf_converter.py file.pdf -o output.txt")
        print("  python pdf_converter.py folder/ -b")
        print("  python pdf_converter.py folder/ -b -o output_folder/")
        print()
        
        # Interactive mode
        pdf_path = input("Enter PDF file path (or drag and drop): ").strip().strip('"')
        
        if pdf_path and Path(pdf_path).exists():
            converter = PDFConverter(use_pdfplumber=True)
            try:
                output_file = converter.convert_pdf_to_text(pdf_path)
                print(f"\n✓ Conversion complete! Text saved to: {output_file}")
                input("\nPress Enter to exit...")
            except Exception as e:
                print(f"Error: {e}")
                input("\nPress Enter to exit...")
        else:
            print("Invalid file path!")
            input("\nPress Enter to exit...")
    else:
        main()
