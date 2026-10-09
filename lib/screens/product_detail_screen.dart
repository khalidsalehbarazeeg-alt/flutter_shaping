import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey[200]), child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset('images/mm.png', fit: BoxFit.cover))),
            const SizedBox(height: 16),
            Text(product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description),
            const SizedBox(height: 16),
            Text('\$\${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const Spacer(),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('Back'))),
                const SizedBox(width: 12),
                Expanded(child: ElevatedButton(onPressed: () { Provider.of<CartModel>(context, listen: false).add(product); Navigator.pushNamed(context, '/cart'); }, child: const Text('Add & Go to Cart'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}