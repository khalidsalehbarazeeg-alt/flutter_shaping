import 'package:flutter/material.dart';


class FailedScreen extends StatelessWidget {
  const FailedScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 100, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Your Order is Failed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('There was an issue processing your payment.'),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, '/cart'), child: const Text('Back to cart')),
            ],
          ),
        ),
      ),
    );
  }
}