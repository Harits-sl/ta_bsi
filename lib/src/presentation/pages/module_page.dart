import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:ta_bsi/src/data/dataSources/local/json/module_service.dart';
import 'package:ta_bsi/src/data/models/module_model.dart';
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
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listDummyModule = [
      {
        'id': 'modul-1',
        'level': 'Level 1',
        'modul': 'Pengenalan Flutter',
        'materi_kelas': [
          {
            'id': 'materi-1',
            'nama_materi': 'Apa itu Flutter',
            'durasi': 3,
          },
          {
            'id': 'materi-2',
            'nama_materi': 'Menjalankan Program Flutter',
            'durasi': 3,
          }
        ],
      },
      {
        'id': 'modul-2',
        'level': 'Level 2',
        'modul': 'Pengenalan Widget',
        'materi_kelas': [
          {
            'id': 'materi-3',
            'nama_materi': 'Apa itu Widget',
            'durasi': 3,
          },
          {
            'id': 'materi-4',
            'nama_materi': 'Stateless dan Statefull',
            'durasi': 3,
          },
          {
            'id': 'materi-5',
            'nama_materi': 'Scaffold',
            'durasi': 3,
          },
          {
            'id': 'materi-6',
            'nama_materi': 'Column dan Row',
            'durasi': 3,
          },
        ],
      },
      {
        'id': 'modul-3',
        'level': 'Level 3',
        'modul': 'Exercise',
        'materi_kelas': [
          {
            'id': 'quiz-1',
            'nama_materi': 'Quiz',
            'durasi': 3,
          },
          {
            'id': 'submission-1',
            'nama_materi': 'Submission',
            'durasi': 3,
          },
        ],
      },
    ];

    void onTap(String id) {
      String parts = StringHelper.splitId(id);
      String path;

      switch (parts) {
        case 'materi':
          path = '/course';
          break;
        case 'quiz':
          path = '/quiz';
          break;
        case 'submission':
          path = '/submission';
          break;
        default:
          path = '/course';
      }

      Go.routeWithPath(
        context: context,
        path: path,
        arguments: {
          'id': id,
        },
      );
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
          child: Column(
            children: listDummyModule.map((item) {
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
                          item['level'],
                          style: darkGrayTextStyle.copyWith(
                            fontSize: 11,
                            fontWeight: light,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item['modul'],
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
                      child: itemModule(item['materi_kelas']),
                    ),
                  ),
                ),
              );
            }).toList(),
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
