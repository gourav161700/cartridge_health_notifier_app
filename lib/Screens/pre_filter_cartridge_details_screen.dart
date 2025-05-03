// cartridge_detail_page.dart

import 'package:flutter/material.dart';

class CartridgeDetailPage extends StatelessWidget {
  final String name;
  final IconData icon;
  final int health;

  const CartridgeDetailPage({
    super.key,
    required this.name,
    required this.icon,
    required this.health,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), elevation: 2.0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 80, color: Colors.blue.shade800),
            const SizedBox(height: 20),
            Text(
              "$name Health",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "$health%",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: health / 100,
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(
                health > 75
                    ? Colors.green
                    : health > 50
                    ? Colors.orange
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Description and maintenance tips can be shown here.\nE.g., Replace every 6 months or when health is below 30%.",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
