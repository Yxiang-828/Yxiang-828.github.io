# Hi, I'm Yao Xiang 

[![Profile Views](https://komarev.com/ghpvc/?username=Yxiang-828&color=blue)](https://github.com/Yxiang-828)

[Innovative Computer Engineering student at NUS (Year 2) bridging hardware and software worlds with Verilog, Arduino, C/C++, while pioneering AI automation and efficient systems through Python, Java, JavaScript, and TypeScript.]

 Website: https://yxiang-828.github.io/

##  Repos
- [Wingman](https://github.com/Yxiang-828/Wingman) - Personal Assistant Desktop App 
- [Helper Tools](https://github.com/Yxiang-828/Helper_Tools) - 8 CLI Tools (File Scanner, AI Upscalers, Media Processors) 
- [Repo 3]
- [Repo 4]
- [Repo 5]

##  Featured Project: Wingman

<img src="images/7409.png" width="400" alt="Wingman Screenshot">

This is my flagship project, showcasing expertise in **AI integration**, **full-stack development**, and **user-centric design** for productivity applications.

Wingman is a sophisticated, local-first personal assistant application for desktop, designed for productivity enthusiasts who value privacy and performance. It seamlessly integrates essential tools like a task manager, a multi-view calendar, and a mood-aware diary with a powerful **AI chat assistant**. The AI is powered by local LLMs through **Ollama**, ensuring all personal data and conversations remain on the user''s machine. Key features include a smart background notification system, automated recurring task generation, and extensive customization with six unique themes and AI personalities.

Notably, Wingman is a fully packaged, downloadable desktop application built with **Electron**, combining full-stack development (**React**/**TypeScript** frontend and **Python** backend) for a seamless, cross-platform user experience.

Architecturally, Wingman is a hybrid application built with **React**, **TypeScript**, and **Electron** for the frontend, and a **Python**/**FastAPI** backend for AI processing and data management. It features a robust local-first design using **SQLite**, with secure cloud authentication via **Supabase**. The project includes a complete, automated build system that handles Python environment setup and packages the entire application for cross-platform distribution, demonstrating a strong focus on both advanced functionality and a polished user experience.

##  Theme Backgrounds

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

[View on GitHub](https://github.com/Yxiang-828/Wingman) 

---

##  Featured Project: Helper Tools

**8 Production CLI Tools**  PowerShell + Python + .NET + AI Models

<div align="center">

### AI Image Upscaler  Real-ESRGAN + EDSR
GPU-accelerated (2-5s) | CPU fallback (15-30s)

<table>
<tr>
<td align="center"><b>Original</b></td>
<td align="center"><b>Real-ESRGAN 4x</b></td>
<td align="center"><b>EDSR 4x</b></td>
</tr>
<tr>
<td><img src="https://raw.githubusercontent.com/Yxiang-828/Helper_Tools/main/image_upscaler/samples/image.png" width="200"/></td>
<td><img src="https://raw.githubusercontent.com/Yxiang-828/Helper_Tools/main/image_upscaler/samples/realesrgan_1.png" width="200"/></td>
<td><img src="https://raw.githubusercontent.com/Yxiang-828/Helper_Tools/main/image_upscaler/samples/edsr_1.png" width="200"/></td>
</tr>
<tr>
<td colspan="3" align="center"><i>AMD Vulkan acceleration: 960x540  3840x2160 in 3.2s</i></td>
</tr>
</table>

### File Scanner  O(M log K) Min-Heap Algorithm
95,551 files scanned in 81s (1,173 files/sec avg, peaked at 8,821 files/sec)

```powershell
PS C:\> .\file_scanner.ps1 -FileType game -TopCount 10

================================================
    UNIVERSAL FILE SCANNER v2.0
================================================
Target Type  : GAME Files
Extensions   : .unity3d, .pak, .wad, .bsa, .esp, .esm

[81.4s] Found 95551 files | 1173 files/sec

Total Size (Top 10): 53.38 GB
  1. (11.61 GB) pakchunk26-WindowsNoEditor.pak
  2. (9.14 GB) pakchunk34-WindowsNoEditor.pak
```

**Tech**: `.NET System.IO.Directory.EnumerateFiles` + BFS + `SortedSet<T>` min-heap

### All 8 Tools

| Tool | Tech | Performance |
|------|------|-------------|
| **File Scanner** | .NET BFS + Min-Heap | 1,173-8,821 files/sec |
| **Image Upscaler** | Real-ESRGAN + Vulkan | 2-5s/image (GPU) |
| **Video Upscaler** | Real-ESRGAN + FFmpeg | Frame AI enhancement |
| **Subtitle/MP3 Extractor** | FFmpeg | Dual output |
| **Audio Transcriber** | Whisper AI | GPU 3-5x speedup |
| **Video to GIF** | MoviePy | Size optimization |
| **Unity Extractor** | UnityPy | .unity3d parsing |
| **S&B Extractor** | Custom parser | Game assets |

</div>

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
