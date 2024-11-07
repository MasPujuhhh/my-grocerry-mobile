import 'package:get/get.dart';
import 'package:my_groceery_mobile/model/ad_banner.dart';
import 'package:my_groceery_mobile/model/category.dart' as grocery;
import 'package:my_groceery_mobile/model/product.dart';
import 'package:my_groceery_mobile/service/remote_service/remote_banner_service.dart';
import 'package:my_groceery_mobile/service/remote_service/remote_popular_category_service.dart';
import 'package:my_groceery_mobile/service/remote_service/remote_popular_product.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<grocery.Category> popularCategoryList = List<grocery.Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;

  @override
  void onInit() {
    getAdBanners();
    getPopularCategories();
    getPopularProducts();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(AdBannerListFromJson(result));
      } else {
        print('No banners found.');
      }
    } catch (e) {
      print('Error fetching banners: $e');
    } finally {
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(grocery.popularCategoryListFromJson(result));
      } else {
        print('No popular categories found.');
      }
    } catch (e) {
      print('Error fetching popular categories: $e');
    } finally {
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProducts() async {
    try {
      isPopularProductLoading(true);
      var result = await RemotePopularProduct().get();
      if (result != null) {
        popularProductList.assignAll(popularProductListFromJson(result));
      } else {
        print('No popular products found.');
      }
    } catch (e) {
      print('Error fetching popular products: $e');
    } finally {
      isPopularProductLoading(false);
    }
  }
}
