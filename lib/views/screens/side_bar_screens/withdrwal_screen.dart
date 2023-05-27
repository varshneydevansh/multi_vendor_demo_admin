import 'package:flutter/material.dart';

class WithdrwalScreen extends StatelessWidget {
   static const String routeName = '/withdrawal';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
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
      );
  }
}