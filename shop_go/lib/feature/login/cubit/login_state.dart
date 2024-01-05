import 'package:shop_go/core/base/cubit/base_cubit.dart';

class LoginState extends BaseState {
  const LoginState({
    required this.states,
    required this.username,
    required this.password,
    required this.isVisible,
    required this.errorMessage,
    required this.isLoading,
  });
  final LoginStates states;
  final String? username;
  final String? password;
  final bool isVisible;
  final String? errorMessage;
  final bool isLoading;

  factory LoginState.initial() {
    return const LoginState(
      states: LoginStates.initial,
      username: '',
      password: '',
      isVisible: true,
      errorMessage: null,
      isLoading: false,
    );
  }

  @override
  List<Object?> get props => [states, username, password, isVisible, errorMessage, isLoading];

  LoginState copyWith({
    LoginStates? states,
    String? username,
    String? password,
    bool? isVisible,
    String? errorMessage,
    bool? isLoading,
  }) {
    return LoginState(
      states: states ?? this.states,
      username: username ?? this.username,
      password: password ?? this.password,
      isVisible: isVisible ?? this.isVisible,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

enum LoginStates { initial, loading, completed, error }
