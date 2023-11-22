// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/presentation/cubit/page/page_cubit.dart';
import 'package:ta_bsi/src/presentation/pages/event_page.dart';
import 'package:ta_bsi/src/presentation/pages/explore_page.dart';
import 'package:ta_bsi/src/presentation/pages/home_page.dart';
import 'package:ta_bsi/src/presentation/pages/profile_page.dart';
import 'package:ta_bsi/src/presentation/widgets/navbar_item.dart';
import 'package:ta_bsi/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ExplorePage();
        case 2:
          return EventPage();
        case 3:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    Widget navBarButton() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 1),
                color: primaryColor.withOpacity(0.20),
              ),
            ],
          ),
          child: Row(
            children: [
              NavbarItem(
                index: 0,
                inactiveImageUrl: 'assets/images/ic_home.png',
                activeImageUrl: 'assets/images/ic_home_filled.png',
              ),
              NavbarItem(
                index: 1,
                inactiveImageUrl: 'assets/images/ic_explore.png',
                activeImageUrl: 'assets/images/ic_explore_filled.png',
              ),
              // NavbarItem(
              //   index: 2,
              //   inactiveImageUrl: 'assets/images/ic_event.png',
              //   activeImageUrl: 'assets/images/ic_event_filled.png',
              // ),
              NavbarItem(
                index: 3,
                inactiveImageUrl: 'assets/images/ic_profile.png',
                activeImageUrl: 'assets/images/ic_profile_filled.png',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      return BlocBuilder<PageCubit, int>(
        builder: (context, currentIndex) {
          return Stack(
            children: [
              buildContent(currentIndex),
              navBarButton(),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
