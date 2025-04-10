# Gabi-Melby-
Visual Studio Final Project

Uploaded the Main, Model, View, and Controller files. 


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
