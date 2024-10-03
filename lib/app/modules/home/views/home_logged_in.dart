import 'package:flutter/material.dart';
import 'package:flutter_application_kelas_d/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeLoggedInView extends StatefulWidget {
  @override
  _HomeLoggedInViewState createState() => _HomeLoggedInViewState();
}

class _HomeLoggedInViewState extends State<HomeLoggedInView> {
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
        title: Text("Hi, User"),
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

  // Method to build home content
  Widget _buildHomeContent() {
    return Container(
      color: Colors.green.withOpacity(0.2), // Main content background color
      padding: EdgeInsets.all(16.0),
      child: ListView(
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

  // Method to build riwayat content
  Widget _buildRiwayatContent() {
    return Container(
      color: Colors.green.withOpacity(0.2), // Main content background color
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _orderCard(
            orderId: 'PSN01',
            products: ['Paracetamol', 'Cerini'],
            total: 'Rp50.000',
            address: 'Jl. Yang Lurus No.12',
          ),
          // Add more orders as needed
        ],
      ),
    );
  }

  // Method to build product card
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
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Add to cart action
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Buy action
              },
              child: Text('Beli'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build order card for Riwayat
  Widget _orderCard({
    required String orderId,
    required List<String> products,
    required String total,
    required String address,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(orderId,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...products.map((product) => Text(product)).toList(),
            Text('Total: $total'),
            Text('Alamat: $address'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Edit address action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Delete order action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
