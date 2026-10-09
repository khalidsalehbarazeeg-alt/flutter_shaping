// lib/screens/checkout_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _card = TextEditingController();

  bool _processing = false;

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    _card.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Shipping & Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Full name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _address,
                decoration: const InputDecoration(labelText: 'Shipping address'),
                validator: (v) => v == null || v.isEmpty ? 'Enter address' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _card,
                decoration: const InputDecoration(labelText: 'Card number'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.length < 8 ? 'Invalid' : null,
              ),
              const Spacer(),
              if (_processing) const CircularProgressIndicator(),
              if (!_processing)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => _processing = true);

                            // محاكاة تأخير الشبكة / معالجة الدفع:
                            await Future.delayed(const Duration(seconds: 2));

                            // محاكاة نجاح أو فشل:
                            final success = DateTime.now().second % 2 == 0;

                            setState(() => _processing = false);

                            if (success) {
                              // عند النجاح نمسح السلة ونذهب لشاشة النجاح
                              cart.clear();
                              if (!mounted) return;
                              Navigator.pushReplacementNamed(context, '/success');
                            } else {
                              // عند الفشل نذهب لشاشة الفشل
                              if (!mounted) return;
                              Navigator.pushReplacementNamed(context, '/failed');
                            }
                          }
                        },
                        child: const Text('Confirm & Pay'),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
