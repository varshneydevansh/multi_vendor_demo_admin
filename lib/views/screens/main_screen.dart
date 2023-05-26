import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text('Admin Scaffold'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Color.fromARGB(201, 227, 168, 80),
      ),
      backgroundColor: Colors.white,
      body: Text('Main Screen'),
      sideBar: SideBar(items: [
        AdminMenuItem(
            title: 'Categories', route: '/categories', icon: Icons.category),
        AdminMenuItem(title: 'Vendors', route: '/vendors', icon: Icons.people),
        AdminMenuItem(
            title: 'Products', route: '/products', icon: Icons.food_bank),
        AdminMenuItem(title: 'Payments', route: '/payments', icon: Icons.money),
        AdminMenuItem(
            title: 'Billing', route: '/billing', icon: Icons.circle_sharp),
        AdminMenuItem(
            title: 'Customers',
            route: '/customers',
            icon: Icons.people_outlined),
      ], selectedRoute: '/'),
    );
  }
}
