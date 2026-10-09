import 'package:flutter/material.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);


  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}


class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create an account')),
      body: Container(
        color:Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (v) =>
                  (v == null || !v.contains('@'))
                      ? 'Enter valid email'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (v) =>
                  (v == null || v.length < 6)
                      ? 'Min 6 chars'
                      : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
        // In real app: create account
                      Navigator.pushReplacementNamed(context, '/products');
                    }
                  },
                  child: const SizedBox(width: double.infinity,
                      child: Center(child: Text('Create account'))),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}