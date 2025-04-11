//Gabi Melby
//used chatgpt and deep seek to help me create my classes for my project. 
//also had them help me create my controller and models. 


import '../../models/game_stats.dart';

class KillTrackerController {
  final GameStats _gameStats = GameStats();
  String _currentQuarter = 'Q1';

  // Getters
  GameStats get gameStats => _gameStats;
  String get currentQuarter => _currentQuarter;
  bool get isKillActive => _gameStats.isKillActive;
  int get consecutiveStops => _gameStats.consecutiveStops;

  // Actions
  void changeQuarter(String quarter) {
    _currentQuarter = quarter;
  }

  void addStop() {
    _gameStats.addStop();
  }

  void addKill() {
    _gameStats.addKill(_currentQuarter);
  }

  void resetAll() {
    _gameStats.reset();
  }
}
