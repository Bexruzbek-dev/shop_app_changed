import 'package:flutter/material.dart';
import 'package:shop_app/controller/product_controller.dart';
import 'package:shop_app/views/widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  final String imagePath;
  final ProductController controller = ProductController();

  ProductScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Sort by';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Related Products',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {},
                        items: <String>['Sort by', 'A - Z', 'Z - A', 'Newest']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                ProductCard(products: controller.products),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
