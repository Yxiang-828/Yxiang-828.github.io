#!/usr/bin/env python3
"""
Simple Advanced PDF Converter
Just one function: convert any PDF to text with images, diagrams, and tables handled properly.
"""

import os
import sys
from pathlib import Path
import pdfplumber
import PyPDF2
from PIL import Image
import io

def convert_pdf(pdf_path):
    """
    Convert any PDF to clean text. Handles images, diagrams, tables automatically.
    
    Args:
        pdf_path (str): Path to PDF file
        
    Returns:
        str: Path to created text file
    """
    pdf_file = Path(pdf_path)
    
    if not pdf_file.exists():
        raise FileNotFoundError(f"PDF not found: {pdf_file}")
    
    # Output file path
    output_file = pdf_file.with_suffix('.txt')
    
    print(f"Converting: {pdf_file.name}")
    
    # Extract everything
    text_content = ""
    
    # Method 1: Try pdfplumber first (best for tables and layout)
    try:
        with pdfplumber.open(str(pdf_file)) as pdf:
            for page_num, page in enumerate(pdf.pages, 1):
                text_content += f"\n--- PAGE {page_num} ---\n"
                
                # Extract text
                page_text = page.extract_text()
                if page_text:
                    text_content += page_text + "\n"
                
                # Extract tables
                tables = page.extract_tables()
                if tables:
                    text_content += "\n[TABLES FOUND ON PAGE]\n"
                    for i, table in enumerate(tables, 1):
                        text_content += f"\nTable {i}:\n"
                        for row in table:
                            if row:
                                clean_row = [str(cell) if cell else "" for cell in row]
                                text_content += " | ".join(clean_row) + "\n"
                
                # Check for images
                if hasattr(page, 'images') and page.images:
                    text_content += f"\n[{len(page.images)} IMAGES/DIAGRAMS DETECTED ON PAGE]\n"
                
                text_content += "\n"
                
    except Exception as e:
        print(f"pdfplumber failed: {e}")
        # Fallback to PyPDF2
        try:
            with open(str(pdf_file), 'rb') as file:
                pdf_reader = PyPDF2.PdfReader(file)
                for page_num, page in enumerate(pdf_reader.pages, 1):
                    text_content += f"\n--- PAGE {page_num} ---\n"
                    page_text = page.extract_text()
                    if page_text:
                        text_content += page_text + "\n"
        except Exception as e2:
            text_content = f"Failed to extract text: {e2}\n"
    
    # Clean up text
    lines = text_content.split('\n')
    cleaned_lines = []
    
    for line in lines:
        line = line.strip()
        if line:
            cleaned_lines.append(line)
    
    # Join with proper spacing
    final_text = ""
    for i, line in enumerate(cleaned_lines):
        if line.startswith("--- PAGE"):
            final_text += "\n\n" + line + "\n"
        elif line.startswith("[") and line.endswith("]"):
            final_text += "\n" + line + "\n"
        else:
            final_text += line + "\n"
    
    # Add header
    header = f"PDF: {pdf_file.name}\n"
    header += f"Converted: {__import__('datetime').datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
    header += "="*60 + "\n\n"
    
    final_content = header + final_text
    
    # Save
    try:
        with open(str(output_file), 'w', encoding='utf-8') as f:
            f.write(final_content)
        print(f"✓ Saved: {output_file}")
        return str(output_file)
    except Exception as e:
        print(f"Error saving: {e}")
        raise

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python enhanced_pdf_converter.py <pdf_path>")
        sys.exit(1)
    
    try:
        output_path = convert_pdf(sys.argv[1])
        print(f"\nDone! Text saved to: {output_path}")
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)
