import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';
import 'package:freeze_show/presentation/pages/search_content/search.bloc.dart';
import 'package:freeze_show/presentation/pages/search_content/search_bar/search_bar.cubit.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs_content.widget.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs_menu.widget.dart';
import 'package:freeze_show/presentation/widgets/main_app_bar.widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => Injector().di.get<TabsCubit>(),
        ),
        BlocProvider(
          create: (_) => Injector().di.get<SearchBarCubit>(),
        ),
        BlocProvider(
          create: (_) => Injector().di.get<HomeBloc>(),
        ),
        BlocProvider(
          create: (_) => Injector().di.get<SearchBloc>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const TabsMenu(),
        body: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const MainAppBar(),
              ];
            },
            body: const TabsContent(),
          ),
        ),
      ),
    );
  }
}
