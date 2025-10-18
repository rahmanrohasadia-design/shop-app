import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;

  const ProductCard({super.key,
  required this.title,
  required this.price,
  required this.image,
  required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
             style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
             ),
             ),
          const SizedBox(height: 5),
          Text(
            '৳$price',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            ),
          const SizedBox(height: 5),
          Center(
            child: Image.asset(image,height: 175)
            ), 
        ],
      ),

    );
    
  }
}