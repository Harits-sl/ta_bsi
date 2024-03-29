import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/config/theme/app_theme.dart';
import 'package:ta_bsi/src/presentation/cubit/article/article_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/course/course_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/detailModule/detail_module_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/event/event_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/module/module_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/page/page_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/quiz/quiz_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/userModule/user_module_cubit.dart';
import 'package:ta_bsi/src/presentation/cubit/youtube/youtube_cubit.dart';
import 'package:ta_bsi/src/presentation/pages/detail_module_page.dart';
import 'package:ta_bsi/src/presentation/pages/detail_article_page.dart';
import 'package:ta_bsi/src/presentation/pages/detail_event_page.dart';
import 'package:ta_bsi/src/presentation/pages/module_page.dart';
import 'package:ta_bsi/src/presentation/pages/main_page.dart';
import 'package:ta_bsi/src/presentation/pages/quiz_page.dart';
import 'package:ta_bsi/src/presentation/pages/sign_in_page.dart';
import 'package:ta_bsi/src/presentation/pages/sign_up_page.dart';
import 'package:ta_bsi/src/presentation/pages/splash_page.dart';
import 'package:ta_bsi/src/presentation/pages/submission_page.dart';
import 'package:ta_bsi/src/presentation/pages/youtube_page.dart';

void main() async {
  // initialize Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => UserModuleCubit(),
        ),
        BlocProvider(
          create: (context) => CourseCubit(),
        ),
        BlocProvider(
          create: (context) => ModuleCubit(),
        ),
        BlocProvider(
          create: (context) => DetailModuleCubit(),
        ),
        BlocProvider(
          create: (context) => EventCubit(),
        ),
        BlocProvider(
          create: (context) => YoutubeCubit(),
        ),
        BlocProvider(
          create: (context) => ArticleCubit(),
        ),
        BlocProvider(
          create: (context) => QuizCubit(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const SplashPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/main': (context) => const MainPage(),
          '/module': (context) =>
              ModulePage(ModalRoute.of(context)?.settings.arguments),
          '/detail-module': (context) =>
              DetailModulePage(ModalRoute.of(context)?.settings.arguments),
          '/quiz': (context) => const QuizPage(),
          '/submission': (context) =>
              SubmissionPage(ModalRoute.of(context)?.settings.arguments),
          '/detail-event': (context) =>
              DetailEventPage(ModalRoute.of(context)?.settings.arguments),
          '/detail-article': (context) =>
              DetailArticlePage(ModalRoute.of(context)?.settings.arguments),
          '/youtube': (context) =>
              YoutubePage(ModalRoute.of(context)?.settings.arguments),
        },
      ),
    );
  }
}
