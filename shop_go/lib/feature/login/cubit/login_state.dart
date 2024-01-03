import 'package:shop_go/core/base/cubit/base_cubit.dart';

class LoginState extends BaseState {
  const LoginState(
      {required this.states,
      required this.username,
      required this.password,
      required this.isVisible,
      required this.errorMessage});
  final LoginStates states;
  final String? username;
  final String? password;
  final bool isVisible;
  final String? errorMessage;

  factory LoginState.initial() {
    return const LoginState(
      states: LoginStates.initial,
      username: '',
      password: '',
      isVisible: true,
      errorMessage: null,
    );
  }

  @override
  List<Object?> get props => [states, username, password, isVisible, errorMessage];

  LoginState copyWith({
    LoginStates? states,
    String? username,
    String? password,
    bool? isVisible,
    String? errorMessage,
  }) {
    return LoginState(
      states: states ?? this.states,
      username: username ?? this.username,
      password: password ?? this.password,
      isVisible: isVisible ?? this.isVisible,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum LoginStates { initial, loading, completed, error }
