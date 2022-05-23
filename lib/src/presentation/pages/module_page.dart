import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ta_bsi/src/data/dataSources/local/json/module_service.dart';
import 'package:ta_bsi/src/data/models/module_model.dart';
import 'package:ta_bsi/src/presentation/cubit/module/module_cubit.dart';
import 'package:ta_bsi/src/presentation/pages/test_listview.dart';
import 'package:ta_bsi/src/presentation/widgets/header_back_and_title.dart';
import 'package:ta_bsi/src/utils/helper/string_helper.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  @override
  void initState() {
    super.initState();

    context.read<ModuleCubit>().fetchListModule();
  }

  @override
  Widget build(BuildContext context) {
    void onTap(String id) {
      String parts = StringHelper.splitId(id);
      String path;

      switch (parts) {
        case 'materi':
          path = '/detail-module';
          break;
        case 'quiz':
          path = '/quiz';
          break;
        case 'submission':
          path = '/submission';
          break;
        default:
          path = '/detail-module';
      }

      Go.routeWithPath(
        context: context,
        path: path,
        arguments: {
          'id': id,
        },
      );

      // Go.to(context, TestListview());
    }

    Widget module() {
      Widget itemModule(List materiKelas) {
        return ListView.builder(
          itemCount: materiKelas.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onTap(materiKelas[index]['id']),
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: lightGrayColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      materiKelas[index]['nama_materi'],
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${materiKelas[index]['durasi']} menit',
                      style: darkGrayTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }

      Widget expansionPanelModule() {
        return ExpandableTheme(
          data: ExpandableThemeData(
            animationDuration: const Duration(milliseconds: 200),
            iconRotationAngle: 45 * math.pi / 180, // 45 derajat
            iconColor: blackColor,
            expandIcon: Icons.chevron_right_rounded,
          ),
          child: BlocBuilder<ModuleCubit, ModuleState>(
            builder: (context, state) {
              if (state is ModuleSuccess) {
                return Column(
                  children: state.module.map((item) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                        left: defaultMargin,
                        right: defaultMargin,
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      color: whiteColor,
                      child: ExpandableNotifier(
                        initialExpanded: true,
                        child: ExpandablePanel(
                          header: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.level,
                                style: darkGrayTextStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: light,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.modul,
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          collapsed: const SizedBox(), //  kosong
                          expanded: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12, // dikurang dari padding container
                            ),
                            child: itemModule(item.materiKelas),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
              return SizedBox();
            },
          ),
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(vertical: defaultMargin),
        child: expansionPanelModule(),
      );
    }

    Widget body() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBackAndTitle(title: 'Daftar Modul'),
              module(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
