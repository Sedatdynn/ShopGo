import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_go/core/cache/cache_manager.dart';
import 'package:shop_go/core/navigator/manager/auto_route_manager.dart';
import 'package:shop_go/feature/home/cubit/home_cubit.dart';
import 'package:shop_go/feature/home/cubit/home_state.dart';
import 'package:shop_go/feature/home/model/home_model.dart';
import 'package:shop_go/product/app/app_colors.dart';
import 'package:shop_go/product/app/config/app_env.dart';
import 'package:shop_go/product/enum/cache_keys.dart';
import 'package:shop_go/product/enum/image_png.dart';
import 'package:shop_go/product/utility/border_radi/border_radi.dart';
import 'package:shop_go/product/widget/cachedManager/cached_network_manager.dart';
import 'package:shop_go/product/widget/loading/loading_widget.dart';
import 'package:shop_go/product/widget/padding/app_paddings.dart';
import 'package:shop_go/product/widget/snackbar/custom_snackbar.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

part 'home_subview.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  final String productUrl;
  const HomeView({Key? key, required this.productUrl}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final channel = IOWebSocketChannel.connect(
      '${AppEnv().wssUrl}?token=${CacheManager.instance.getStringValue(CacheKeys.access.name)}',
      headers: {
        "Origin": "https://api.bravoshopgo.com",
      });

  @override
  void initState() {
    super.initState();
    sendData();
  }

  void sendData() {
    final Map<String, String> data = {"service": "trendyol", "product_url": widget.productUrl};
    channel.sink.add(json.encode(data));
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: Scaffold(
          body: StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final product = const HomeModel().fromJson(json.decode(snapshot.data.toString()));
                return product.status == 'success'
                    ? SingleChildScrollView(child: ProductDetailsWidget(product: product))
                    : const _EmptyDataWidget();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else {
                return const Center(child: Text('Beklenmedik bir hata ile karşılaşıldı'));
              }
            },
          ),
        ),
      ),
    );
  }
}
