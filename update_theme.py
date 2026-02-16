import os

files_to_update = [
    "wingman.html",
    "image-upscaler.html",
    "video-upscaler.html",
    "video-to-gif.html",
    "audio-transcriber.html",
    "subtitle-extractor.html",
    "file-scanner.html",
    "unity-extractor.html"
]

base_path = "c:/Users/xiang/resume/Yxiang-828.github.io/"

holo_snippet = """
    <!-- Holo Companion -->
    <div id="holo-container" onclick="holoInteract(this)">
        <div class="holo-dialog-box">
            <p id="holo-text">Traveler...</p>
        </div>
        <img src="images/holo.png" alt="Holo" class="holo-sprite">
    </div>

    <script src="script.js?v=2"></script>
</body>
"""

for fname in files_to_update:
    path = os.path.join(base_path, fname)
    if not os.path.exists(path):
        print(f"Skipping {fname} (not found)")
        continue
        
    print(f"Updating {fname}...")
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
        
    # Replacements for Theme
    # Cyan -> Red
    content = content.replace("#00d4ff", "#ff4444")
    # Dark Blue -> Dark Red/Maroon
    content = content.replace("#090979", "#8b0000")
    # Dark Backgrounds (Blueish) -> Dark Backgrounds (Reddish)
    content = content.replace("rgba(15, 15, 35,", "rgba(20, 5, 5,")
    content = content.replace("rgba(0, 212, 255,", "rgba(255, 68, 68,") # Cyan RGBA replacement
    content = content.replace("#1a1a3e", "#2b0000") # Tertiary
    
    # Inject Holo if not present
    if "holo-container" not in content:
        # Replace closing body tag
        if "</body>" in content:
            # Check for existing script tag to avoid duplication
            if '<script src="script.js"></script>' in content:
                content = content.replace('<script src="script.js"></script>', '')
            if '<script src="script.js?v=2"></script>' in content:
                content = content.replace('<script src="script.js?v=2"></script>', '')
                
            content = content.replace("</body>", holo_snippet)
            
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

print("All files updated.")
