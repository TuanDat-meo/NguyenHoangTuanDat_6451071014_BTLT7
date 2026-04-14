import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final double price;
  final String description;

  const ProductInfo({
    super.key, 
    required this.title, 
    required this.price, 
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text('Mô tả:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        Text(description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}