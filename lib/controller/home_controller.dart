import 'package:get/get.dart';
import 'package:my_groceery_mobile/model/ad_banner.dart';
import 'package:my_groceery_mobile/model/category.dart' as grocery;
import 'package:my_groceery_mobile/model/product.dart';
import 'package:my_groceery_mobile/service/local_service/local_ad_banner_service.dart';
import 'package:my_groceery_mobile/service/remote_service/remote_banner_service.dart';
import 'package:my_groceery_mobile/service/remote_service/remote_popular_category_service.dart';
import 'package:my_groceery_mobile/service/remote_service/remote_popular_product.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxList<AdBanner> bannerList = RxList<AdBanner>();
  RxList<grocery.Category> popularCategoryList = RxList<grocery.Category>();
  RxList<Product> popularProductList = RxList<Product>();

  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;

  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  Future<void> initialize() async {
    await _localAdBannerService.init();
    getAdBanners();
    getPopularCategories();
    getPopularProducts();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);

      var localBanners = _localAdBannerService.getAdBanners();
      if (localBanners.isNotEmpty) {
        bannerList.assignAll(localBanners);
      } else {
        print('No banners found in local cache.');
      }

      if (localBanners.isEmpty) {
        var result = await RemoteBannerService().get();
        if (result != null) {
          var fetchedBanners = AdBannerListFromJson(result);
          bannerList.assignAll(fetchedBanners);
          await _localAdBannerService.assignAllAdBanners(adBanners: fetchedBanners);
        }
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
