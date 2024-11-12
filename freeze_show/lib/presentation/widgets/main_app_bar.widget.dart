import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/presentation/pages/search_content/search_bar/search_bar.widget.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';
import 'package:freeze_show/presentation/widgets/app_title.widget.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      title: Center(
        child: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 150),
          child: ClipPath(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: BlocBuilder<TabsCubit, int>(
                builder: (context, currentTab) {
                  switch (currentTab) {
                    case 0:
                      return const AppTitle();
                    case 1:
                      return AppSearchBar();
                    default:
                      return const AppTitle();
                  }
                },
              ),
            ),
          ),
        ),
      ),
      floating: true,
    );
  }
}
