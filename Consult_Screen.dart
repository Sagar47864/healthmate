// ignore: file_names
import 'package:flutter/material.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Doctor Consultation', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Medicine'),
              _buildDoctorCard('Dr. Raj Mehta', 'General Physician', 'assets/doctor1.jpg'),
              _buildDoctorCard('Dr. Sunita Sharma', 'Internal Medicine', 'assets/doctor2.jpg'),

              _buildSectionTitle('Child Specialist'),
              _buildDoctorCard('Dr. Kiran Patel', 'Pediatrician', 'assets/doctor3.jpg'),
              _buildDoctorCard('Dr. Neha Verma', 'Neonatologist', 'assets/doctor4.jpg'),

              _buildSectionTitle('Gastroenterologist'),
              _buildDoctorCard('Dr. Vikram Rao', 'Gastroenterologist', 'assets/doctor5.jpg'),
              
              _buildSectionTitle('Dermatologist'),
              _buildDoctorCard('Dr. Ananya Das', 'Skin Specialist', 'assets/doctor6.jpg'),

              _buildSectionTitle('Gynecologist'),
              _buildDoctorCard('Dr. Priya Singh', 'Obstetrician & Gynecologist', 'assets/doctor7.jpg'),

              _buildSectionTitle('Cardiologist'),
              _buildDoctorCard('Dr. Arjun Kapoor', 'Heart Specialist', 'assets/doctor8.jpg'),

              _buildSectionTitle('Neurologist'),
              _buildDoctorCard('Dr. Sanjay Nair', 'Brain & Nerve Specialist', 'assets/doctor9.jpg'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[800],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.lightBlueAccent,
        currentIndex: 2, // Set to "Consults" tab
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: 'Consults'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
          if (index == 0) {
              Navigator.pushNamed(context, '/home');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/profile');
            }// Handle navigation
            else if (index == 3) {
              Navigator.pushNamed(context, '/settings');
            }
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
      ),
    );
  }

  Widget _buildDoctorCard(String name, String specialization, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(specialization, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Book'),
            ),
          ],
        ),
      ),
    );
  }
}
