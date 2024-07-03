import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controller/cart_provider.dart';
import 'package:shop_app/controller/product_controller.dart';
import 'package:shop_app/views/screens/cart_screen.dart';
import 'package:shop_app/views/widgets/carousel_widget.dart';
import 'package:shop_app/views/widgets/change_background_chip.dart';
import 'package:shop_app/views/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/hotel.png"),
              radius: 20,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(),
              child: Container(),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Product'),
              onTap: () async {
                await Provider.of<ProductController>(context, listen: false)
                    .showImageSourceDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/sign-in');
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<ProductController>(
            builder: (context, controller, child) {
              return CarouselWidget(
                imgList: controller.imgList,
                carouselOptions: controller.carouselOptions,
              );
            },
          ),
          const SizedBox(height: 20),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GrayBackgroundChip(label: Text("Popular")),
                  SizedBox(width: 10),
                  GrayBackgroundChip(label: Text("Discount")),
                  SizedBox(width: 10),
                  GrayBackgroundChip(label: Text("New")),
                  SizedBox(width: 10),
                  GrayBackgroundChip(label: Text("Best Selling")),
                  SizedBox(width: 10),
                  GrayBackgroundChip(label: Text("Discount")),
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer<ProductController>(
              builder: (context, controller, child) {
                return ProductCard(products: controller.products);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return FloatingActionButton(
            backgroundColor: const Color(0xFFA0CB8B),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => CartScreen(cartItems: cart.cartItems),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
