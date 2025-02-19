import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'admin_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle, size: 100, color: Colors.black),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.black),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _showMessage(context, "You signed in successfully!");
                },
                child: const Center(child: Text('Login', style: TextStyle(fontSize: 16, color: Colors.white))),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                },
                child: const Text(
                  'Are You New? Create Account',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminLoginPage()));
                },
                child: const Text('Admin Login', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
