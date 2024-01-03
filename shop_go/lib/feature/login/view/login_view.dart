import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_go/feature/login/cubit/login_cubit.dart';
import 'package:shop_go/feature/login/cubit/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('SHOP & GO', style: Theme.of(context).textTheme.titleLarge)),
                  const SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.titleSmall,
                    keyboardType: TextInputType.name,
                    onChanged: (val) => context.read<LoginCubit>().setUsername(val),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.supervised_user_circle_sharp,
                            color: Colors.deepOrangeAccent),
                        hintText: 'username',
                        hintStyle: Theme.of(context).textTheme.bodyLarge),
                  ),
                  TextFormField(
                      style: Theme.of(context).textTheme.titleSmall,
                      onChanged: (val) {
                        if (val.isEmpty) return;
                        context.read<LoginCubit>().setPassword(val);
                      },
                      obscureText: state.isVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key, color: Colors.deepOrangeAccent),
                        hintText: 'password',
                        suffixIcon: InkWell(
                          onTap: () => context.read<LoginCubit>().changeVisible(),
                          child: _CheckVisible(isVisible: state.isVisible),
                        ),
                      )),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => context.read<LoginCubit>().logIn(),
                        child: const Text('Login')),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CheckVisible extends StatelessWidget {
  const _CheckVisible({required this.isVisible});
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return isVisible ? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined);
  }
}
