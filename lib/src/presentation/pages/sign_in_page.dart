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

    Widget title() {
      return Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Text(
          'Hi, Welcome Back!',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget formSignIn() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      );
    }

    Widget buttonSignIn() {
      return BlocConsumer<AuthCubit, AuthState>(
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
          return Container(
            margin: const EdgeInsets.only(top: 21),
            child: CustomButton(
              title: 'Sign in',
              backgroundColor: primaryColor,
              borderRadius: 50,
              onPressed: signIn,
              textStyle: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          );
        },
      );
    }

    Widget buttonDebugOnly() {
      return kDebugMode
          ? CustomButton(
              title: 'debug only',
              backgroundColor: greyColor,
              borderRadius: 50,
              onPressed: routeMainPage,
              textStyle: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            )
          : const SizedBox();
    }

    Widget orDivider() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 26),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: greyColor,
              ),
            ),
            SizedBox(
              width: 32,
              child: Text(
                'or',
                style: greyTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Divider(
                color: greyColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSignInGoogle() {
      return CustomButton(
        title: 'Continue with Google',
        backgroundColor: blackColor,
        borderRadius: 50,
        onPressed: signInWithGoogle,
        iconUrl: 'assets/images/ic_google.png',
        textStyle: whiteTextStyle.copyWith(
          fontSize: 14,
          fontWeight: semiBold,
        ),
      );
    }

    Widget createAccount() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'don\'t have an account? ',
              style: darkGreyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
            ),
            GestureDetector(
              onTap: signUp,
              child: Text(
                'Sign-up',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logo(),
            title(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: defaultMargin,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  formSignIn(),
                  buttonSignIn(),
                  buttonDebugOnly(),
                  orDivider(),
                  buttonSignInGoogle(),
                  createAccount(),
                ],
              ),
            ),
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
