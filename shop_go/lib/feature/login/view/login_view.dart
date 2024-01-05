import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_go/feature/login/cubit/login_cubit.dart';
import 'package:shop_go/feature/login/cubit/login_state.dart';
import 'package:shop_go/product/app/app_colors.dart';
import 'package:shop_go/product/widget/loading/loading_widget.dart';
import 'package:shop_go/product/widget/padding/app_paddings.dart';
part './login_subview.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Padding(
          padding: const AppPadding.normalAll(),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('SHOP & GO', style: Theme.of(context).textTheme.titleLarge)),
                  const SizedBox(height: 30),
                  const _UsernameTextField(),
                  const _PasswordTextField(),
                  const SizedBox(height: 30),
                  const _LoginButton()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
