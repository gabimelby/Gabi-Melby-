# Gabi-Melby-
Visual Studio Final Project

Uploaded the Main, Model, View, and Controller files. 
Used ChatGPT to help me with the syntax Mermaid and also for my controller, model, and view. I feel very confident with the classed
but I struggle with the actual syntax of dart and flutter.

# GameStats Class Diagram

```mermaid
classDiagram
    class GameStats {
        -int q1Kills
        -int q2Kills
        -int q3Kills
        -int q4Kills
        -int totalStops
        -bool isKillActive
        -int consecutiveStops
        +addStop() void
        +addKill(String quarter) void
        +reset() void
    }
