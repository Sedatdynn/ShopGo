import 'package:flutter/material.dart';
import 'package:shop_go/core/cache/cache_manager.dart';
import 'package:shop_go/core/network/netwrok_manager.dart';
import 'package:shop_go/feature/login/view/login_view.dart';
import 'package:shop_go/product/app/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.preferencesInit();
  await NetworkManager.instance.init(
    baseUrl: AppConstants.baseUrl,
    sendTimeOut: AppConstants.sendTimeout,
    connectTimeOut: AppConstants.connectTimeout,
    receiveTimeOut: AppConstants.receiveTimeout,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
      ),
      home: const LoginView(),
    );
  }
}
