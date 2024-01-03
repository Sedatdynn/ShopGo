import 'package:flutter/material.dart';

@immutable
final class AppConstants {
  const AppConstants._();
  static const String wssUrl = 'wss://api.bravoshopgo.com/ws/api/v1/';
  static const String baseUrl = 'https://api.bravoshopgo.com/api/v1/';
  static const sendTimeout = 60;
  static const connectTimeout = 60;
  static const receiveTimeout = 60;
}
