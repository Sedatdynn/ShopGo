part of './login_view.dart';

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: Theme.of(context).textTheme.titleSmall,
      keyboardType: TextInputType.name,
      onChanged: (val) => context.read<LoginCubit>().setUsername(val),
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.supervised_user_circle_sharp, color: AppColors.primary),
          hintText: 'username',
          hintStyle: Theme.of(context).textTheme.bodyLarge),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
            style: Theme.of(context).textTheme.titleSmall,
            onChanged: (val) {
              if (val.isEmpty) return;
              context.read<LoginCubit>().setPassword(val);
            },
            obscureText: state.isVisible,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.vpn_key, color: AppColors.primary),
              hintText: 'password',
              suffixIcon: InkWell(
                onTap: () => context.read<LoginCubit>().changeVisible(),
                child: _CheckVisible(isVisible: state.isVisible),
              ),
            ));
      },
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

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => context.read<LoginCubit>().logIn(),
              child: state.isLoading ? const LoadingWidget() : const Text('Login')),
        );
      },
    );
  }
}
