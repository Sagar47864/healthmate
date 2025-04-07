import 'package:flutter/material.dart';
import 'profile.dart'; // Import ProfileScreen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _waterIntake = 0;
  final int _dailyWaterGoal = 2000;

  void _addWater(int amount) {
    setState(() => _waterIntake = (_waterIntake + amount).clamp(0, _dailyWaterGoal));
  }

  Widget _buildCard({required String title, required Widget content}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5BC0EB), Color(0xFF3A86FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
  padding: const EdgeInsets.all(20),
  child: Flexible( // Prevents overflow by making content adaptive
    child: SingleChildScrollView( // Enables scrolling when content overflows
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCard(
            title: 'Step Count',
            content: Row(
              children: const [
                Icon(Icons.directions_walk, color: Colors.white, size: 40),
                SizedBox(width: 10),
                Text('5478', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.circle, color: Colors.white54, size: 60),
              ],
            ),
          ),
          _buildCard(
            title: 'Sleep',
            content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 115, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text('Record Time', style: TextStyle(color: Colors.white)),
            ),
          ),
          _buildCard(
            title: 'Water',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: _waterIntake / _dailyWaterGoal,
                  backgroundColor: Colors.white24,
                  color: const Color.fromARGB(255, 12, 103, 177),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('$_waterIntake / $_dailyWaterGoal ml', style: const TextStyle(color: Colors.white70)),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue[800],
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () => _addWater(250),
                      child: const Text('+ 250 ml'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildCard(
            title: 'Heartbeat',
            content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.blue[800], // Updated for better theme
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.favorite, color: Colors.white),
                  const Text(
                    '72 BPM',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          _buildCard(
            title: 'Blood Pressure',
            content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(15),
              ),
              constraints: const BoxConstraints(minHeight: 50), // Prevent overflow
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.monitor_heart, color: Colors.white),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '120/80 mmHg',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Normal',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[800],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
            if (index == 1) {
              Navigator.pushNamed(context, '/profile');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/consult');
            }
            // Handle navigation for other tabs if needed
            else if (index == 3) {
              Navigator.pushNamed(context, '/settings');
            }
            else if (index == 4) {
              Navigator.pushNamed(context, '/profile');
            }
      }
      ),
    );
  }
}
