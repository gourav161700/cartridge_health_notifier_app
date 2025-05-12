import 'package:flutter/material.dart';
// import 'package:water_notifier_app/Widgets/custom_sensor_details_row_widget.dart';
import 'package:water_notifier_app/Widgets/custom_sensor_health_card_widget.dart';

import 'package:water_notifier_app/Data/data.dart';

class CartridgeDetailScreen extends StatefulWidget {
  final String name;
  final String dataName;
  final IconData icon;
  final int health;

  const CartridgeDetailScreen({
    super.key,
    required this.dataName,
    required this.name,
    required this.icon,
    required this.health,
  });

  @override
  State<CartridgeDetailScreen> createState() => _CartridgeDetailScreenState();
}

class _CartridgeDetailScreenState extends State<CartridgeDetailScreen> {
  // Warning visibility
  bool isWarningVisible = true;

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
            CustomCard(
              name: widget.name,
              icon: widget.icon,
              health: widget.health,
            ),

            SizedBox(height: 20.0),

            Expanded(
              child: ListView.builder(
                itemCount:
                    (SensorData.cartridgeSensorDetails[widget.dataName] as Map)
                        .length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      // color: Color(0xFFE8F4F8),
                      color: Color(0xFFF1E7FE),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(151, 189, 189, 189),
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(151, 189, 189, 189),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            'assets/sensor_3.png',
                            width: 25.0,
                          ),
                        ),

                        SizedBox(width: 15.0),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              SensorData.cartridgeSensorDetails[widget
                                  .dataName]['sensor_$index']['display_name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 74, 74, 74),
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              SensorData
                                  .cartridgeSensorDetails[widget
                                      .dataName]['sensor_$index']['current_value']
                                  .toString(),
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ],
                        ),

                        Spacer(),

                        Container(
                          padding: const EdgeInsets.all(3.0),
                          width: 30.0,
                          decoration: BoxDecoration(
                            // color: const Color.fromARGB(151, 189, 189, 189),
                            color:
                                SensorData.cartridgeSensorDetails[widget
                                                .dataName]['sensor_$index']['current_value'] >=
                                            SensorData
                                                .cartridgeSensorDetails[widget
                                                .dataName]['sensor_$index']['min_value'] &&
                                        SensorData.cartridgeSensorDetails[widget
                                                .dataName]['sensor_$index']['current_value'] <=
                                            SensorData
                                                .cartridgeSensorDetails[widget
                                                .dataName]['sensor_$index']['mid_value']
                                    ? Colors.green
                                    : SensorData.cartridgeSensorDetails[widget
                                                .dataName]['sensor_$index']['current_value'] >=
                                            SensorData
                                                .cartridgeSensorDetails[widget
                                                .dataName]['sensor_$index']['mid_value'] &&
                                        SensorData.cartridgeSensorDetails[widget
                                                .dataName]['sensor_$index']['current_value'] <
                                            SensorData
                                                .cartridgeSensorDetails[widget
                                                .dataName]['sensor_$index']['max_value']
                                    ? Colors.yellow
                                    : Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            SensorData.cartridgeSensorDetails[widget
                                            .dataName]['sensor_$index']['current_value'] >=
                                        SensorData.cartridgeSensorDetails[widget
                                            .dataName]['sensor_$index']['min_value'] &&
                                    SensorData.cartridgeSensorDetails[widget
                                            .dataName]['sensor_$index']['current_value'] <=
                                        SensorData.cartridgeSensorDetails[widget
                                            .dataName]['sensor_$index']['mid_value']
                                ? Icons.done
                                : SensorData.cartridgeSensorDetails[widget
                                            .dataName]['sensor_$index']['current_value'] >=
                                        SensorData.cartridgeSensorDetails[widget
                                            .dataName]['sensor_$index']['mid_value'] &&
                                    SensorData.cartridgeSensorDetails[widget
                                            .dataName]['sensor_$index']['current_value'] <
                                        SensorData.cartridgeSensorDetails[widget
                                            .dataName]['sensor_$index']['max_value']
                                ? Icons.info_outline
                                : Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Sensors Details options
            // CustomRow(
            //   sensorImageName: 'sensor_3.png',
            //   sensorTitle: 'Turbidity',
            //   levelOfSensorValue: widget.health,
            //   minSenSorValue: 50,
            //   mediumSensorValue: 70,
            //   maxSensorValue: 100,
            // ),
          ],
        ),
      ),
    );
  }

  navigateToHomeScreen() {
    Navigator.pop(context);
  }
}
