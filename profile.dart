import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context), 
      body: SingleChildScrollView(  // Wrap in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevents excessive height
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Avatar
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue[300],
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 10),

              // Email Text
              const Text(
                'Email@gmail.com',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton('Friends', Icons.group),
                  const SizedBox(width: 10),
                  _buildButton('Edit', Icons.edit),
                ],
              ),
              const SizedBox(height: 30),

              // Statistics Cards
              _buildCard('Weekly Report', '49 mins / 5475 steps', Icons.timeline),
              _buildCard('BMI Checker', 'Enter Age / Height / Weight', Icons.fitness_center),

              // Additional Progress Widgets
              const SizedBox(height: 20),
              _buildProgressCard('Daily Water Intake', 1500, 2000),
              _buildProgressCard('Sleep Tracker', 6, 8),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[800],
      title: const Text('Profile', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      elevation: 5,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );
  }

  Widget _buildButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(value, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }

  Widget _buildProgressCard(String title, int current, int goal) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      color: Colors.blue[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: current / goal,
              backgroundColor: Colors.white24,
              color: Colors.lightBlueAccent,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 5),
            Text('$current / $goal', style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[800],
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.lightBlueAccent,
      currentIndex: 1, // Profile is selected
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: 'Consults'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/home');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/consult');
            }
            else if (index == 3) {
              Navigator.pushNamed(context, '/settings');
            }
            // Handle navigation for other tabs if needed
      }
    );
  }
}
