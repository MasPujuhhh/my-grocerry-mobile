import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_groceery_mobile/component/main_header.dart';
// ignore: unused_import
import 'package:my_groceery_mobile/controller/controllers.dart';
import 'package:my_groceery_mobile/controller/home_controller.dart';
import 'package:my_groceery_mobile/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:my_groceery_mobile/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:my_groceery_mobile/view/home/components/popular_category/popular_category.dart';
import 'package:my_groceery_mobile/view/home/components/popular_category/popular_category_loading.dart';
import 'package:my_groceery_mobile/view/home/components/popular_product/popular_product.dart';
import 'package:my_groceery_mobile/view/home/components/popular_product/popular_product_loading.dart';
import 'package:my_groceery_mobile/view/home/components/popular_product/popular_product_loading_card.dart';
import 'package:my_groceery_mobile/view/home/components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Pastikan homeController diinisialisasi
    final HomeController homeController = Get.find<HomeController>(); // Mengambil controller yang sudah ada

    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(() {
                    if (homeController.bannerList.isNotEmpty) {
                      return CarouselSliderView(bannerList: homeController.bannerList);
                    } else {
                      return const CarouselLoading();
                    }
                  }),
                  const SectionTitle(title: "Popular Categories"),
                  Obx(() {
                    if (homeController.popularCategoryList.isNotEmpty) {
                      return PopularCategory(categories: homeController.popularCategoryList);
                    } else {
                      return const PopularCategoryLoading();
                    }
                  }),
                  const SectionTitle(title: "Popular Products"),
                  Obx(() {
                    if (homeController.popularProductList.isNotEmpty) {
                      return PopularProduct(popularProducts: homeController.popularProductList);
                    } else {
                      return const PopularProductLoading();
                    }
                  }),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
