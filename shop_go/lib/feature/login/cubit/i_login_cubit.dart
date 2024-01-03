import 'package:shop_go/core/base/cubit/base_cubit.dart';
import 'package:shop_go/feature/login/cubit/login_state.dart';

abstract class ILoginCubit extends BaseCubit<LoginState> {
  ILoginCubit(super.initialState);
  void changeVisible();
  void setUsername(String username);
  void setPassword(String password);
  void setErrorMessage(String message);
  void clearErrorMessage();
  Future<void> logIn();
}
