import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';

class TabsMenu extends StatelessWidget {
  const TabsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, int>(
      builder: (context, currentTab) {
        return Theme(
          data: ThemeData(),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: false,
            showUnselectedLabels: true,
            iconSize: 30,
            onTap: (selected) => context.read<TabsCubit>().toggleTabs(selected),
            currentIndex: currentTab,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white60,
                ),
                label: "Home",
                backgroundColor: Colors.transparent,
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white60,
                ),
                label: "Search",
                backgroundColor: Colors.transparent,
                activeIcon: Icon(
                  Icons.search_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
