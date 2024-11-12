import 'package:flutter/material.dart';
import 'package:mewwing_mobile/widgets/left_drawer.dart';
import 'package:mewwing_mobile/screens/add_product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String storeName = 'Mewwing E-Commerce';
  
  final List<Color> _itemColors = [
    const Color(0xFF2C5F2D),
    const Color(0xFFFFB200), 
    Colors.red,
  ];

  final List<Product> products = [
    Product(
      name: "Dummy Data 1: Beluga",
      price: 50.00,
      category: "Kucing Rumah",
      image: "https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?q=65&auto=format&w=1600&ar=2:1&fit=crop",
    ),
    Product(
      name: "Dummy Data 2: Roti Gemblong",
      price: 120.00,
      category: "Kucing Bola Bulu",
      image: "https://s.puainta.com/static/uploadimages/4096567/ead29af406822c5ee6dd27b65b341fa4.webp",
    ),
    Product(
      name: "Dummy Data 3: Confused Cat",
      price: 41.00,
      category: "Kucing Rumah",
      image: "https://a.pinatafarm.com/940x529/254350840f/white-cat-da2c837628aa5a4d253f3956efa6244f-meme.jpeg",
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          storeName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C5F2D),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2C5F2D), Color(0xFFFFB200)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Mewwing',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Apakah Anda butuh teman untuk menemani di hari-hari sibuk? Kami siap membantu! Di Mewwing, Anda dapat menikmati kebahagiaan dan ketenangan dengan meminjam kucing yang lucu dan menggemaskan.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    
                  ],
                ),
              ),

              const SizedBox(height: 24.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildCategoryCard(Icons.pets, 'Kucing Garong'),
                        _buildCategoryCard(Icons.home, 'Kucing Rumah'),
                        _buildCategoryCard(Icons.brightness_7, 'Kucing Oren'),
                        _buildCategoryCard(Icons.catching_pokemon, 'Kucing Bola Bulu'),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Arrivals',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List.generate(3, (index) {
          IconData icon;
          String label;
          
          switch (index) {
            case 0:
              icon = Icons.home;
              label = 'Home';
              break;
            case 1:
              icon = Icons.add_shopping_cart;
              label = 'Add Product';
              break;
            case 2:
              icon = Icons.logout;
              label = 'Logout';
              break;
            default:
              icon = Icons.error;
              label = 'Error';
          }
          
          return BottomNavigationBarItem(
            icon: Icon(
              icon,
              color: _selectedIndex == index ? _itemColors[index] : Colors.grey,
            ),
            label: label,
          );
        }),
        currentIndex: _selectedIndex,
        selectedItemColor: _itemColors[_selectedIndex],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddProductScreen()),
              );
            case 2:
              break;
          }
        },
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String name) {
    return SizedBox(
      width: 100,
      child: Card(
        color: const Color(0xFFFFB200).withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: const Color(0xFF2C5F2D)),
              const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String category;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.image,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Rp${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}