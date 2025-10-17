# Hi, I'm Yao Xiang 

[![Profile Views](https://komarev.com/ghpvc/?username=Yxiang-828&color=blue)](https://github.com/Yxiang-828)

[Innovative Computer Engineering student at NUS (Year 2) bridging hardware and software worlds with Verilog, Arduino, C/C++, while pioneering AI automation and efficient systems through Python, Java, JavaScript, and TypeScript.]

 Website: https://yxiang-828.github.io/

##  Repos
- [Wingman](https://github.com/Yxiang-828/Wingman) - AI Personal Assistant Desktop App 
- [Helper Tools](https://github.com/Yxiang-828/Helper_Tools) - 8 Production CLI Tools (File Scanner, AI Upscalers, Media Processors) 

---

## 🚀 Featured Project: Helper Tools

This is my flagship project, showcasing expertise in **performance optimization**, **algorithm design**, and **CLI tool development** for developer productivity.

Helper Tools is a curated collection of high-performance CLI utilities designed for advanced developers who prioritize speed, efficiency, and offline functionality. Built with a focus on minimal dependencies and maximum performance, these tools handle media processing, file system analysis, and automation tasks that would otherwise require complex setups or online services.

Key tools include:
- **Audio to Text Transcriber**: GPU-accelerated speech-to-text using OpenAI Whisper with DirectML for AMD GPUs, processing 20+ minute audio files in seconds
- **File Scanner**: 10-50x faster than Windows Explorer for finding large files, using min-heap algorithms and .NET APIs to scan entire drives in minutes
- **Video Subtitle & MP3 Extractor**: Extracts subtitles and audio from videos using FFmpeg with batch processing capabilities
- **AMD GPU Image/Video Upscaler**: AI-powered upscaling with Real-ESRGAN and Vulkan acceleration for 2x-4x resolution enhancement
- **Git Auto-Push**: One-command git workflow automation with timestamp tracking
- **Unity Image Extractor**: Extracts textures and sprites from Unity3D bundle files

Architecturally, the tools emphasize cross-platform compatibility (primarily Windows-focused), offline operation, and CLI superiority for automation. Each tool is optimized for specific hardware configurations (e.g., AMD RX GPUs) and includes detailed performance benchmarks, algorithmic analysis (O(M log K) complexity for file scanning), and comprehensive documentation. The collection demonstrates advanced programming techniques including direct .NET API integration, BFS traversal for filesystem operations, and GPU acceleration strategies, all while maintaining a philosophy of "speed first, offline by default."

[View on GitHub](https://github.com/Yxiang-828/Helper_Tools) 🔗

<details>
<summary><b> Theme Gallery</b></summary>

<div align="center">
<table>
<tr>
<td align="center"><img src="https://raw.githubusercontent.com/Yxiang-828/Wingman/main/src/assets/backgrounds/dark-theme.png" width="200" alt="Dark Theme"/><br/><b> Dark</b></td>
<td align="center"><img src="https://raw.githubusercontent.com/Yxiang-828/Wingman/main/src/assets/backgrounds/light-theme.png" width="200" alt="Light Theme"/><br/><b> Light</b></td>
<td align="center"><img src="https://raw.githubusercontent.com/Yxiang-828/Wingman/main/src/assets/backgrounds/yandere-theme.png" width="200" alt="Yandere Theme"/><br/><b> Yandere</b></td>
</tr>
<tr>
<td align="center"><img src="https://raw.githubusercontent.com/Yxiang-828/Wingman/main/src/assets/backgrounds/kuudere-theme.png" width="200" alt="Kuudere Theme"/><br/><b> Kuudere</b></td>
<td align="center"><img src="https://raw.githubusercontent.com/Yxiang-828/Wingman/main/src/assets/backgrounds/tsundere-theme.png" width="200" alt="Tsundere Theme"/><br/><b> Tsundere</b></td>
<td align="center"><img src="https://raw.githubusercontent.com/Yxiang-828/Wingman/main/src/assets/backgrounds/dandere-theme.png" width="200" alt="Dandere Theme"/><br/><b> Dandere</b></td>
</tr>
</table>
</div>

</details>

[View on GitHub](https://github.com/Yxiang-828/Wingman) 

---

##  Featured: Helper Tools

**8 Production CLI Tools** | PowerShell + Python + .NET + FFmpeg + AI Models

Built from scratch for media processing, file management, and AI enhancement. Optimized for speed and offline operation.

### File Scanner  Storage Optimization
**O(M log K) min-heap algorithm** scanning 95,000+ files in 81 seconds

```powershell
PS C:\> .\file_scanner.ps1 -FileType game -TopCount 10

================================================
    UNIVERSAL FILE SCANNER v2.0
================================================
Scan Root    : C:\
Target Type  : GAME Files
Extensions   : .unity3d, .pak, .wad, .bsa, .esp, .esm

[81.4s] Found 95551 files | Scanning at 1173 files/sec...

================================================
          SCAN COMPLETE!
================================================
Time Elapsed   : 81.45s
Files Found    : 95551 GAME Files
Total Size     : 53.38 GB (Top 10)

Top 10 largest files:
  1. (11.61 GB) pakchunk26-WindowsNoEditor.pak
  2. (9.14 GB) pakchunk34-WindowsNoEditor.pak
  3. (6.49 GB) pakchunk26-WindowsNoEditor.pak
```

**Tech**: .NET `System.IO.Directory.EnumerateFiles`, BFS traversal, `SortedSet<T>` min-heap

---

### AI Image Upscaler  GPU-Accelerated Enhancement
**Real-ESRGAN + EDSR** with AMD Vulkan acceleration (2-5s per image)

```powershell
PS C:\> image_upscaler.bat "blurry_photo.jpg"

========================================
     AMD GPU Image Upscaler
========================================
Input: C:\Photos\blurry_photo.jpg

Choose method:
1. Real-ESRGAN Vulkan (GPU - 2-5s)
2. EDSR OpenCV (CPU - 15-30s)

Enter 1 or 2: 1
Choose scale (2, 3, or 4): 4

[GPU] Processing with RealESRGAN_x4plus...
 Upscaled to 3840x2160 in 3.2s
Output: output/blurry_photo_4x.png
```

**Models**: RealESRGAN x4plus (GAN), EDSR x2/x3/x4 (CNN)

---

### Video Subtitle & MP3 Extractor  Dual Output
**FFmpeg automation** extracting embedded subtitles + audio

```powershell
PS C:\> extract_cc.bat "lecture.mp4"

================================================
   Video Subtitle & MP3 Extractor
================================================
Extracting from: lecture.mp4

[1/2] Extracting subtitles...
 Found subtitle track: English [eng]
 Saved: extracted_captions/lecture.srt

[2/2] Extracting audio...
 Saved: extracted_audio/lecture.mp3

Complete! 2 files generated in 4.3s
```

---

### Audio to Text Transcriber  Whisper AI
**OpenAI Whisper** with GPU acceleration (3-5x faster)

```powershell
PS C:\> mp3-to-txt.bat "podcast.mp3"

Choose model:
1. tiny (fast, lower accuracy)
2. base
3. small
4. medium (recommended)
5. large (best quality)

Enter 1-5: 4

[GPU Accelerated] Transcribing with medium model...
 Transcript saved: output_transcripts/podcast_transcript.md
Time: 2m 34s
```

---

### Video to GIF Converter  Size-Constrained Optimization
**MoviePy + Pillow** with automatic resolution scaling

```bash
PS C:\> mp4togif.bat

Input video: demo.mp4
Max file size (MB): 10
Speed ratio (1.0 = normal): 1.5

Optimizing...
 Generated: extracted_gifs/demo.gif
  Final size: 9.87 MB
  Speed: 1.5x
  Resolution: 480x270
```

---

###  All 8 Tools

| Tool | Tech | Performance |
|------|------|-------------|
| **File Scanner** | .NET BFS + Min-Heap | 1,173-8,821 files/sec |
| **Image Upscaler** | Real-ESRGAN + Vulkan | 2-5s per image (GPU) |
| **Video Upscaler** | Real-ESRGAN + FFmpeg | Frame-by-frame AI enhancement |
| **Subtitle/MP3 Extractor** | FFmpeg automation | Dual output streams |
| **Audio Transcriber** | Whisper AI (tiny-large) | GPU 3-5x speedup |
| **Video to GIF** | MoviePy + size optimization | Auto resolution scaling |
| **Unity Image Extractor** | UnityPy asset parsing | Batch .unity3d extraction |
| **S&B Asset Extractor** | Custom binary parser | Game asset extraction |

[View Repository](https://github.com/Yxiang-828/Helper_Tools) 

---

##  Tech Stack
![C](https://img.shields.io/badge/C-00599C?style=for-the-badge&logo=c&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![React](https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=react&logoColor=black)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
![C++](https://img.shields.io/badge/C%2B%2B-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Verilog](https://img.shields.io/badge/Verilog-000000?style=for-the-badge&logo=verilog&logoColor=white)
![Arduino](https://img.shields.io/badge/Arduino-00979D?style=for-the-badge&logo=arduino&logoColor=white)

##  Get in touch
-  Website: https://yxiang-828.github.io/
-  Email: xiangyao888@gmail.com
