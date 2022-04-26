import 'package:flutter/material.dart';
import 'package:freeze_show/core/utils/app_colors.dart';
import 'package:freeze_show/di/core.di.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/main.page.dart';
import 'package:freeze_show/presentation/pages/main_bloc_provider.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  CoreDI().registerAll();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  HomeBloc bloc = Injector().di.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freeze Show',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          AppColors.mainColor.value,
          AppColors.customWhite,
        ),
        fontFamily: GoogleFonts.roboto().fontFamily
      ),
      home: MainBlocProvider(
        bloc: bloc,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0765B2),
                Color(0xFF00317C),
              ],
              begin: FractionalOffset.bottomLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.mirror,
            ),
          ),
          child: const MainPage(),
        ),
      ),
    );
  }
}
