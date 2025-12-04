import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class ProductSlider extends StatelessWidget {
  final int initialIndex;
  final List<String> items;

  const ProductSlider({
    required this.initialIndex,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items.map((img) => Image.network(img)).toList(),
      options: CarouselOptions(
        initialPage: initialIndex,
      ),
    );
  }
}
