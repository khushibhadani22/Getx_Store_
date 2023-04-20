import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_pr/views/screens/details_page.dart';
import 'package:getx_pr/views/screens/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/detail', page: () => const DetailsPage()),
      ],
    );
  }
}
