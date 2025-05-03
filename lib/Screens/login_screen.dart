import 'package:flutter/material.dart';
import 'package:water_notifier_app/Screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Required Variables
  bool? _isShowPassword;

  @override
  void initState() {
    super.initState();

    _isShowPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen'), elevation: 2.0),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            // color: const Color.fromARGB(255, 150, 198, 237),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 50.0),

                  // For Email
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Provide Email Id';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter Email'),
                    ),
                  ),

                  SizedBox(height: 25.0),

                  // For Password
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Provide Passowrd';
                      } else {
                        return null;
                      }
                    },
                    obscureText: _isShowPassword!,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter Password'),
                      suffixIcon:
                          _isShowPassword!
                              ? IconButton(
                                onPressed: () => _setPasswordVisiblity(),
                                icon: Icon(Icons.visibility),
                              )
                              : IconButton(
                                onPressed: () => _setPasswordVisiblity(),
                                icon: Icon(Icons.visibility_off),
                              ),
                    ),
                  ),

                  SizedBox(height: 30.0),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _navigateToHomeScreen,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.lightGreen,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _setPasswordVisiblity() {
    setState(() {
      _isShowPassword = !_isShowPassword!;
    });
  }

  _navigateToHomeScreen() {
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
