import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String sensorImageName;
  final String sensorTitle;
  final int levelOfSensorValue;
  final int minSenSorValue;
  final int mediumSensorValue;
  final int maxSensorValue;
  const CustomRow({
    super.key,
    required this.sensorImageName,
    required this.sensorTitle,
    required this.levelOfSensorValue,
    required this.minSenSorValue,
    required this.mediumSensorValue,
    required this.maxSensorValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
            child: Image.asset('assets/$sensorImageName', width: 25.0),
          ),

          SizedBox(width: 15.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sensorTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 74, 74, 74),
                  fontSize: 16.0,
                ),
              ),
              Text(
                levelOfSensorValue.toString(),
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
                  levelOfSensorValue <= minSenSorValue
                      ? Colors.green
                      : levelOfSensorValue <= mediumSensorValue
                      ? Colors.yellow
                      : Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              levelOfSensorValue < minSenSorValue
                  ? Icons.done
                  : levelOfSensorValue < mediumSensorValue
                  ? Icons.info_outline
                  : Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
