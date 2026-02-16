import os
import re

def fix_styles():
    projects_dir = r'c:\Users\xiang\resume\Yxiang-828.github.io\projects'
    
    # The pattern matches any p tag containing Project Category
    # We use a more robust regex that doesn't depend on the exact style string
    pattern = r'<p[^>]*>\s*<strong>Project Category:</strong>\s*(.*?)</p>'
    
    # The new class-based element
    replacement_template = '<p class="project-category"><strong>Project Category:</strong> {}</p>'

    for filename in os.listdir(projects_dir):
        if filename.endswith(".html"):
            filepath = os.path.join(projects_dir, filename)
            
            try:
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                original_content = content
                
                if 'Project Category' in content:
                    # Simple regex to see what exactly is there
                    simple_match = re.search(r'<p[^>]*>.*?Project Category.*?</p>', content, re.DOTALL)
                    if simple_match:
                        print(f"DEBUG: Found match in {filename}: {simple_match.group(0)[:100]}...")
                    else:
                        print(f"DEBUG: 'Project Category' found in {filename} but regex failed.")
                
                if 'video-to-gif.html' in filename:
                    # Special handling for video-to-gif.html to remove duplicates
                    
                    # 1. Find the category text from the first occurrence (if any)
                    match = re.search(pattern, content)
                    category_text = "Individual Project (Personal Productivity Tool)" # Default fallback
                    if match:
                        category_text = match.group(1)
                    
                    # 2. Remove ALL occurrences of the pattern
                    content_after_removal = re.sub(pattern, '', content, flags=re.DOTALL)
                    
                    if content == content_after_removal:
                         print(f"DEBUG: sub(pattern, '', content) made NO change for {filename}. Pattern: {pattern}")
                         # Also check if pattern matches anything at all
                         if re.search(pattern, content, re.DOTALL):
                             print("DEBUG: But re.search DID find a match!")
                         else:
                             print("DEBUG: And re.search found nothing either.")
                    
                    content = content_after_removal
                    
                    # 3. Clean up any left over empty multiple newlines if any were created
                    # (optional, but good for cleanliness)
                    
                    # 4. Insert the new clean tag ONCE after the tech-stack
                    to_insert = replacement_template.format(category_text)
                    
                    # Look for the closing of tech-stack div
                    # We look for <div class="tech-stack"> ... </div>
                    # and append after it.
                    tech_stack_pattern = r'(<div class="tech-stack">.*?</div>)'
                    
                    if re.search(tech_stack_pattern, content, re.DOTALL):
                        # Use a regular string for the replacement pattern so \n is a newline,
                        # but we need to escape the backreference \1.
                        # Actually, better to use a lambda to avoid raw string confusion with newlines.
                        def replacement_func(match):
                            return match.group(1) + '\n        ' + to_insert
                            
                        content = re.sub(tech_stack_pattern, replacement_func, content, count=1, flags=re.DOTALL)
                    else:
                        print(f"Warning: Could not find tech-stack in {filename}")
                        
                else:
                    # Standard replacement for other files
                    if re.search(pattern, content):
                        content = re.sub(pattern, lambda m: replacement_template.format(m.group(1)), content)
                
                if content != original_content:
                    with open(filepath, 'w', encoding='utf-8') as f:
                        f.write(content)
                    print(f"Updated {filename}")
                else:
                    print(f"Skipping {filename}: No match found or no changes needed.")
                    
            except Exception as e:
                print(f"Error processing {filename}: {e}")

if __name__ == "__main__":
    fix_styles()
