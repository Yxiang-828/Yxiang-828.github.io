#!/usr/bin/env python3
"""
PDF to Images Converter for AI Analysis
Converts PDF pages to high-quality PNG images that can be read by AI assistants.
"""

import pymupdf
import argparse
from pathlib import Path
from typing import Optional, List
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def convert_pdf_to_images(pdf_path: str, output_dir: Optional[str] = None, dpi: int = 150) -> List[Path]:
    """Convert PDF pages to PNG images."""
    pdf_file = Path(pdf_path)
    if not pdf_file.exists():
        raise FileNotFoundError(f"PDF not found: {pdf_path}")
    
    if output_dir is None:
        output_path = pdf_file.parent / f"{pdf_file.stem}_images"
    else:
        output_path = Path(output_dir)
    
    output_path.mkdir(exist_ok=True)
    
    # Open PDF
    doc = pymupdf.open(str(pdf_file))
    image_paths: List[Path] = []
    
    logger.info(f"Converting {len(doc)} pages to images (DPI: {dpi})")
    
    for page_num in range(len(doc)):
        page = doc[page_num]
        
        # Create high-quality image matrix
        mat = pymupdf.Matrix(dpi/72, dpi/72)  # Scale for DPI
        pix = page.get_pixmap(matrix=mat, alpha=False)
        
        # Save as PNG
        image_file = output_path / f"page_{page_num+1:02d}.png"
        pix.save(str(image_file))
        image_paths.append(image_file)
        
        logger.info(f"✓ Page {page_num+1} → {image_file.name}")
    
    doc.close()
    logger.info(f"✓ Conversion complete! Images saved to: {output_path}")
    return image_paths

def main():
    parser = argparse.ArgumentParser(description='Convert PDF to PNG images for AI analysis')
    parser.add_argument('pdf_path', help='Path to input PDF file')
    parser.add_argument('-o', '--output', help='Output directory (optional)')
    parser.add_argument('--dpi', type=int, default=150, help='Image resolution (default: 150)')
    
    args = parser.parse_args()
    
    try:
        image_paths = convert_pdf_to_images(args.pdf_path, args.output, args.dpi)
        print(f"✓ Created {len(image_paths)} images")
        print(f"First image: {image_paths[0] if image_paths else 'None'}")
    except Exception as e:
        print(f"✗ Conversion failed: {e}")

if __name__ == "__main__":
    main()
