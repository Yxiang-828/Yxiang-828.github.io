from rembg import remove
from PIL import Image
import os
import sys

input_path = "c:/Users/xiang/resume/Yxiang-828.github.io/images/holo.png"
output_path = "c:/Users/xiang/resume/Yxiang-828.github.io/images/holo.png"

try:
    if os.path.exists(input_path):
        input_image = Image.open(input_path)
        
        # Resize if too large
        max_size = 400
        if max(input_image.size) > max_size:
            input_image.thumbnail((max_size, max_size), Image.Resampling.LANCZOS)
            
        print("Removing background...")
        try:
            output_image = remove(input_image)
            output_image.save(output_path)
            print("Background removed and image resized.")
        except Exception as e:
            print(f"Failed to use rembg: {e}. Falling back to color keying.")
            # Fallback (simple white removal)
            input_image = input_image.convert("RGBA")
            datas = input_image.getdata()
            new_data = []
            for item in datas:
                if item[0] > 240 and item[1] > 240 and item[2] > 240:
                    new_data.append((255, 255, 255, 0))
                else:
                    new_data.append(item)
            input_image.putdata(new_data)
            input_image.save(output_path)
    else:
        print("Holo image not found.")
except Exception as e:
    print(f"Error: {e}")
