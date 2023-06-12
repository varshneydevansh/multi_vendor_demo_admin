import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = '/products';
  Widget _rowHeader(String Header_text, int flex) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[700]!),
            color: Colors.orange[500]),
        child: Center(
          child: Text(
            Header_text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Products',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Product Image', 4),
              _rowHeader('Product Name', 3),
              _rowHeader('Price', 2),
              _rowHeader('Category', 2),
              _rowHeader('Action', 1),
              _rowHeader('View More', 1),
            ],
          )
        ],
      ),
    );
  }
}
