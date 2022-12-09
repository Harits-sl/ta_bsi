import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/data/models/module_model.dart';
import 'package:ta_bsi/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/detailModule/detail_module_cubit.dart';

import 'package:ta_bsi/src/presentation/cubit/module/module_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/quiz/quiz_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/userModule/user_module_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_app_bar.dart';
import 'package:ta_bsi/src/utils/helper/string_helper.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class ModulePage extends StatefulWidget {
  const ModulePage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  /// variable menampung id materi
  late List<String?> listIdMateri;

  /// variable index untuk untuk user module is done
  /// mengikuti banyaknya materi
  late int indexForUserModuleDone;

  @override
  void initState() {
    super.initState();

    listIdMateri = [];

    indexForUserModuleDone = 0;

    context.read<ModuleCubit>().fetchListModule(widget.arguments['typeModule']);

    /// set type module di quiz cubit
    context.read<QuizCubit>().setTypeModule(widget.arguments['typeModule']);

    // authState = context.read<AuthCubit>().state;
    // userModuleState = context.read<UserModuleCubit>().state;
    // print(authState.);
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.read<AuthCubit>().state;
    UserModuleState userModuleState = context.read<UserModuleCubit>().state;

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
        default:
          path = '/detail-module';
      }

      // for (var materi in listMateri) {
      //   listIdMateri.add(materi['id']);
      //   debugPrint('materi["id"]: ${materi['id']}');
      // }

      debugPrint('listIdMateri: $listIdMateri');
      context.read<DetailModuleCubit>().setListIdMateri(listIdMateri);

      Go.routeWithPath(
        context: context,
        path: path,
        arguments: {
          'id': id,
          'module': widget.arguments['typeModule'],
        },
      );

      // Go.to(context, TestListview());
    }

    void onTapAppBar() {
      Go.back(context);
    }

    Widget module({
      required List<ModuleModel> module,
      required List<Map> listModuleDone,
    }) {
      Widget itemModule({
        required List materiKelas,
      }) {
        listIdMateri.clear();
        indexForUserModuleDone = 0;
        return ListView.builder(
          itemCount: materiKelas.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            listIdMateri.add(materiKelas[index]['id']);

            if (indexForUserModuleDone != listIdMateri.length) {
              indexForUserModuleDone++;
            }

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        materiKelas[index]['nama_materi'],
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    listModuleDone[indexForUserModuleDone - 1]['isDone']
                        ? Icon(Icons.done_rounded)
                        : const SizedBox(),
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
            children: module.map((item) {
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
                      child: itemModule(
                        materiKelas: item.materiKelas,
                      ),
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
        child: BlocBuilder<ModuleCubit, ModuleState>(
          builder: (context, moduleState) {
            if (moduleState is ModuleSuccess) {
              List<String> idModule = [];
              for (var item in moduleState.module) {
                for (var item1 in item.materiKelas) {
                  idModule.add(item1['id']);
                }
              }

              /// set id quiz
              context.read<QuizCubit>().setIdQuiz(idModule.last);

              /// jika [authState] statenya [AuthSuccess] get user module by id
              /// dari cubit user module
              if (authState is AuthSuccess) {
                context.read<UserModuleCubit>().getUserModuleById(
                      idUser: authState.user.id,
                      idModule: idModule,
                      module: widget.arguments['typeModule'],
                    );

                /// ada perubahan data lakukan setstate
                DatabaseReference starCountRef = FirebaseDatabase.instance.ref(
                    'user-module/${authState.user.id}/${widget.arguments['typeModule']}');
                starCountRef.onChildChanged.listen((event) {
                  setState(() {
                    listIdMateri.clear();
                    indexForUserModuleDone = 0;
                  });
                });

                /// jika [userModuleState] statenya [UserModuleFailed]
                /// set user module ke firebase dari cubit userModule
                /// lalu get user module by id dari cubit userModule
                if (userModuleState is UserModuleFailed) {
                  // context.read<UserModuleCubit>().setUserModule(
                  //       idUser: authState.user.id,
                  //       idModule: idModule,
                  //     );
                  // print('state2');

                  context.read<UserModuleCubit>().getUserModuleById(
                        idUser: authState.user.id,
                        idModule: idModule,
                        module: widget.arguments['module'],
                      );
                  print('state3');
                }
              }

              // List<UserModuleModel> userModule = [];

              // List<UserModuleModel>? getStateUserModule () {
              // if (userModuleState is UserModuleSuccess) {
              //   // moduleState.module.addAll(userModuleState.userModule);
              //   return userModuleState.userModule;
              // }

              // }
              // if(userModule.isEmpty) getStateUserModule();

              // print(getStateUserModule);
              // for (var i = 0; i < moduleState.module.length; i++) {
              //   newList
              // }

              return BlocBuilder<UserModuleCubit, UserModuleState>(
                buildWhen: (previousState, state) {
                  return (state is UserModuleSuccess);
                },
                builder: (context, state) {
                  if (state is UserModuleFailed) {
                    setState(() {});
                  }
                  if (state is UserModuleSuccess) {
                    List<Map> listModuleDone = [];

                    for (var item in state.userModule) {
                      debugPrint(item.idModule);
                      listModuleDone.add({
                        'idModule': item.idModule,
                        'isDone': item.isDone,
                      });
                    }
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                              title: 'Daftar Modul', onTap: onTapAppBar),
                          module(
                            module: moduleState.module,
                            listModuleDone: listModuleDone,
                          ),
                        ],
                      ),
                    );
                  }

                  return SizedBox();
                },
              );
            }
            return SizedBox();
          },
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
