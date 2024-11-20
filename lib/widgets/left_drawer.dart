import 'package:flutter/material.dart';
import 'package:mewwing_mobile/screens/about_us.dart';
import 'package:mewwing_mobile/screens/add_product.dart';
import 'package:mewwing_mobile/screens/menu.dart';
import 'package:mewwing_mobile/screens/profile.dart'; 
import 'package:mewwing_mobile/screens/list_product.dart';
import 'package:mewwing_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2C5F2D), Color(0xFFFFB200)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mewwing E-Commerce',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Temukan teman berbulu yang menggemaskan!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                      size: 32,
                    )
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Color(0xFF2C5F2D),
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C5F2D),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person_outline,
                color: Color(0xFF2C5F2D),
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C5F2D),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.add_shopping_cart,
                color: Color(0xFF2C5F2D),
              ),
              title: const Text(
                'Add Product',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C5F2D),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AddProductScreen(),
                  ),
                );
              },
            ),
            ListTile(
                leading: const Icon(Icons.add_reaction_rounded),
                title: const Text('Product List'),
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductPage()),
                    );
                },
            ),
            const Divider(
              color: Color(0xFF2C5F2D),
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Color(0xFF2C5F2D),
              ),
              title: const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C5F2D),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              onTap: () async {
                final response = await request.logout(
                  "http://127.0.0.1:8000/auth/logout/");
                String message = response["message"];
                if (context.mounted) {
                  if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}