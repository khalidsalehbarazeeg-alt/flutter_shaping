// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart'; // أو 'cart.dart' لو الملفات كلها في lib/
import 'screens/welcome_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/success_screen.dart';
import 'screens/failed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Wireframes',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const WelcomeScreen(),
          '/create': (_) => const CreateAccountScreen(),
          '/signin': (_) => const SignInScreen(),
          '/products': (_) => const ProductListScreen(),
          '/cart': (_) => const CartScreen(),
          '/checkout': (_) => const CheckoutScreen(),
          '/success': (_) => const SuccessScreen(),
          '/failed': (_) => const FailedScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/product') {
            final args = settings.arguments as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: args!['product']),
            );
          }
          return null;
        },
      ),
    );
  }
}
