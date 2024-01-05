import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_go/product/enum/image_png.dart';
import 'package:shop_go/product/utility/border_radi/border_radi.dart';

class CachedNetworkManager {
  static CachedNetworkManager? _instance;
  CachedNetworkManager._init();

  static CachedNetworkManager? get instance {
    _instance ??= CachedNetworkManager._init();
    return _instance;
  }

  Widget cachedNetworkImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return ClipRRect(
      borderRadius: BorderRadiAll.midCircular,
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        cacheKey: imageUrl,
        imageUrl: imageUrl,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator.adaptive()),
        errorWidget: (context, url, error) => ImagePath.shop_go.toPng(),
      ),
    );
  }
}
