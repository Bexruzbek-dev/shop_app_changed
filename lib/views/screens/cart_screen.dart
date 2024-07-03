import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controller/cart_provider.dart';
import 'package:shop_app/models/product_model.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;

  const CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('No items in the cart'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(item.image),
                    title: Text(item.name),
                    subtitle: Text('${item.description}\n\$${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).removeProduct(item);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
