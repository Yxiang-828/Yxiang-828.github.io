# CS2113 Project Guidelines

## SHOULD BUILD

| Category | Details |
|----------|---------|
| **Interface** | CLI-first — Typing-based input; GUI discouraged (okay only for visual feedback, not interaction) |
| **Platform** | Cross-platform (Windows, Mac, Linux) — must work on all without special setup |
| **Data** | Stored in human-editable local text file (.txt, .csv, .json) |
| **Architecture** | Object-Oriented Programming (OOP) in Java 17 |
| **Packaging** | Single .jar file (or one .zip file with .jar and required files) |
| **Users** | Single user only — no multi-user, no accounts, no login |
| **Libraries** | Only lightweight, open-source libraries with no extra installation and no accounts required |
| **Commands** | One-shot commands (e.g., `add task do homework /by Mon`) instead of multistep Q&A style |
| **Design Process** | Weekly increments (avoid doing all work in recess week!) |
| **Documentation** | Update both User Guide and Developer Guide; include at least 2 UML diagrams |
| **Testing** | Include automated tests (e.g., JUnit); no required coverage %, but should be reasonable |
| **Teamwork** | Work collaboratively, review each other's code, and divide tasks by features, not components |
| **Target User** | Must prefer typing and be optimized for them — e.g., developers, engineers, admins |

## SHOULD NOT BUILD

| Category | Details |
|----------|---------|
| **GUI** | Don't create a full GUI app (e.g., with buttons/forms) — it's discouraged and adds unnecessary workload |
| **Multi-user** | No multi-user setup, shared files, or collaborative real-time features |
| **DBMS** | No databases (e.g., no MySQL, PostgreSQL, SQLite) — use flat files only |
| **Remote servers** | Don't rely on online APIs or remote servers unless there's a fallback (data file alternative) |
| **Hard-to-test features** | Avoid features like login, image/audio processing, or anything needing Internet |
| **Huge files** | No bloated JARs (>100MB); no PDFs >15MB |
| **Incohesive features** | Don't throw in random features just for show — they must fit the app's purpose and user |

## PROJECT IDEAS

### Freelance Contact Manager
- **Target**: Freelance photographers or tutors who prefer fast keyboard workflows
- **Value**: Manage client contact info quickly through typed commands
- **Commands**: `addclient Alex /phone 91234567 /email alex@gmail.com /tags vip`, `findclient alex`, `deleteclient 3`

### Project Task Manager
- **Target**: Small project teams or university students managing assignments
- **Value**: Track deadlines, meetings, and milestones with keyboard-only interface
- **Commands**: `addtask tP submission /by 2025-10-01`, `mark 2`, `list pending`

### Flashcard Revision Tool
- **Target**: Students preparing for exams using spaced repetition
- **Value**: CLI tool for creating, reviewing, and rating flashcards
- **Commands**: `addcard What is polymorphism? /ans A feature in OOP allowing objects to take many forms`, `review`, `rate 1 easy`

### Inventory Tracker
- **Target**: Small-scale sellers or hobbyists (e.g., Etsy or Carousell sellers)
- **Value**: Quickly check and update stock of products without spreadsheets
- **Commands**: `additem Notebook /qty 20 /price 2.50`, `sell Notebook /qty 2`, `inventory low`

### Personal Journal
- **Target**: Writers or journaling enthusiasts who type faster than they write by hand
- **Value**: Quickly log entries by date, tag, and title in a searchable format
- **Commands**: `newentry 2025-09-02 /title Thoughts on CS2113 /tags school,tech`, `searchentry /tag tech`

### Habit Tracker
- **Target**: Self-quantifying individuals or productivity geeks
- **Value**: Track daily habits and visualize trends via CLI summary
- **Commands**: `addhabit drink water`, `markhabit drink water /date 2025-09-02`, `stats`

### Client Session Scheduler
- **Target**: Freelance coaches, therapists, or consultants
- **Value**: Schedule and view sessions, optimized for fast typists
- **Commands**: `addsession John Doe /on 2025-09-05 /at 4pm /duration 1h`, `viewsessions /week`
