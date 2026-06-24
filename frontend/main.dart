import 'package:flutter/material.dart';
import 'dashboardscreen.dart';

void main() => runApp(const SafeDriverApp());

class SafeDriverApp extends StatelessWidget {
  const SafeDriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginSelector(),
    );
  }
}

class LoginSelector extends StatelessWidget {
  const LoginSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => DashboardScreen(isDriver: true),
                ),
              ),
              child: const Text("Soy Conductor"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => DashboardScreen(isDriver: false),
                ),
              ),
              child: const Text("Soy Cliente"),
            ),
          ],
        ),
      ),
    );
  }
}
