import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_text_field.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    void signIn() {
      context.read<AuthCubit>().signIn(
            email: emailController.text.trim(),
            password: passwordController.text,
          );
      // Go.routeWithPath(context: context, path: '/main');
    }

    void signUp() {
      Go.routeWithPath(context: context, path: '/sign-up');
    }

    void routeMainPage() {
      Go.routeWithPath(context: context, path: '/main');
    }

    void signInWithGoogle() {}

    Widget logo() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
        ),
        child: Image.asset('assets/images/logo_bsi.jpg', width: 50, height: 50),
      );
    }

    Widget formSignIn() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Welcome Back!',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: defaultMargin),
            CustomTextField(
              title: 'Email address',
              controller: emailController,
            ),
            const SizedBox(height: 13),
            CustomTextField(
              title: 'Password',
              isObscure: true,
              controller: passwordController,
            ),
            const SizedBox(height: 21),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                    ),
                  );
                }
                if (state is AuthSuccess) {
                  Go.routeWithPathAndRemove(context: context, path: '/main');
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                  title: 'Sign in',
                  backgroundColor: blueColor,
                  borderRadius: 50,
                  onPressed: signIn,
                  textStyle: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                );
              },
            ),
            const SizedBox(height: 17),
            CustomButton(
              title: 'Sign up',
              backgroundColor: grayColor,
              borderRadius: 50,
              onPressed: signUp,
              textStyle: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            kDebugMode
                ? CustomButton(
                    title: 'debug only',
                    backgroundColor: grayColor,
                    borderRadius: 50,
                    onPressed: routeMainPage,
                    textStyle: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    }

    Widget orDivider() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 26),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: grayColor,
              ),
            ),
            SizedBox(
              width: 32,
              child: Text(
                'or',
                style: grayTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Divider(
                color: grayColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget signInGoogle() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: CustomButton(
          title: 'Continue with Google',
          backgroundColor: blackColor,
          borderRadius: 50,
          onPressed: signInWithGoogle,
          iconUrl: 'assets/images/ic_google.png',
          textStyle: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logo(),
            formSignIn(),
            orDivider(),
            signInGoogle(),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
      resizeToAvoidBottomInset: false,
    );
  }
}
