import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/components/custom_button.dart';
import 'package:todoapp/features/Auth/cubit/auth_cubit.dart';
import 'package:todoapp/features/Auth/cubit/user_state.dart';
import 'package:todoapp/features/Auth/view/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthCubit, UserState>(
          listener: (context, state) {
            if (state is UserUnAuthorized) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            } else if (state is UserError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            return CustomButton(onTap: () async {
              await context
                  .read<AuthCubit>()
                  .signOut();
            }, title: "Logout");
          },
        )
      ),
    );
  }
}
