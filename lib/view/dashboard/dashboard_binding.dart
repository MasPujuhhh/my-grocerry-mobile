import 'package:get/get.dart';
import 'package:my_groceery_mobile/controller/dashboard_controller.dart';
import 'package:my_groceery_mobile/controller/home_controller.dart';
import 'package:my_groceery_mobile/controller/product_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies(){
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
  }
}