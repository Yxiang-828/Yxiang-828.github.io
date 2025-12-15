# Portfolio - Yao Xiang

**Computer Engineering Student & Developer**
**Website:** [yxiang-828.github.io](https://yxiang-828.github.io/) | **GitHub:** [github.com/Yxiang-828](https://github.com/Yxiang-828)

---

## 🚀 Featured Projects

### [Wingman](https://github.com/Yxiang-828/Wingman)
**Role:** Core Developer | **Stack:** React, TypeScript, Electron, Python, SQLite
*A local-first AI personal assistant desktop app designed for privacy and productivity.*

*   **Key Features:**
    *   **Offline AI:** Runs local LLMs via Ollama for private, latency-free chat.
    *   **Productivity Suite:** Integrated task manager, calendar, and mood tracking.
    *   **Cross-Platform:** Built with Electron for seamless deployment on Windows/macOS/Linux.
*   **Context:** Developed for NUS Orbital Apollo 2025 (Team Project).

### [Helper Tools Collection](https://github.com/Yxiang-828/Helper_Tools)
**Role:** Sole Developer | **Stack:** Python, PowerShell, .NET, Batch
*A suite of high-performance CLI utilities designed for power users and developers.*

#### 1. File Scanner (Storage Optimizer)
*   **Tech:** PowerShell + .NET Framework APIs.
*   **Performance:** Scans **95,000+ files/second**.
*   **Algorithm:** Implements a **Min-Heap** data structure to identify the top K largest files with O(M log K) complexity.
*   **Impact:** 16-50x faster than standard Windows Explorer search.

#### 2. AI Image & Video Upscalers
*   **Tech:** Python, Real-ESRGAN, EDSR, Vulkan.
*   **Features:**
    *   Leverages **AMD GPU acceleration** via Vulkan.
    *   Upscales low-res media by 4x with detail restoration.
    *   Includes fallback to CPU/FFmpeg for compatibility.

#### 3. Audio Transcriber
*   **Tech:** OpenAI Whisper, DirectML.
*   **Features:** Offline speech-to-text transcription with GPU acceleration (3-5x faster than CPU).

#### 4. Video Automation Tools
*   **Video to GIF:** Automated conversion with strict size/speed constraints using MoviePy.
*   **Subtitle Extractor:** Batch extraction of embedded subtitles and audio tracks using FFmpeg.

### [Dual-Mode AV Disruptor](https://github.com/Yxiang-828/HacX-AV-Sensor-Disruptor)
**Role:** Team Member | **Stack:** Python, Raspberry Pi, CARLA, mmWave Radar
*A non-destructive prototype designed to halt hostile autonomous vehicles (AVs) by disrupting their perception sensors.*

*   **Context:** Built for **HacX Hackathon 2025** (HTX + Microsoft).
*   **Key Features:**
    *   **Dual-Mode Logic:** Implemented "Smoke Bomb" (chaotic pulses) for high-threat scenarios and "Smart Obstacle" (detection-triggered) for power efficiency.
    *   **Sensor Disruption:** Targeted LiDAR (1550nm laser) and Camera (850nm LEDs) sensors to force emergency stops.
    *   **Validation:** Achieved >80% stop rate in **CARLA simulations** and hardware tests at 15m range.

### [FPGA Graphic Calculator & Grapher](https://github.com/Yxiang-828/EE2026-Project-Vivado)
**Role:** Team Member (Keypad & Polynomial Solver) | **Stack:** Verilog, Vivado, Basys 3 FPGA
*A multifunction scientific calculator and 2D grapher implemented on an Artix-7 FPGA.*

*   **My Contributions:**
    *   **Polynomial Solver:** Designed a dedicated hardware module to solve cubic equations ($ax^3+bx^2+cx+d=0$).
        *   Implemented a **Newton-Raphson FSM** for iterative root finding.
        *   Used **Q22.14 fixed-point arithmetic** to ensure high precision during calculations.
        *   Integrated a **Babylonian Square Root** module for solving quadratic components.
    *   **Keypad Interface:** Engineered the complete input pipeline (`oled_keypad.v`), handling button debouncing, ASCII conversion, and OLED visualization of the keypad state.

### [FlowCLI](https://github.com/AY2526S1-CS2113-W13-2/tp)
**Role:** Team Lead | **Stack:** Java, JUnit, Gradle, GitHub Actions
*A fast, minimal CLI project task manager optimized for keyboard-driven workflows.*

*   **Context:** CS2113 Software Engineering Project (Brownfield Development).
*   **Key Features:**
    *   **Efficiency:** Designed for rapid task entry and management without mouse interaction.
    *   **Data Management:** Implemented robust filtering, sorting, and TXT export capabilities.
    *   **Quality Assurance:** Maintained 100% pass rate on CI/CD pipelines with comprehensive JUnit testing and Checkstyle enforcement.

---

## 🛠️ Technical Skills

| Category | Skills |
| :--- | :--- |
| **Languages** | Python, C/C++, Java, JavaScript, TypeScript, Verilog, PowerShell, Batch |
| **Frontend** | React, HTML5, CSS3, Tailwind CSS |
| **Backend** | Node.js, FastAPI, SQLite, Supabase |
| **Tools** | Git, Docker, Electron, Arduino, FFmpeg |
| **AI/ML** | OpenAI Whisper, Ollama, Real-ESRGAN |

---

## 🏆 Hackathons & Events

*   **NUS Orbital Apollo 2025:** Developing "Wingman", an advanced software engineering project.
*   *(Add other hackathons here as you join them)*

---

## 📚 Education

**National University of Singapore**
*Bachelor of Engineering (Computer Engineering)*
*   **GPA:** 4.5/5.0
*   **Expected Graduation:** 2028
