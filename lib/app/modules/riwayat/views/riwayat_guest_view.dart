import 'package:flutter/material.dart';

class RiwayatGuestView extends StatefulWidget {
  @override
  _RiwayatGuestViewState createState() => _RiwayatGuestViewState();
}

class _RiwayatGuestViewState extends State<RiwayatGuestView> {
  int _selectedIndex = 1; // Track selected tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"),
        backgroundColor: Colors.green, // Header color
      ),
      body: _buildRiwayatContent(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Bottom navigation bar color
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? Colors.green : Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history,
                color: _selectedIndex == 1 ? Colors.green : Colors.black),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                color: _selectedIndex == 2 ? Colors.green : Colors.black),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services,
                color: _selectedIndex == 3 ? Colors.green : Colors.black),
            label: "Resep",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 4 ? Colors.green : Colors.black),
            label: "Profil",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green, // Change selected item color
        unselectedItemColor: Colors.black, // Change unselected item color
      ),
    );
  }

  // Method to build Riwayat content for Guest
  Widget _buildRiwayatContent() {
    return Container(
      color: Colors.green
          .withOpacity(0.2), // Matching main content background color
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/please_login.png', // Replace with your icon asset
              height: 100, // Adjust height as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Login action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
              ),
              child: Text(
                'Silakan Login',
                style: TextStyle(
                    color: Colors.white), // Change text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
