import 'package:flutter/material.dart';
import 'package:shop_go/product/app/app_colors.dart';
import 'package:shop_go/product/app/app_constants.dart';
import 'package:shop_go/product/app/app_initialize.dart';

Future<void> main() async {
  await AppInitialize().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        ),
        routerDelegate: AppConstants.appRouter.delegate(),
        routeInformationParser: AppConstants.appRouter.defaultRouteParser());
  }
}
