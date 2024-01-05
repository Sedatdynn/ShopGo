import 'package:envied/envied.dart';
import 'package:shop_go/product/app/config/i_app_config.dart';

part 'app_env.g.dart';

@Envied(path: 'assets/env/.env')
final class AppEnv implements AppEnvConfigure {
  @EnviedField(varName: 'baseUrl')
  static const String _baseUrl = _AppEnv._baseUrl;
  @EnviedField(varName: 'wssUrl')
  static const String _wssUrl = _AppEnv._wssUrl;
  @EnviedField(varName: 'trendyolUrl')
  static const String _trendyolUrl = _AppEnv._trendyolUrl;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get trendyolUrl => _trendyolUrl;

  @override
  String get wssUrl => _wssUrl;
}
