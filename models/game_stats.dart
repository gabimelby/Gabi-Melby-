class GameStats {
  int q1Kills = 0;
  int q2Kills = 0;
  int q3Kills = 0;
  int q4Kills = 0;
  int totalStops = 0;
  bool isKillActive = false;
  int consecutiveStops = 0;

  void addStop() {
    totalStops++;
    consecutiveStops++;
    
    if (consecutiveStops >= 3) {
      isKillActive = true;
    }
  }

  void addKill(String quarter) {
    if (!isKillActive) return;
    
    switch (quarter) {
      case 'Q1':
        q1Kills++;
        break;
      case 'Q2':
        q2Kills++;
        break;
      case 'Q3':
        q3Kills++;
        break;
      case 'Q4':
        q4Kills++;
        break;
    }
    
    isKillActive = false;
    consecutiveStops = 0;
  }

  void reset() {
    q1Kills = 0;
    q2Kills = 0;
    q3Kills = 0;
    q4Kills = 0;
    totalStops = 0;
    isKillActive = false;
    consecutiveStops = 0;
  }
}