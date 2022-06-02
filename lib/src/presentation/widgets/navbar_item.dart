import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/presentation/cubit/page/page_cubit.dart';
import 'package:ta_bsi/theme.dart';

class NavbarItem extends StatelessWidget {
  final String activeImageUrl;
  final String inactiveImageUrl;
  final int index;

  const NavbarItem({
    Key? key,
    required this.activeImageUrl,
    required this.inactiveImageUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SizedBox(
        height: 55,
        width: MediaQuery.of(context).size.width / 4,
        child: InkWell(
          splashColor: lightGreyColor,
          borderRadius: BorderRadius.circular(24),
          onTap: () {
            context.read<PageCubit>().setPage(index);
          },
          child: Center(
            child: Image.asset(
              context.read<PageCubit>().state != index
                  ? inactiveImageUrl
                  : activeImageUrl,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
