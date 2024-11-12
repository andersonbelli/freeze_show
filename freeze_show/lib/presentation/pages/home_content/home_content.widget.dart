import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';
import 'package:freeze_show/presentation/pages/item_details/item_details.page.dart';
import 'package:freeze_show/presentation/widgets/show_simple_list_item.widget.dart';

class HomeContent extends StatelessWidget {
  final HomeBloc bloc = Injector().di.get<HomeBloc>();

  HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext _, state) {
        if (state is HomeInitialState) {
          return const Center(child: Text("Nothing to see here 🤔"));
        } else if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white70,
            ),
          );
        } else if (state is HomeErrorState) {
          return Center(
            child: Text("There was an error 😔 \n ${state.message}"),
          );
        } else if (state is HomeShowsLoadedState) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 330,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (_, index) {
              final show = state.allShows[index];

              return InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(show),
                  ),
                ),
                child: ShowSimpleListItem(index, show),
              );
            },
          );
        } else {
          return const Center(
            child: Text("You were not supposed to see this 🤔"),
          );
        }
      },
    );
  }
}
