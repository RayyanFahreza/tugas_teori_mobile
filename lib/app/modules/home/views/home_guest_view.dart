import 'package:flutter/material.dart';

class HomeGuestView extends StatefulWidget {
  @override
  _HomeGuestViewState createState() => _HomeGuestViewState();
}

class _HomeGuestViewState extends State<HomeGuestView> {
  int _selectedIndex = 0; // Track selected tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guest"),
        backgroundColor: Colors.green, // Header color
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Event button action
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Cart button action
            },
          ),
        ],
      ),
      body: _selectedIndex == 0 ? _buildHomeContent() : _buildRiwayatContent(),
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

  // Method to build home content for guest
  Widget _buildHomeContent() {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _productCard(
            imageUrl: 'assets/paracetamol.png',
            title: 'Paracetamol',
            type: 'Tablet',
            price: 'Rp20.000',
          ),
          SizedBox(height: 10),
          _productCard(
            imageUrl: 'assets/bodrex.png',
            title: 'Bodrex',
            type: 'Tablet',
            price: 'Rp10.000',
          ),
          SizedBox(height: 10),
          _productCard(
            imageUrl: 'assets/cerini.png',
            title: 'Cerini',
            type: 'Sirup',
            price: 'Rp30.000',
          ),
        ],
      ),
    );
  }

  // Method to build Riwayat content for guest
  Widget _buildRiwayatContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/your_icon_image.png', // Replace with your icon asset
            height: 100, // Adjust height as needed
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Login action
            },
            child: Text('Silakan Login'),
          ),
        ],
      ),
    );
  }

  // Method to build product card for Home
  Widget _productCard({
    required String imageUrl,
    required String title,
    required String type,
    required String price,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 60, height: 60),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(type),
                  Text(price, style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Login action
              },
              child: Text('Silakan Login'),
            ),
          ],
        ),
      ),
    );
  }
}
