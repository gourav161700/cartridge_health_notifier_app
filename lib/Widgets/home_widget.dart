import 'package:flutter/material.dart';
import 'package:water_notifier_app/Data/data.dart';
import 'package:water_notifier_app/Screens/cartridge_details_screen.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // Cartage Options
  final List<Map<String, dynamic>> cartridgeOptions = [
    {
      'dataName': 'prefilter',
      'name': 'Pre-filter',
      'icon': Icons.filter_alt,
      'health': 90,
    },
    {
      'dataName': 'sediment_filter',
      'name': 'Sediment Cartridge',
      'icon': Icons.grain,
      'health': 75,
    },
    {
      'dataName': 'carbon_filter',
      'name': 'Carbon Cartridge',
      'icon': Icons.bubble_chart,
      'health': 65,
    },
    {
      'dataName': 'ro_filter',
      'name': 'RO Membrane',
      'icon': Icons.water_damage,
      'health': 80,
    },
    {
      'dataName': 'alkaline_filter',
      'name': 'Alkaline Cartridge',
      'icon': Icons.opacity,
      'health': 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TDS Level Container
        Container(
          margin: const EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height / 7,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Color(0xFF81D4FA), Color(0xFF1565C0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              ClipPath(
                clipper: WaterClipper(),
                child:
                // Foreground wave (main blue shape)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [Color(0xFF4FC3F7), Color(0xFF1976D2)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    // color: Color(0xFF29B6F6),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '87',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ppm',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'TDS Value',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 59, 59, 59),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Other options
        // Expanded(
        //   child: GridView.builder(
        //     itemCount: 5,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       crossAxisSpacing: 16,
        //       mainAxisSpacing: 16,
        //       childAspectRatio: 1.2,
        //     ),
        //     padding: EdgeInsets.all(16.0),
        //     itemBuilder: (context, index) {
        //       final item = cartridgeOptions[index];
        //       return GestureDetector(
        //         onTap: () {
        //           _navigateToCartageDetailScreen(index);
        //         },
        //         child: Container(
        //           padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(20),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Color.fromRGBO(0, 0, 0, 0.1),
        //                 blurRadius: 8,
        //                 offset: Offset(0, 4),
        //               ),
        //             ],
        //           ),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //                 children: [
        //                   Icon(
        //                     item['icon'],
        //                     color: Color(0xFF8A8A8A),
        //                     size: 28,
        //                   ),
        //                   SizedBox(width: 10),
        //                   Expanded(
        //                     child: Text(
        //                       item['name'],
        //                       style: TextStyle(
        //                         color: Color(0xFF212121),
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 14,
        //                       ),
        //                       maxLines: 2,
        //                     ),
        //                   ),
        //                 ],
        //               ),

        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     '${item['health']}%',
        //                     style: TextStyle(
        //                       color: Color(0xFF212121),
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                   SizedBox(height: 4),
        //                   ClipRRect(
        //                     borderRadius: BorderRadius.circular(10),
        //                     child: LinearProgressIndicator(
        //                       value: item['health'] / 100,
        //                       backgroundColor: Color(0xFFE0E0E0),
        //                       valueColor: AlwaysStoppedAnimation<Color>(
        //                         item['health'] > 75
        //                             ? Color(0xFF388E3C)
        //                             : item['health'] > 50
        //                             ? Color(0xFFFFB74D)
        //                             : Color(0xFFEF5350),
        //                       ),
        //                       minHeight: 8,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: cartridgeOptions.length,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final item = cartridgeOptions[index];
              final sensors =
                  SensorData.cartridgeSensorDetails[item['dataName']] ?? {};

              return GestureDetector(
                onTap: () {
                  _navigateToCartageDetailScreen(index);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(item['icon'], size: 36, color: Colors.blueGrey),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(10.0),
                              value: item['health'] / 100,
                              minHeight: 8,
                              backgroundColor: Color(0xFFE0E0E0),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                item['health'] > 75
                                    ? Color(0xFF388E3C)
                                    : item['health'] > 50
                                    ? Color(0xFFFFB74D)
                                    : Color(0xFFEF5350),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Health: ${item['health']}%',
                              style: TextStyle(
                                color: Color(0xFF424242),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 12),
                            ...sensors.entries.map((entry) {
                              final sensor = entry.value;
                              final current = sensor['current_value'];
                              final range = sensor['sensorRange'];
                              final inRange = _checkWithinRange(range, current);

                              return Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.sensors,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        sensor['display_name'],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Text(
                                      '$current',
                                      style: TextStyle(
                                        color:
                                            inRange ? Colors.green : Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      '($range)',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Icon(
                                      inRange
                                          ? Icons.check_circle_outline
                                          : Icons.warning_amber_rounded,
                                      size: 16,
                                      color:
                                          inRange ? Colors.green : Colors.red,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _navigateToCartageDetailScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return CartridgeDetailScreen(
            dataName: cartridgeOptions[index]['dataName'],
            name: cartridgeOptions[index]['name'],
            icon: cartridgeOptions[index]['icon'],
            health: cartridgeOptions[index]['health'],
          );
        },
      ),
    );
  }

  bool _checkWithinRange(String range, dynamic currentValue) {
    final parts = range.split('-');
    if (parts.length == 2) {
      final min = double.tryParse(parts[0].trim());
      final max = double.tryParse(parts[1].trim());
      if (min != null && max != null && currentValue is num) {
        return currentValue >= min && currentValue <= max;
      }
    }
    return false;
  }
}

class WaterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double centerY = size.height / 2;

    path.lineTo(0, centerY);
    path.quadraticBezierTo(
      size.width / 4,
      centerY + 20,
      size.width / 2,
      centerY,
    );
    path.quadraticBezierTo(
      3 * size.width / 4,
      centerY - 20,
      size.width,
      centerY,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
