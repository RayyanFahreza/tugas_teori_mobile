import 'package:flutter/material.dart';
import 'package:flutter_application_kelas_d/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RiwayatLoggedInView extends StatefulWidget {
  @override
  _RiwayatLoggedInViewState createState() => _RiwayatLoggedInViewState();
}

class _RiwayatLoggedInViewState extends State<RiwayatLoggedInView> {
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
      body: Container(
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
            // Additional order cards can be added here
          ],
        ),
      ),
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
