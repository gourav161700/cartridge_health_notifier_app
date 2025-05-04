import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 93, 205, 249),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      'GP',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ),
                  Text(
                    'Gourav Patil',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    'gouravpatil@gmail.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Input Fields
            customInputWidget(
              inputTitle: 'First Name',
              inputValue: 'Gourav',
              isEnabled: true,
            ),

            customInputWidget(
              inputTitle: 'Last Name',
              inputValue: 'Patil',
              isEnabled: true,
            ),

            customInputWidget(
              inputTitle: 'Email ID',
              inputValue: 'gouravpatil@gmail.com',
              isEnabled: false,
            ),

            Container(
              padding: const EdgeInsets.only(
                left: 14.0,
                right: 14.0,
                top: 15.0,
                bottom: 15.0,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filter Details', style: TextStyle(fontSize: 16.0)),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
            ),

            // Update Button
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 245, 176, 72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding customInputWidget({
    required String inputTitle,
    required String inputValue,
    required bool isEnabled,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        enabled: isEnabled,
        initialValue: inputValue,
        decoration: InputDecoration(
          label: Text(inputTitle),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
