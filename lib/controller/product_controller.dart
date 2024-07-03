import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/models/product_model.dart';

class ProductController with ChangeNotifier {
  List<Product> products = [
    Product(
      image: "assets/images/microwave.png",
      name: "",
      description: "Description of Product 1",
      price: 99.99,
    ),
    Product(
      image: "assets/images/conditioner.png",
      name: "Konditsioner",
      description: "Description of Product 2",
      price: 149.99,
    ),
  ];

  final Map<String, String> imgList = {
    "assets/images/living_room.png": "Living Room",
    "assets/images/walldecoration.png": "Wall Decoration",
  };

  final CarouselOptions carouselOptions = CarouselOptions(
    height: 200.0,
    enlargeCenterPage: true,
    autoPlay: true,
    aspectRatio: 16 / 9,
    autoPlayCurve: Curves.fastOutSlowIn,
    enableInfiniteScroll: true,
    autoPlayAnimationDuration: const Duration(seconds: 1),
    viewportFraction: 0.8,
  );

  Future<void> addProduct(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final newProduct = Product(
        image: pickedFile.path,
        name: "New Product",
        description: "Description of New Product",
        price: 199.99,
      );

      products.add(newProduct);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image selected.'),
        ),
      );
    }
  }

  Future<void> showImageSourceDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await addProduct(context, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await addProduct(context, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
