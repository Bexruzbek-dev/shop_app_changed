import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/views/screens/product_screen.dart';

class CarouselWidget extends StatelessWidget {
  final Map<String, String> imgList;
  final CarouselOptions carouselOptions;

  CarouselWidget({required this.imgList, required this.carouselOptions});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: carouselOptions,
      items: imgList.entries.map((entry) {
        final imagePath = entry.key;
        final title = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductScreen(imagePath: imagePath),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                filterQuality: FilterQuality.high,
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
