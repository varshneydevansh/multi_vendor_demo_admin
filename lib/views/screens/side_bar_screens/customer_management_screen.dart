import 'package:flutter/material.dart';

class CustomerManagementScreen extends StatelessWidget {
  static const String routeName = '/customer-management-screen';

  Widget _rowHeader(String header_name, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[700]!),
            color: Colors.orange[500]),
        child: Center(
          child: Text(
            header_name,
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
              'Customer Management Screen',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Customer Name', 3),
              _rowHeader('Email', 2),
              _rowHeader('Phone Number', 2),
              _rowHeader('Address', 3),
              _rowHeader('Action', 1),
              _rowHeader('View More', 1)
            ],
          )
        ],
      ),
    );
  }
}
