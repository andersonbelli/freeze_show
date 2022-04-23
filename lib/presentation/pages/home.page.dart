import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/home_bloc_provider.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';
import 'package:freeze_show/presentation/pages/home_content/home_content.widget.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs_menu.widget.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = HomeBlocProvider.of(context) ?? Injector().di.get<HomeBloc>();

    return BlocProvider(
      create: (context) => bloc..add(HomeGetAllShowsEvent()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Freeze Show"),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: BlocProvider(
          child: const TabsMenu(),
          create: (_) => TabsCubit(),
        ),
        body: HomeContent(bloc: bloc),
      ),
    );
  }
}
