import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_text_field.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    void signUp() {
      context.read<AuthCubit>().signUp(
            email: emailController.text.trim(),
            password: passwordController.text,
            name: nameController.text,
          );
    }

    void routeToSignInPage() {
      Go.routeWithPath(context: context, path: '/sign-in');
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
          'Create Your Account',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget formSignUp() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            title: 'Full name',
            controller: nameController,
          ),
          const SizedBox(height: 13),
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

    Widget buttonSignUp() {
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
              title: 'Create my account',
              backgroundColor: primaryColor,
              borderRadius: 50,
              onPressed: signUp,
              textStyle: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          );
        },
      );
    }

    Widget orDivider() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 26),
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

    Widget haveAccount() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'have an account? ',
              style: darkGrayTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
            ),
            GestureDetector(
              onTap: routeToSignInPage,
              child: Text(
                'Sign-in',
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
                  formSignUp(),
                  buttonSignUp(),
                  orDivider(),
                  buttonSignInGoogle(),
                  haveAccount(),
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
