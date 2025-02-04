import 'package:flutter/material.dart';

import 'login.dart'; // Import the LoginScreen
import 'quizz.dart';
import 'settings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 155, 15, 170),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 228, 213, 244),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Quiz App!",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 155, 15, 170),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizApp()),
                );
              },
              child: const Text("Start Quiz"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
              child: const Text("Settings"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 228, 213, 244),
              ),
              child: const Text("Back to Login Page"),
            ),
          ],
        ),
      ),
    );
  }
}
