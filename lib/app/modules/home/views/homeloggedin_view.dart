import 'package:flutter/material.dart';
import 'package:flutter_application_kelas_d/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeLoggedInView extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Hi, ${controller.username.value}')),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          _buildProductItem(
              'Paracetamol', 'Tablet', 'Rp20.000', 'assets/paracetamol.png'),
          _buildProductItem(
              'Bodrex', 'Tablet', 'Rp10.000', 'assets/bodrex.png'),
          _buildProductItem('Cerini', 'Sirup', 'Rp30.000', 'assets/cerini.png'),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildProductItem(
      String title, String subtitle, String price, String imagePath) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(price, style: TextStyle(color: Colors.green)),
            ElevatedButton(
              onPressed: () {
                // Add to cart logic
              },
              child: Text('Beli'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Profile'),
      ],
      selectedItemColor: Colors.green,
    );
  }
}
