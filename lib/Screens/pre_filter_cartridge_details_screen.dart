// cartridge_detail_page.dart

import 'package:flutter/material.dart';
import 'package:water_notifier_app/Screens/home_screen.dart';
import 'package:water_notifier_app/Widgets/custom_sensor_details_row_widget.dart';

class CartridgeDetailPage extends StatefulWidget {
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
  State<CartridgeDetailPage> createState() => _CartridgeDetailPageState();
}

class _CartridgeDetailPageState extends State<CartridgeDetailPage> {
  // Warning visibility
  bool isWarningVisible = true;

  int turbidityLevel = 80;
  int _waterPressureLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 2.0,
        automaticallyImplyLeading: false,
        leadingWidth: 120.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: TextButton.icon(
            onPressed: navigateToHomeScreen,
            icon: Icon(Icons.arrow_back_ios, size: 15.0),
            label: Text('Home', style: TextStyle(fontSize: 18.0)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Icon(widget.icon, size: 80, color: Colors.blue.shade800),
                  const SizedBox(height: 10),
                  Text(
                    "${widget.name} Health",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${widget.health}%",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10.0),
                      value: widget.health / 100,
                      minHeight: 10,

                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.health > 75
                            ? Colors.green
                            : widget.health > 50
                            ? Colors.orange
                            : Colors.red,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Visibility(
                    visible: isWarningVisible,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 231, 138),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: double.infinity,
                          child: Text(
                            'Description and maintenance tips can be shown here.\nE.g., Replace every 6 months or when health is below 30%.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 22,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isWarningVisible = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            // Sensors Details options
            CustomRow(
              sensorImageName: 'sensor_1.png',
              sensorTitle: 'Turbidity',
              levelOfSensorValue: widget.health,
              minSenSorValue: 50,
              mediumSensorValue: 70,
              maxSensorValue: 100,
            ),
          ],
        ),
      ),
    );
  }

  navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return HomeScreen();
        },
      ),
    );
  }
}
