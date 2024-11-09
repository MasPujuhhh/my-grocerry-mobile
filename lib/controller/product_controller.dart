import 'package:get/get.dart';
import 'package:my_groceery_mobile/model/product.dart';
import 'package:my_groceery_mobile/service/remote_service/remote_product_service.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try{
      isProductLoading(true);
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }
}