import 'package:flutter/material.dart';

class WithdrwalScreen extends StatelessWidget {
  static const String routeName = '/withdrawal';

  Widget _rowHeader(String Header_text, int flex) {
    return Expanded(
      flex: flex,
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
              'Withdrwal Requests',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Vendor Name', 3),
              _rowHeader('Amount', 2),
              _rowHeader('Date', 2),
              _rowHeader('Bank Name', 3),
              _rowHeader('Account Number', 2),
              _rowHeader('Email', 2),
              _rowHeader('Status', 1),
              _rowHeader('Action', 1),
            ],
          )
        ],
      ),
    );
  }
}
