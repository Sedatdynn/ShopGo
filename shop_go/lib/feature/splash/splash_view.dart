import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop_go/core/cache/cache_manager.dart';
import 'package:shop_go/core/navigator/app_router.dart';
import 'package:shop_go/core/navigator/manager/auto_route_manager.dart';
import 'package:shop_go/product/enum/cache_keys.dart';
import 'package:shop_go/product/enum/image_png.dart';
import 'package:shop_go/product/widget/padding/app_paddings.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  Future<void> initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    final String? myToken = CacheManager.instance.getStringValue(CacheKeys.access.name);
    bool? isSuccess = ((myToken != null) && myToken.isNotEmpty) ? true : false;
    if (isSuccess) {
      RouteManager.instance.pushAndPopUntil(const WebRoute());
    } else {
      RouteManager.instance.pushAndPopUntil(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const AppPadding.minAll(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImagePath.shop_go.toPng(),
              Text(
                'SHOP&GO',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
