import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(

        width: double.infinity,
        height: double.infinity,
        color:Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            const Text('Welcome to\nThe Shop Name',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            const Text('Start by creating an account', style: TextStyle(fontSize: 14, color: Colors.black54)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/create'),
              child: const SizedBox(width: double.infinity, child: Center(child: Text('Create an account'))),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/signin'),
              child: const SizedBox(width: double.infinity, child: Center(child: Text('Sign In'))),
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)),
            ),
            SizedBox(height: size.height * 0.2),
          ],
        ),
      ),
    );
  }
}