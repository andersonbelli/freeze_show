import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/presentation/pages/home_content/home_content.widget.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';

class TabsContent extends StatelessWidget {
  const TabsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, int>(
      builder: (context, currentTab) {
        switch (currentTab) {
          case 0:
            return const HomeContent();
          case 1:
            return const Text("FAVORITES :D");
          case 2:
            return const Text("SEARCH :D");
        }

        return const Center(
          child: Text("You were not supposed to see this 🤔"),
        );
      },
    );
  }
}
