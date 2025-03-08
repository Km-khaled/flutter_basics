# Flutter Internals

## Overview
This Flutter application is designed as an educational to understand the core internals of Flutter's rendering.

## Purpose
The main purpose of this app is to demonstrate and visualize:
- **Widget Tree**: The hierarchical structure of declarative UI elements
- **Element Tree**: The intermediate structure that manages widget lifecycle and state
- **Render Tree**: The actual rendering objects that paint to the screen

## Key Concepts Explored

### Widget Tree vs Element Tree vs Render Tree
This app provides visual examples of how these three trees interact during the Flutter rendering pipeline, including:
- How widgets are instantiated and converted to elements
- How elements maintain state between widget rebuilds
- How render objects optimize the actual drawing to screen

### Keys in Flutter
A significant focus of this application is demonstrating the importance of keys:
- Why keys are crucial for maintaining widget state during reordering
- How Flutter's diffing algorithm uses keys to identify widgets
- Practical examples showing problems that occur without keys
- Solutions using ValueKey, ObjectKey, UniqueKey, and GlobalKey

## How to Use
Navigate through different examples to see side-by-side comparisons of implementations with and without keys. Interactive elements allow you to:
- Reorder lists to see how keys affect state preservation
- Toggle between implementations to compare behavior
- View debug information about widget identity and state


## Getting Started
Run the app and follow the on-screen instructions to navigate through the various examples and demonstrations.