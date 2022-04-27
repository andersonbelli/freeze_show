import 'package:flutter/material.dart';
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
    return Scaffold(
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
    );
  }
}
