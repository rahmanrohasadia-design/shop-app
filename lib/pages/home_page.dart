import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';
import 'package:shop_app_flutter/pages/login_page.dart';
import 'package:shop_app_flutter/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage == 0
          ? const ProductList()
          : const CartPage(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              iconSize: 35,
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              iconSize: 35,
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
            ),
            TextButton.icon(
        onPressed: logout,
        icon: const Icon(Icons.logout,
         color: Colors.red,
         size: 32,),
        label: const Text(
          "Logout",
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}
