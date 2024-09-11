import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  bool passwordsMatch = true;

  void checkPasswords() {
    setState(() {
      passwordsMatch = passwordController.text == repeatPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white, // Set background color
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) {
                checkPasswords();
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: repeatPasswordController,
              decoration: InputDecoration(
                labelText: 'Repeat Password',
                errorText: passwordsMatch ? null : "Passwords don't match",
              ),
              obscureText: true,
              onChanged: (value) {
                checkPasswords();
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (passwordsMatch) {
                  // Here you can implement the sign-up logic
                  // For simplicity, I'm just printing the input values
                  print('Email: ${emailController.text}');
                  print('Username: ${usernameController.text}');
                  print('Password: ${passwordController.text}');
                  // Add your sign-up logic here
                }
              },
              child: const Text('Sign me up!'),
            ),
          ],
        ),
      ),
    );
  }
}