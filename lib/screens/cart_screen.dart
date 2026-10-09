// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // CONTENT: إظهار رسالة لو السلة فاضية أو عرض العناصر
              if (cart.items.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                        SizedBox(height: 12),
                        Text('Your cart is empty', style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (ctx, i) {
                      final p = cart.items[i];
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: SizedBox(
                            width: 56,
                            height: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'images/mm.png', // تأكد من اسم الملف وامتداده
                                fit: BoxFit.cover,
                                errorBuilder: (ctx, err, stack) => const Icon(Icons.image, size: 40, color: Colors.grey),
                              ),
                            ),
                          ),
                          title: Text(p.name),
                          subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => cart.remove(p),
                          ),
                        ),
                      );
                    },
                  ),
                ),

              // FOOTER: المجموع وزر الدفع — استخدمنا Expanded للنص لتفادي overflow
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, -1)),
                  ],
                ),
                child: Row(
                  children: [
                    // النص يأخذ المساحة المتاحة
                    Expanded(
                      child: Text(
                        'Total: \$${cart.total.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // زر الدفع
                    ElevatedButton(
                      onPressed: cart.items.isEmpty
                          ? null
                          : () => Navigator.pushNamed(context, '/checkout'),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                        child: Text('Checkout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
