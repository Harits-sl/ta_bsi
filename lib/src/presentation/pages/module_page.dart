import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/presentation/cubit/detailModule/detail_module_cubit.dart';

import 'package:ta_bsi/src/presentation/cubit/module/module_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_app_bar.dart';
import 'package:ta_bsi/src/utils/helper/string_helper.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  /// variable menampung id materi
  late List<String?> listIdMateri;

  @override
  void initState() {
    super.initState();

    listIdMateri = [];

    context.read<ModuleCubit>().fetchListModule();
  }

  @override
  Widget build(BuildContext context) {
    void onTap(String id, List listMateri) {
      // menampung string dari nilai kembalian splitId
      String parts = StringHelper.splitId(id);

      // variabel untuk path
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

      for (var materi in listMateri) {
        listIdMateri.add(materi['id']);
      }

      context.read<DetailModuleCubit>().setListIdMateri(listIdMateri);

      Go.routeWithPath(
        context: context,
        path: path,
        arguments: {
          'id': id,
        },
      );

      // Go.to(context, TestListview());
    }

    void onTapAppBar() {
      Go.back(context);
    }

    Widget module() {
      Widget itemModule(List materiKelas) {
        return ListView.builder(
          itemCount: materiKelas.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            listIdMateri.add(materiKelas[index]['id']);
            return GestureDetector(
              onTap: () => onTap(materiKelas[index]['id'], materiKelas),
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: lightGreyColor,
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
                      style: darkGreyTextStyle.copyWith(
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
                                style: darkGreyTextStyle.copyWith(
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
              return const SizedBox();
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
              CustomAppBar(title: 'Daftar Modul', onTap: onTapAppBar),
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
