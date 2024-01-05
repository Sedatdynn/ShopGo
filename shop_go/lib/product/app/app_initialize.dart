import 'package:flutter/material.dart';
import 'package:shop_go/core/cache/cache_manager.dart';
import 'package:shop_go/core/navigator/manager/auto_route_manager.dart';
import 'package:shop_go/core/network/netwrok_manager.dart';
import 'package:shop_go/product/app/app_constants.dart';
import 'package:shop_go/product/app/config/app_env.dart';

@immutable
final class AppInitialize {
  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    RouteManager.instance.init(AppConstants.appRouter);
    await CacheManager.preferencesInit();
    await NetworkManager.instance.init(
      baseUrl: AppEnv().baseUrl,
      sendTimeOut: AppConstants.sendTimeout,
      connectTimeOut: AppConstants.connectTimeout,
      receiveTimeOut: AppConstants.receiveTimeout,
    );
  }
}
