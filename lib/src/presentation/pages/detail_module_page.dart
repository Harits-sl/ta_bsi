import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ta_bsi/src/presentation/cubit/detailModule/detail_module_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_app_bar.dart';
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

    context.read<DetailModuleCubit>().fetchListModule(widget.arguments['id']);
  }

  // @override
  // void dispose() {
  //   _detailModuleCubit.close();
  //   super.dispose();
  // }

  /// fungsi untuk button continue
  void onPressedButtonContinue(int endCourse) {
    /// jika [_index] sama dengan banyaknya paragraf
    if (_index == endCourse) {
      context.read<DetailModuleCubit>().incrementIndexListIdMateri();
      context.read<DetailModuleCubit>().fetchNewListModule();
      setState(() {
        _index = 0;
      });

      return;
    }

    if (_index != endCourse) {
      // context.read<IndexDetailModuleCubit>().incrementIndex();
      setState(() {
        _index++;
      });

      WidgetsBinding.instance!.addPostFrameCallback(
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

  // void splitHtml(String html) {
  //   // clear terlebih dahulu karena setiap render ulang memanggil fungsi ini
  //   listSplitHtml.clear();
  //   // melakukan split html <div>
  //   List<String> split = html.split("<div>");

  //   // tambahkan lagi <div>
  //   for (int i = 0; i < split.length; i++) {
  //     split[i] = '<div>' + split[i];

  //     // memasukan data yang sudah ditambahkan div kedalam list
  //     listSplitHtml.add(split[i]);
  //   }

  //   // hapus list pertama karena list pertama kosong
  //   listSplitHtml.remove('<div>');
  //   print(listSplitHtml.length);
  // }

  @override
  Widget build(BuildContext context) {
    void onTapAppBar() {
      // context.read<DetailModuleCubit>().clearState();

      Go.back(context);
    }

    /// filter atau mencari materi yang cocok dari argument id dengan
    /// listDummyCourse
    // DetailModuleModel findDetailModule(List listDetailModule) {
    //   DetailModuleModel _course = listDetailModule
    //       .where((item) => item.id == widget.arguments['id'])
    //       .toList()
    //       .first;
    //   return _course;
    // }

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

    Widget buttonContinue(int endCourse) {
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
                  title: 'Tap to continue',
                  backgroundColor: Colors.transparent,
                  isNotSplash: true,
                  borderRadius: 50,
                  onPressed: () {
                    onPressedButtonContinue(endCourse);
                  },
                  textStyle: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              : CustomButton(
                  title: 'Continue',
                  backgroundColor: primaryColor,
                  borderRadius: 50,
                  onPressed: () {
                    onPressedButtonContinue(endCourse);
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
            print('statessss $state');
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
                  buttonContinue(state.listMateri.length - 1),
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
