import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final int health;
  const CustomCard({
    super.key,
    required this.name,
    required this.icon,
    required this.health,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isWarningVisible = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Icon(widget.icon, size: 80, color: Colors.blue.shade800),
          const SizedBox(height: 10),
          Text(
            "${widget.name} Health",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "${widget.health}%",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.close, size: 22, color: Colors.grey),
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
    );
  }
}
