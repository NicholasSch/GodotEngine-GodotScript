# 🐔 Retro Freeway — Godot Engine Implementation

A fully functional, modern 2D reconstruction of the classic arcade action game *Freeway*, built natively inside the **Godot Game Engine**.

This repository contains both a **ready-to-play standalone desktop executable** and the complete **source code project space** for developers looking to modify or study the codebase.

---

## 📄 Project Overview

This implementation focuses on classic arcade synchronization mechanics translated into Godot's node-and-signal component architecture. The game tracks a multi-lane highway system processing two independent player instances simultaneously in a split-screen configuration. As obstacles (Cars) spawn randomly across fast and slow lanes at varying speeds, players must time their vertical movements to cross the highway safely. Reaching the upper finish boundary increments player scores and triggers audio cues, while collisions reset player positions instantly. The match concludes definitively when a player accumulates 2 points.

### Core Architecture Features
* **Asynchronous Spawn Architecture:** Leverages decoupled timer nodes (`TimerCarrosRapido` and `TimerCarrosLento`) to procedurally instantiate obstacle variants across multi-lane array grids without dropping framerates.
* **Deterministic Signal Routing:** Employs Godot's optimized inter-node signal connection model to manage game states safely across different layers (HUD, Player Entities, and Main Control Node).
* **Frame-Rate Independent Physics:** Utilizes delta-time multiplication loops within the player process routines to guarantee perfectly uniform movement physics across various monitor refresh rates.

---

## 📂 Project Architecture

The core project assets, configurations, and ready-to-run files are organized into the following directory structure:

```text
Freeway/
│
├── Build/                          # 🚀 Ready-to-Play Standalone Executable
│   └── (Contains pre-compiled desktop game files)
│
└── Source/                         # 🛠️ Source Code Project Space (Godot Editor)
    ├── Prefabs/                    # 📦 Component objects for actors and interface layers
    │   ├── core/
    │   │   ├── Player1.tscn
    │   │   └── PLayer2.tscn
    │   └── objects/
    │       ├── Car.tscn  
    │       ├── FinishLine.tscn
    │       └── HUD.tscn        
    │
    ├── Scripts/
    │   ├── Car.gd                  # Obstacle initialization and auto-free logic
    │   ├── HUD.gd                  # UI signal routing and interaction processing
    │   ├── Main.gd                 # Main match lifecycle state controller
    │   ├── Player1.gd              # Player 1 physics translation engine
    │   └── Player2.gd              # Player 2 physics translation engine
    │
    ├── Assets/
    │   ├── Sounds/                 # 🎵 SFX & Soundtrack Layer Arrays
    │   │   ├── collision.mp3       # Car crash sound effect
    │   │   ├── score.mp3           # Scoring goal sound effect
    │   │   ├── theme.mp3           # Ambient background tracking music
    │   │   └── victory.mp3         # Game over win celebration loop
    │   │
    │   └── Sprites/                # 🎨 Animated Frame Asset Collections
    │       ├── chicken
    │       └── cars
    │
    ├── icon.svg                    # Project brand asset marker
    └── project.godot               # Core engine settings, input maps, and window bounds
```

---

## 🎮 Game Controls & Mechanics

The game architecture maps hardware inputs directly to both player instances, allowing for local 1v1 split-keyboard matches:

### 🕹️ Player 1 Controls (Left Side)
* **`W` Key:** Moves the character upward toward the finish line lane.
* **`S` Key:** Moves the character downward to retreat from oncoming vehicles.

### 🕹️ Player 2 Controls (Right Side)
* **`Up Arrow` Key:** Moves the character upward toward the finish line lane.
* **`Down Arrow` Key:** Moves the character downward to retreat from oncoming vehicles.

---

## 🚀 How to Play & Run the Project

### Option A: Play Instantly (No Godot Editor Required)
You do not need to download or install the full Godot Engine editor suite to run the game. A pre-compiled build is provided directly in the repository:
1. Clone or download this repository folder layout as a `.zip` file to your local computer.
2. Open the root workspace folder and navigate into the `Build/` directory.
3. Double-click the game executable binary `Freeway.exe` to launch and play immediately!

### Option B: Open Source Code (For Developers Only)
If you want to modify scripts, alter car spawning frequencies, or update user interface styles:
1. Launch the **Godot Engine Editor** (Version 4.x recommended matching code standards).
2. Click **Import**, navigate to the inner `Source/` folder directory, and select the `project.godot` file.
3. Open the project tree and wait for the asset rendering engine to pre-compile layout elements.
4. Double-click the primary gameplay scene template inside the file system dock to load the highway stage structure directly into your working window workspace.
```