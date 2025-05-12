import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_notifier_app/Screens/home_screen.dart';

class RegisterDeviceScreen extends StatefulWidget {
  const RegisterDeviceScreen({super.key});

  @override
  State<RegisterDeviceScreen> createState() => _RegisterDeviceScreenState();
}

class _RegisterDeviceScreenState extends State<RegisterDeviceScreen> {
  bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Device'), elevation: 2.0),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'PureSight',
                  style: TextStyle(fontSize: 35, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              _customInputWidget(inputFieldTitle: 'First Name'),
              _customInputWidget(inputFieldTitle: 'Last Name'),
              _customInputWidget(inputFieldTitle: 'Email ID'),
              _customInputWidget(
                inputFieldTitle: 'Contact Number',
                isIntegerInput: true,
              ),
              _customInputWidget(
                inputFieldTitle: 'Set Password',
                isSecureInput: true,
              ),
              _customInputWidget(
                inputFieldTitle: 'Confirm Password',
                isSecureInput: true,
              ),

              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _navigateToAddDevice,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 251, 170, 47),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Register Me',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }

  _navigateToAddDevice() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return HomeScreen(isNewUser: true);
        },
      ),
    );
  }

  Padding _customInputWidget({
    required String inputFieldTitle,
    bool isIntegerInput = false,
    bool isSecureInput = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType:
            isIntegerInput ? TextInputType.number : TextInputType.text,
        inputFormatters:
            isIntegerInput ? [FilteringTextInputFormatter.digitsOnly] : [],
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(inputFieldTitle),
          suffixIcon:
              isSecureInput
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        isHidePassword = !isHidePassword;
                      });
                    },
                    icon: Icon(
                      isHidePassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                  : SizedBox.shrink(),
        ),
        obscureText: isSecureInput && isHidePassword,
      ),
    );
  }
}
