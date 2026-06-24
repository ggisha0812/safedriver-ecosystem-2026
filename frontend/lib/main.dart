import 'package:flutter/material.dart';
import 'dashboardscreen.dart';

void main() => runApp(const SafeDriverApp());

class SafeDriverApp extends StatelessWidget {
  const SafeDriverApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(primaryColor: Colors.amber),
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
            const Icon(Icons.local_taxi, size: 100, color: Colors.amber),
            const Text(
              "SafeDriver",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const DashboardScreen(isDriver: true),
                ),
              ),
              child: const Text("Soy Conductor"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const DashboardScreen(isDriver: false),
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
