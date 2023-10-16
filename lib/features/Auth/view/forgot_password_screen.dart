import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/components/custom_button.dart';
import 'package:todoapp/core/components/custom_text_field.dart';
import 'package:todoapp/features/Auth/cubit/auth_cubit.dart';
import 'package:todoapp/features/Auth/cubit/user_state.dart';
import 'package:todoapp/features/Auth/view/login_screen.dart';
import 'package:todoapp/features/Home/view/screens/home_screen.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: emailController, label: 'Email'),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<AuthCubit, UserState>(
              listener: (context, state) {
                if (state is UserForgotPassword) {
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
                      .forgotPassword(emailController.text);
                }, title: "Reset");
              },
            ),

          ],
        ),
      ),
    );
  }
}
