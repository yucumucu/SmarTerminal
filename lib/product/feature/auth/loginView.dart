import 'package:flutter/material.dart';
import 'package:smarterminal/product/pages/home/homeView.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  // Hardcoded credentials for demonstration purposes
  final String correctUsername = 'admin';
  final String correctPassword = 'password123';

  // Function to validate the username and password
  void _validateCredentials() {
    if (_usernameController.text == correctUsername && _passwordController.text == correctPassword) {
      setState(() {
        _errorMessage = '';
      });
      // Navigate to the next page or perform any other action
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => homeView()),
      );
    } else {
      setState(() {
        _errorMessage = 'Incorrect username or password. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Image(
                 width: MediaQuery.of(context).size.width * 0.5,

                   image: AssetImage('assets/zentek-logo-type-2.png')),
              SizedBox(
                child: Text("Zentek", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateCredentials,
                child: const Text('Login'),
              ),
              SizedBox(height: 10),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
