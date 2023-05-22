import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:test_store_web/views/screens/categories.dart';
import 'package:test_store_web/views/screens/dashboard.dart';
import 'package:test_store_web/views/screens/orders.dart';
import 'package:test_store_web/views/screens/products.dart';
import 'package:test_store_web/views/screens/upload_banners.dart';
import 'package:test_store_web/views/screens/vendors.dart';
import 'package:test_store_web/views/screens/withdrawal.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _screenSelected = const UploadBannerScreen();
  screenSelector(item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _screenSelected = const DashboardScreen();
        });
        break;
      case VendorsScreen.routeName:
        setState(() {
          _screenSelected = const VendorsScreen();
        });
        break;
      case OrdersScreen.routeName:
        setState(() {
          _screenSelected = const OrdersScreen();
        });
        break;
      case CategorieScreen.routeName:
        setState(() {
          _screenSelected = const CategorieScreen();
        });
        break;
      case ProductScreen.routeName:
        setState(() {
          _screenSelected = const ProductScreen();
        });
        break;
      case UploadBannerScreen.routeName:
        setState(() {
          _screenSelected = const UploadBannerScreen();
        });
        break;
      case WithdrawalScreen.routeName:
        setState(() {
          _screenSelected = const WithdrawalScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            route: DashboardScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Vendors',
            icon: Icons.emoji_people,
            route: VendorsScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Withdrawal',
            icon: Icons.attach_money,
            route: WithdrawalScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Orders',
            icon: Icons.shopping_cart_outlined,
            route: OrdersScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category,
            route: CategorieScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Upload Banner',
            icon: Icons.add,
            route: UploadBannerScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Products',
            icon: Icons.shopping_bag_outlined,
            route: ProductScreen.routeName,
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          screenSelector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'New Store Panel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      appBar:
          AppBar(backgroundColor: Colors.black, title: const Text('Managment')),
      body: _screenSelected,
    );
  }
}
