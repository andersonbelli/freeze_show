import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/presentation/pages/home_content/home_content.widget.dart';
import 'package:freeze_show/presentation/pages/search_content/search_content.widget.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';

class TabsContent extends StatelessWidget {
  const TabsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, int>(
      builder: (context, currentTab) {
        switch (currentTab) {
          case 0:
            return HomeContent();
          case 1:
            return const SearchContent();
          default:
            return HomeContent();
        }
      },
    );
  }
}
