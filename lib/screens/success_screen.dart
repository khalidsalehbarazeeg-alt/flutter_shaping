import 'package:flutter/material.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            color:Colors.blueAccent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
                const SizedBox(height: 16),
                const Text('Your Order is Complete', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Thank you for your purchase.'),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, '/products'), child: const Text('Continue shopping')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}