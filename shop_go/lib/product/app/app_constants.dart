import 'package:flutter/material.dart';
import 'package:shop_go/core/navigator/app_router.dart';

@immutable
final class AppConstants {
  const AppConstants._();
  static const sendTimeout = 60;
  static const connectTimeout = 60;
  static const receiveTimeout = 60;
  static final appRouter = AppRouter();
}
