import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ta_bsi/src/data/models/detail_module_model.dart';
import 'package:ta_bsi/src/presentation/cubit/detailModule/detail_module_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/presentation/widgets/header_back_and_title.dart';
import 'package:ta_bsi/theme.dart';

class DetailModulePageTest extends StatefulWidget {
  const DetailModulePageTest(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;

  @override
  State<DetailModulePageTest> createState() => _DetailModulePageTestState();
}

class _DetailModulePageTestState extends State<DetailModulePageTest> {
  late int _index;
  late ScrollController _scrollController;
  late List listSplitHtml;

  @override
  void initState() {
    super.initState();

    _index = 0;
    _scrollController = ScrollController();
    listSplitHtml = [];

    context.read<DetailModuleCubit>().fetchListModule(widget.arguments['id']);
  }

  /// fungsi untuk button continue
  void onPressedButtonContinue(int endCourse) {
    /// jika [_index] sama dengan banyaknya paragraf
    if (_index == endCourse) {
      return;
    }

    if (_index != endCourse) {
      setState(() {
        _index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String html =
    //     "<p>1 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android atau mobile, front-end, web, IoT, back-end (CLI), dan Game.</p> <p>2 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android atau mobile, front-end, web, IoT, back-end (CLI), dan Game.</p> <p>3 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android atau mobile, front-end, web, IoT, back-end (CLI), dan Game.</p> <p>4 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android atau mobile, front-end, web, IoT, back-end (CLI), dan Game.</p> <p>5 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android atau mobile, front-end, web, IoT, back-end (CLI), dan Game.</p>";
    String html =
        "<div><p>1Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android ataumobile, front-end, web, IoT, back-end (CLI), dan Game.</p></div><div><p>2 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android ataumobile, front-end, web, IoT, back-end (CLI), dan Game.</p></div><div><p>3 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android ataumobile, front-end, web, IoT, back-end (CLI), dan Game.</p></div><div><p>4 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android ataumobile, front-end, web, IoT, back-end (CLI), dan Game.</p></div><div><p>5 Dart merupakan bahasa pemrograman yang dikembangkan oleh google untuk kebutuhan dalam membuat aplikasi android ataumobile, front-end, web, IoT, back-end (CLI), dan Game.</p></div>";

    void splitHtml(String html) {
      // melakukan split html <div>
      List<String> split = html.split("<div>");

      // tambahkan lagi <div>
      for (int i = 0; i < split.length; i++) {
        split[i] = '<div>' + split[i];

        // memasukan data yang sudah ditambahkan div kedalam list
        listSplitHtml.add(split[i]);
      }

      // hapus list pertama karena list pertama kosong
      listSplitHtml.remove('<div>');
    }

    /// filter atau mencari materi yang cocok dari argument id dengan
    /// listDummyCourse
    DetailModuleModel findDetailModule(List listDetailModule) {
      DetailModuleModel _course = listDetailModule
          .where((item) => item.id == widget.arguments['id'])
          .toList()
          .first;
      return _course;
    }

    Widget appBar(String title) {
      return HeaderBackAndTitle(title: title);
    }

    Widget course(DetailModuleModel module) {
      // memanggil fungsi splitHtml
      splitHtml(html);

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
          itemCount: module.materi.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            WidgetsBinding.instance!.addPostFrameCallback((_) => {
                  // setiap kali di render ulang scroll ke posisi paling bawah
                  if (_scrollController.hasClients)
                    {
                      // scroll ke posisi paling bawah
                      _scrollController
                          .jumpTo(_scrollController.position.maxScrollExtent)
                    }
                });
            return _index >= index
                ? Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Html(data: listSplitHtml[index]),
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
          child: CustomButton(
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
            if (state is DetailModuleLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailModuleSuccess) {
              return Stack(
                children: [
                  appBar(state.module.namaMateri),
                  course(state.module),
                  buttonContinue(state.module.materi.length),
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
