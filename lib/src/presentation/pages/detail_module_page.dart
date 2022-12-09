import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ta_bsi/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/detailModule/detail_module_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/userModule/user_module_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_app_bar.dart';
import 'package:ta_bsi/src/utils/helper/string_helper.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class DetailModulePage extends StatefulWidget {
  const DetailModulePage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;

  @override
  State<DetailModulePage> createState() => _DetailModulePageState();
}

class _DetailModulePageState extends State<DetailModulePage> {
  late int _index;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();

    _index = 0;
    _scrollController = ScrollController();

    context
        .read<DetailModuleCubit>()
        .fetchListModule(widget.arguments['id'], widget.arguments['module']);
  }

  // @override
  // void dispose() {
  //   // _detailModuleCubit.close();
  //   this.mounted = false;
  //   super.dispose();
  // }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  /// fungsi untuk button continue
  void onPressedButtonContinue(
    String id,
    int endCourse,
    String nextId,
  ) {
    String splitId = StringHelper.splitId(nextId);

    /// jika [_index] sama dengan banyaknya paragraf
    if (_index == endCourse) {
      AuthState authUserState = context.read<AuthCubit>().state;
      if (authUserState is AuthSuccess) {
        context.read<UserModuleCubit>().updateUserModule(
              idUser: authUserState.user.id,
              idModule: id,
              moduleDone: true,
              typeModule: widget.arguments['module'],
            );
      }

      if (splitId == 'quiz') {
        Go.routeWithPath(context: context, path: '/quiz');
        return;
      }

      context.read<DetailModuleCubit>().incrementIndexListIdMateri();
      context.read<DetailModuleCubit>().fetchNewListModule();

      if (mounted) {
        // check whether the state object is in tree
        setState(() {
          // make changes here
          _index = 0;
        });
      }
      // setState(() {
      // });

      return;
    }

    if (_index != endCourse) {
      // context.read<IndexDetailModuleCubit>().incrementIndex();
      if (mounted) {
        // check whether the state object is in tree
        setState(() {
          // make changes here
          _index++;
        });
      }
      // setState(() {
      // });

      WidgetsBinding.instance.addPostFrameCallback(
        (_) => {
          {
            if (_scrollController.hasClients)
              {
                _scrollController
                    .jumpTo(_scrollController.position.maxScrollExtent)
              }
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    void onTapAppBar() {
      // context.read<DetailModuleCubit>().clearState();

      Go.back(context);
    }

    Widget appBar(String title) {
      return CustomAppBar(title: title, onTap: onTapAppBar);
    }

    Widget course(List listMateri) {
      // splitHtml(module.materi);

      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin * 3,
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin * 2 + 45,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: listMateri.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _index >= index
                ? Html(
                    data: listMateri[index],
                    shrinkWrap: true,
                    style: {
                      'div': Style(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                      ),
                      'p': Style(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                        fontWeight: regular,
                        fontSize: const FontSize(16),
                        lineHeight: const LineHeight(
                          1.6,
                        ),
                      ),
                    },
                  )
                : Container();
          },
        ),
      );
    }

    Widget buttonContinue({
      required String id,
      required int endCourse,
      required String nextId,
    }) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: backgroundColor,
          padding: EdgeInsets.only(
            top: defaultMargin,
            bottom: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: _index != endCourse
              ? CustomButton(
                  title: 'Continue',
                  backgroundColor: Colors.transparent,
                  isNotSplash: true,
                  borderRadius: 50,
                  onPressed: () {
                    onPressedButtonContinue(id, endCourse, nextId);
                  },
                  textStyle: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              : CustomButton(
                  title: 'Next Course',
                  backgroundColor: primaryColor,
                  borderRadius: 50,
                  onPressed: () {
                    onPressedButtonContinue(id, endCourse, nextId);
                  },
                  textStyle: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: BlocBuilder<DetailModuleCubit, DetailModuleState>(
          builder: (context, state) {
            if (state is DetailModuleInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailModuleLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailModuleSuccess) {
              return Stack(
                children: [
                  appBar(state.module.namaMateri),
                  course(state.listMateri),
                  buttonContinue(
                    id: state.module.id,
                    endCourse: state.listMateri.length - 1,
                    nextId: state.nextId,
                  ),
                ],
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
