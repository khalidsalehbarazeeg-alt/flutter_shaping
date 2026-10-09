import 'package:flutter/material.dart';


class Product {
  final String id;
  final String name;
  final String description;
  final double price;


  Product({required this.id, required this.name, required this.description, required this.price});
}


class CartModel extends ChangeNotifier {
  final List<Product> _items = [];


  List<Product> get items => List.unmodifiable(_items);


  double get total => _items.fold(0, (t, p) => t + p.price);


  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }


  void remove(Product p) {
    _items.remove(p);
    notifyListeners();
  }


  void clear() {
    _items.clear();
    notifyListeners();
  }
}


// Sample products helper
List<Product> sampleProducts = List.generate(
  6,
      (i) => Product(
    id: 'p\$i',
    name: 'Product \${i + 1}',
    description: 'This is product number \${i + 1}. It has nice features and a helpful description to match the wireframe.',
    price: 19.99 + i * 5,
  ),
);