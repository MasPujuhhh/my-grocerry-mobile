import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_groceery_mobile/model/ad_banner.dart';
import 'package:my_groceery_mobile/route/app_page.dart';
import 'package:my_groceery_mobile/route/app_route.dart';
import 'package:my_groceery_mobile/theme/app_theme.dart'; // Import the AppTheme file

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // register adapters
  Hive.registerAdapter(AdBannerAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Use AppTheme.lightTheme here
      themeMode: ThemeMode.light,
    );
  }
}
