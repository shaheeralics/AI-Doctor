import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleSignUp() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isNotEmpty && password.length >= 6) {
      // Placeholder logic
      Navigator.pushReplacementNamed(context, '/chat');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid email and password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(Icons.medical_information,
                  size: 60, color: Colors.lightBlue),
              const SizedBox(height: 16),
              const Text(
                'Create AI DocConnect Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
              const SizedBox(height: 40),

              // Email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Password
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // SignUp Button
              ElevatedButton(
                onPressed: handleSignUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 20),

              const Text("Or sign up with"),
              const SizedBox(height: 12),

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.google,
                        color: Colors.red),
                    onPressed: () {}, // TODO: Implement Google sign-up
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github),
                    onPressed: () {}, // TODO: Implement GitHub sign-up
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.facebook,
                        color: Colors.blue),
                    onPressed: () {}, // TODO: Implement Facebook sign-up
                  ),
                ],
              ),

              const Spacer(),

              // Login text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
