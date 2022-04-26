import 'package:flutter/material.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';

class MainBlocProvider extends InheritedWidget {
  final HomeBloc bloc;

  const MainBlocProvider({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(child: child, key: key);

  static HomeBloc? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MainBlocProvider>()
        ?.bloc;
  }

  @override
  bool updateShouldNotify(MainBlocProvider oldWidget) {
    return true;
  }
}
