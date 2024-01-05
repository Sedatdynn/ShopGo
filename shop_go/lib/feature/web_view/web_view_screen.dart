import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop_go/core/navigator/app_router.dart';
import 'package:shop_go/core/navigator/manager/auto_route_manager.dart';
import 'package:shop_go/product/app/config/app_env.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class WebView extends StatefulWidget {
  const WebView({Key? key}) : super(key: key);
  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.contains('merchantId')) {
            RouteManager.instance.push(HomeRoute(productUrl: request.url));
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(AppEnv().trendyolUrl));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (_) {
          _webViewGoBack();
        },
        child: Scaffold(
            body: WebViewWidget(
          controller: controller,
        )),
      ),
    );
  }

  Future<bool> _webViewGoBack() async {
    if (await controller.canGoBack()) {
      controller.goBack();
    } else {
      controller.loadRequest(Uri.parse(AppEnv().trendyolUrl));
      return Future.value(true);
    }
    return Future.value(true);
  }
}
