import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  static const String routeName = '/vendors';

  Widget _rowHeader(String row_text, int flex) {
    return Expanded(
      // flex is used to give the child a ratio of the available space in the parent widget
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            color: Colors.orange[500]),
        child: Center(
          child: Text(
            row_text,
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
              'Manage Vendors',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Logo', 1),
              _rowHeader('Business Name', 3),
              _rowHeader('City', 2),
              _rowHeader('State', 2),
              _rowHeader('Action', 1),
              _rowHeader('GST Verified', 1),
              _rowHeader('View More', 1),
            ],
          )
        ],
      ),
    );
  }
}
