import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/data/models/user_model.dart';
import 'package:ta_bsi/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/page/page_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onTapButtonLogout() {
      context.read<AuthCubit>().signOut();
    }

    Widget displayAccount(UserModel user) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                user.name,
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                user.email,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonLogout() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: CustomButton(
          title: 'Logout',
          backgroundColor: primaryColor,
          borderRadius: 50,
          onPressed: onTapButtonLogout,
          textStyle: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              context.read<PageCubit>().setPage(0);
              Go.routeWithPathAndRemove(context: context, path: '/sign-in');
            }
          },
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    displayAccount(state.user),
                    buttonLogout(),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
