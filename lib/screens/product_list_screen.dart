import 'package:flutter/material.dart';
import '../models/cart.dart';
import 'package:provider/provider.dart';


class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/cart'), icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: GridView.builder(

        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemCount: sampleProducts.length,
        itemBuilder: (ctx, i) {
          final p = sampleProducts[i];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/product', arguments: {'product': p}),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
                        child: Image.asset('images/mm.png', fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('\$\${p.price.toStringAsFixed(2)}'),
                    const SizedBox(height: 8),
                    ElevatedButton(onPressed: () => Provider.of<CartModel>(context, listen: false).add(p), child: const Text('Add to cart')),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}