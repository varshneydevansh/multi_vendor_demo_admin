import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/catogories_screen.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/customer_management_screen.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/dasboard_screen.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/orders_screen.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/products_screen.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/upload_banner_screen.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:multi_vendor_demo_admin/views/screens/side_bar_screens/withdrwal_screen.dart';

//const IconData currency_rupee_outlined = IconData(0xf05db, fontFamily: 'MaterialIcons');

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  Widget _selectedScreen =
      DashboardScreen(); //Setting the first screen to default screen

  screenSelector(item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selectedScreen = DashboardScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedScreen = CategoriesScreen();
        });
        break;
      case VendorsScreen.routeName:
        setState(() {
          _selectedScreen = VendorsScreen();
        });
        break;
      case WithdrwalScreen.routeName:
        setState(() {
          _selectedScreen = WithdrwalScreen();
        });
        break;
      case OrdersScreen.routeName:
        setState(() {
          _selectedScreen = OrdersScreen();
        });
        break;
      case ProductsScreen.routeName:
        setState(() {
          _selectedScreen = ProductsScreen();
        });
        break;
      case UploadBannerScreen.routeName:
        setState(() {
          _selectedScreen = UploadBannerScreen();
        });
        break;
      case CustomerManagementScreen.routeName:
        setState(() {
          _selectedScreen = CustomerManagementScreen();
        });
        break;

      default:
        setState(() {
          _selectedScreen = DashboardScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          // title: Row(
          //   children: [
          //     // const Text('Admin Panel'),
          //     // const SizedBox(width: 8), // Add some spacing
          //     // IconButton(
          //     //   icon: const Icon(Icons.dashboard), // Replace with your icon
          //     //   onPressed: () {
          //     //     setState(() {
          //     //       _selectedScreen = DashboardScreen();
          //     //     });
          //     //   },
          //     // ),

          //     GestureDetector(

          //       onTap: () {
          //         setState(() {
          //           _selectedScreen = DashboardScreen();
          //         });
          //       },
          //       child: const Text('Admin Panel'),
          //     ),
          //     const SizedBox(width: 8), // Add some spacing
          //     const Icon(Icons.dashboard),
          //   ],
          // ),
          title: InkWell(
            onTap: () {
              setState(() {
                _selectedScreen = DashboardScreen();
              });
            },
            child: Column(
              children: [
                Container(
                  child: const Text('Admin Panel'),
                ),
              ],
             
            ),
          ),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Color.fromARGB(201, 227, 168, 80),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: _selectedScreen,
        sideBar: SideBar(
          items: [
            AdminMenuItem(
                title: 'Categories',
                route: CategoriesScreen.routeName,
                icon: Icons.category),
            AdminMenuItem(
                title: 'Vendors',
                route: VendorsScreen.routeName,
                icon: Icons.people),
            AdminMenuItem(
                title: 'Withdrwal',
                route: WithdrwalScreen.routeName,
                icon: Icons.currency_rupee_outlined),
            AdminMenuItem(
                title: 'Orders',
                route: OrdersScreen.routeName,
                icon: Icons.shopping_cart),
            AdminMenuItem(
                title: 'Products',
                route: ProductsScreen.routeName,
                icon: Icons.insert_emoticon_sharp),
            AdminMenuItem(
                title: 'Upload Banners',
                route: UploadBannerScreen.routeName,
                icon: Icons.add),
            AdminMenuItem(
                title: 'Customers',
                route: CustomerManagementScreen.routeName,
                icon: Icons.people_outlined),
          ],
          selectedRoute: '/',
          onSelected: (item) => screenSelector(item),
          header: Container(
            height: 50,
            width: double.infinity,
            color: Color.fromARGB(255, 234, 150, 40),
            child: const Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          footer: Container(
            height: 50,
            width: double.infinity,
            color: Color.fromARGB(255, 231, 147, 11),
            child: const Center(
              child: Text(
                'Made By Devansh',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }
}
