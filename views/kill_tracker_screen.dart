import 'package:flutter/material.dart';
import '../../controllers/kill_tracker_controller.dart';

class KillTrackerScreen extends StatefulWidget {
  const KillTrackerScreen({super.key});

  @override
  State<KillTrackerScreen> createState() => _KillTrackerScreenState();
}

class _KillTrackerScreenState extends State<KillTrackerScreen> {
  final KillTrackerController _controller = KillTrackerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kill Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _controller.resetAll();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Quarter selector
            _buildQuarterSelector(),
            const SizedBox(height: 20),
            
            // Kills display
            _buildKillsDisplay(),
            const SizedBox(height: 30),
            
            // Action buttons
            _buildActionButtons(),
            const SizedBox(height: 20),
            
            // Status indicator
            _buildStatusIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuarterSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['Q1', 'Q2', 'Q3', 'Q4'].map((quarter) {
        return ChoiceChip(
          label: Text(quarter),
          selected: _controller.currentQuarter == quarter,
          onSelected: (selected) {
            setState(() {
              _controller.changeQuarter(quarter);
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildKillsDisplay() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Tracking Kills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuarterKillDisplay('Q1', _controller.gameStats.q1Kills),
                _buildQuarterKillDisplay('Q2', _controller.gameStats.q2Kills),
                _buildQuarterKillDisplay('Q3', _controller.gameStats.q3Kills),
                _buildQuarterKillDisplay('Q4', _controller.gameStats.q4Kills),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Total Stops: ${_controller.gameStats.totalStops}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuarterKillDisplay(String quarter, int kills) {
    return Column(
      children: [
        Text(
          quarter,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          '$kills',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _controller.addStop();
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: const Text('Add Stop'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _controller.addKill();
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: const Text('Add Kill'),
        ),
      ],
    );
  }

  Widget _buildStatusIndicator() {
    return Card(
      color: _controller.isKillActive ? Colors.green[100] : Colors.red[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _controller.isKillActive ? 'KILL ACTIVE!' : 'No Kill Active',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _controller.isKillActive ? Colors.green[800] : Colors.red[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Consecutive Stops: ${_controller.consecutiveStops}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}