import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';
import 'package:freeze_show/presentation/pages/home_bloc_provider.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';
import 'package:freeze_show/presentation/widgets/show_list_item.widget.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        final bloc =
            HomeBlocProvider.of(context) ?? Injector().di.get<HomeBloc>();

        if (state is HomeInitialState) {
          return const Text("Nothing to see here 🤔");
        }

        if (state is HomeErrorState) {
          return Center(
            child: Text("There was an error :( \n ${state.message}"),
          );
        }

        return StreamBuilder<List<ShowItem>>(
          stream: bloc.allShowsList,
          builder: (context, snapshot) {
            final showsList = snapshot.data;

            if (showsList == null) {
              return const SizedBox();
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 330,
                crossAxisSpacing: 5,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final show = showsList[index];

                return ShowListItem(index, show);
              },
            );
          },
        );
      },
      listener: (BuildContext context, state) {
        if (state is HomeShowsLoadedState) {
          // bloc.urlsList.add(state.shortUrl);
        }
      },
    );
  }
}
