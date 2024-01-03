import 'package:shop_go/core/cache/cache_manager.dart';
import 'package:shop_go/feature/login/cubit/i_login_cubit.dart';
import 'package:shop_go/feature/login/cubit/login_state.dart';
import 'package:shop_go/feature/login/model/login_request_model.dart';
import 'package:shop_go/feature/login/service/i_login_service.dart';
import 'package:shop_go/feature/login/service/login_service.dart';
import 'package:shop_go/product/enum/cache_keys.dart';

class LoginCubit extends ILoginCubit {
  LoginCubit() : super(LoginState.initial()) {
    init();
  }
  late ILoginService _loginService;

  @override
  void changeVisible() => emit(state.copyWith(isVisible: !state.isVisible));
  @override
  void setUsername(String username) => emit(state.copyWith(username: username));
  @override
  void setPassword(String password) => emit(state.copyWith(password: password));
  @override
  void setErrorMessage(String message) => emit(state.copyWith(errorMessage: message));
  @override
  void clearErrorMessage() => emit(state.copyWith(errorMessage: ''));

  @override
  void init() {
    _loginService = LoginService();
  }

  @override
  Future<void> logIn() async {
    final result = await _loginService.logIn(
        model: LoginRequestModel(username: state.username, password: state.password));
    result.fold((failure) => setErrorMessage(failure.message), (token) async {
      await CacheManager.instance.setStringValue(CacheKeys.access, token.access!);
      await CacheManager.instance.setStringValue(CacheKeys.refresh, token.refresh!);
    });
  }
}
