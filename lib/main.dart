import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertest/const/colors.dart';

import 'const/MyBehavior.dart';
import 'const/app_color.dart';
import 'const/spacing/spacing.dart';
import 'home_page.dart';
import 'model/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}
