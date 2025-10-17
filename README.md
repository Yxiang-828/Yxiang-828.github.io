﻿# Hi, I'm Yao Xiang 

[![Profile Views](https://komarev.com/ghpvc/?username=Yxiang-828&color=blue)](https://github.com/Yxiang-828)

[Innovative Computer Engineering student at NUS (Year 2) bridging hardware and software worlds with Verilog, Arduino, C/C++, while pioneering AI automation and efficient systems through Python, Java, JavaScript, and TypeScript.]

 Website: https://yxiang-828.github.io/

##  Repos
- [Wingman](https://github.com/Yxiang-828/Wingman) - Personal Assistant Desktop App 
- [Helper Tools](https://github.com/Yxiang-828/Helper_Tools) - 8 CLI Tools (File Scanner, AI Upscalers, Media Processors) 
- [Repo 3]
- [Repo 4]
- [Repo 5]

---

##  Personal Projects

### Wingman  AI Personal Assistant

<img src="images/7409.png" width="400" alt="Wingman Screenshot">

**Local-first desktop app** | React + TypeScript + Electron + Python/FastAPI

Task manager, calendar, mood diary with Ollama-powered AI chat. SQLite + Supabase auth. 6 custom themes. Full privacy, packaged cross-platform distribution.

<details>
<summary><b> Themes</b></summary>

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

[View Repository](https://github.com/Yxiang-828/Wingman) 

---

### Helper Tools  Self-Efficiency CLI Tools

**8 automation tools** | PowerShell + Python + .NET + AI Models

Built to solve daily workflow bottlenecks: find/delete large files, upscale images, extract video content, transcribe audio. Offline, fast, no GUI overhead.

#### AI Image Upscaler  Real-ESRGAN + EDSR

<div align="center">

| **Real-ESRGAN 4x (GPU 2-5s)** | **EDSR 4x (CPU 15-30s)** |
|:---:|:---:|
| ![Real-ESRGAN](https://raw.githubusercontent.com/Yxiang-828/Helper_Tools/main/image_upscaler/samples/realesrgan_1.png) | ![EDSR](https://raw.githubusercontent.com/Yxiang-828/Helper_Tools/main/image_upscaler/samples/edsr_1.png) |
| *Left: Blurry  Right: GAN upscaled* | *Left: Blurry  Right: CNN upscaled* |

AMD Vulkan acceleration. GAN for dramatic recovery, CNN for precise sharpening.

</div>

#### File Scanner  O(M log K) Min-Heap

```powershell
PS C:\> .\file_scanner.ps1 -FileType game -TopCount 10

Target Type  : GAME Files
Extensions   : .unity3d, .pak, .wad, .bsa, .esp, .esm

[81.4s] Found 95,551 files | 1,173 files/sec

Total Size (Top 10): 53.38 GB
  1. (11.61 GB) pakchunk26-WindowsNoEditor.pak
  2. (9.14 GB) pakchunk34-WindowsNoEditor.pak
```

.NET BFS traversal + SortedSet min-heap. Scans entire C:\ in ~2min vs Windows Explorer's 40min.

#### All 8 Tools

| Tool | Purpose | Tech |
|------|---------|------|
| **File Scanner** | Find/delete large files for storage cleanup | .NET + Min-Heap (1,173-8,821 files/sec) |
| **Image Upscaler** | Restore blurry images with AI | Real-ESRGAN + Vulkan (2-5s/image) |
| **Video Upscaler** | AI frame enhancement for videos | Real-ESRGAN + FFmpeg |
| **Subtitle/MP3 Extractor** | Extract embedded subs + audio from videos | FFmpeg automation |
| **Audio Transcriber** | Convert audio to text transcripts | Whisper AI (GPU 3-5x faster) |
| **Video to GIF** | Create size-optimized GIFs | MoviePy + auto-scaling |
| **Unity Extractor** | Extract assets from .unity3d files | UnityPy parser |
| **S&B Extractor** | Parse game asset bundles | Custom binary parser |

[View Repository](https://github.com/Yxiang-828/Helper_Tools) 

---

##  Experiences
- **[Internship/Job Title] @ [Company]** ([Dates])  [Description of your work and technologies used]
- **[Internship/Job Title] @ [Company]** ([Dates])  [Description of your work and technologies used]

##  Highlights & Hackathons
- **[Hackathon Name] [Year]**  [Project Name]
  [Brief description of the project and your role]
  [Repo Link]

- **[Hackathon Name] [Year]**  [Achievement, e.g., Finalist, Best Usage of Data]
- **[Hackathon Name] [Year]**  [Achievement]
- **[Hackathon Name] [Year]**  [Achievement]
- **[Hackathon Name] [Year]**  [Project Name]: [Description]

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
-  LinkedIn: [linkedin.com/in/yourprofile]
-  Email: xiangyao888@gmail.com
