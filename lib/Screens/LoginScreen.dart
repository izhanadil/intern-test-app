import 'package:flutter/material.dart';

import '../Colors.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();// to identify the form
  final _emailController = TextEditingController();// to  handle the email text
  final _passwordController = TextEditingController();// to handle the password text

  // Email Validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  //Password Validation
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    //8 character length password required
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  void _login() {
    // Validating email and password and checking credentials
    if (_formKey.currentState!.validate() &&
        _emailController.text == 'izhan@gmail.com' &&
        _passwordController.text == 'IzhanIzhan') {
      // navigating to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // if the credentials are incorrect
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.purpleLight,
            title: const Text('Invalid',style: TextStyle(color: AppColors.red),),
            content: const Text('Please enter valid email and password'),
            actions: [
              TextButton(
                style:
                    TextButton.styleFrom(backgroundColor: AppColors.purpleDark),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK', style: TextStyle(color: AppColors.white)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.purpleDark,
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: AppColors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: AppColors.purpleLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: AppColors.purpleDark, width: 2.0),
                  ),
                  prefixIcon: const Icon(Icons.email, color: AppColors.purple),
                ),
                validator: _validateEmail,// validate email function calling
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: AppColors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: AppColors.purpleLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: AppColors.purpleDark, width: 2.0),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: AppColors.purple),
                ),
                validator: _validatePassword, // validate password function calling
              ),
              const SizedBox(height: 30),
              // Button for adding Medication
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: AppColors.purpleDark,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
