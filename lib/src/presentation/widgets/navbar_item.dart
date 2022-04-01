import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/presentation/cubit/page/page_cubit.dart';

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
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Image.asset(
        context.read<PageCubit>().state != index
            ? inactiveImageUrl
            : activeImageUrl,
        width: 24,
      ),
    );
  }
}
