import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs_content.widget.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs_menu.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabsCubit(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Freeze Show"),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: const TabsMenu(),
        body: const TabsContent(),
      ),
    );
  }
}
