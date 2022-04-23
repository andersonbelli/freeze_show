import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';
import 'package:freeze_show/presentation/widgets/show_list_item.widget.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  HomeBloc bloc = Injector().di.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: const HomeContentData(),
    );
  }
}

class HomeContentData extends StatelessWidget {
  const HomeContentData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        if (state is HomeInitialState) {
          return const Center(child: Text("Nothing to see here 🤔"));
        }

        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeErrorState) {
          return Center(
            child: Text("There was an error :( \n ${state.message}"),
          );
        }

        if (state is HomeShowsLoadedState) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 330,
              crossAxisSpacing: 5,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              final show = state.allShows[index];

              return ShowListItem(index, show);
            },
          );
        }

        return const Center(
          child: Text("You were not supposed to see this 🤔"),
        );
      },
    );
  }
}
