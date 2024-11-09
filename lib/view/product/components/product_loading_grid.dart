import 'package:flutter/material.dart';
import 'package:my_groceery_mobile/view/product/components/product_loading_card.dart';

class ProductLoadingGrid extends StatelessWidget {
  const ProductLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 2/3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ), 
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: 6,
      itemBuilder: (context, index) => const ProductLoadingCard()
    );
  }
}