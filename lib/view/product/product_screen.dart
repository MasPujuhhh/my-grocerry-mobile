import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_groceery_mobile/component/main_header.dart';
import 'package:my_groceery_mobile/controller/product_controller.dart';
import 'package:my_groceery_mobile/view/product/components/product_grid.dart';
import 'package:my_groceery_mobile/view/product/components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: Obx((){
              if (ProductController.instance.productList.isNotEmpty) {
                return ProductGrid(products: ProductController.instance.productList);
              } else {
                return const ProductLoadingGrid();
              }
            })
          )
      ],
    ));
  }
}