// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeView(
          key: args.key,
          productUrl: args.productUrl,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    WebRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WebView(),
      );
    },
  };
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    required String productUrl,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            productUrl: productUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.productUrl,
  });

  final Key? key;

  final String productUrl;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, productUrl: $productUrl}';
  }
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebView]
class WebRoute extends PageRouteInfo<void> {
  const WebRoute({List<PageRouteInfo>? children})
      : super(
          WebRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
