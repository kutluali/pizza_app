import 'package:flutter/material.dart';
import 'package:pizza_app/Views/detail.dart';
import 'package:pizza_app/Views/product_page.dart';
import 'package:pizza_app/Views/splash_screen.dart';
import 'package:pizza_app/Widgets/custom_button_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //Navi Bar olan sayfaları main olarak ilk ataması yapılır
      routes: {
        //Projeyi Navi olan kısımlı sayfalara atmak için direk Custom sayfasına yönlendir.
        "/main": (context) => CustomButtonNavigationBar(),
      },
    );
  }
}
