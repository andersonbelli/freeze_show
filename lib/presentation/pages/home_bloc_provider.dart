import 'package:flutter/material.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';

class HomeBlocProvider extends InheritedWidget {
  final HomeBloc bloc;

  const HomeBlocProvider({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(child: child, key: key);

  static HomeBloc? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HomeBlocProvider>()
        ?.bloc;
  }

  @override
  bool updateShouldNotify(HomeBlocProvider oldWidget) {
    return true;
  }
}
