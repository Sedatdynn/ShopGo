import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop_go/feature/home/view/home_view.dart';
import 'package:shop_go/feature/login/view/login_view.dart';
import 'package:shop_go/feature/splash/splash_view.dart';
import 'package:shop_go/feature/web_view/web_view_screen.dart';

import 'auto_route_path.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: RouteConstants.splash, page: SplashRoute.page),
        AutoRoute(path: RouteConstants.login, page: LoginRoute.page),
        AutoRoute(path: RouteConstants.webview, page: WebRoute.page),
        AutoRoute(path: RouteConstants.home, page: HomeRoute.page),
      ];
}
