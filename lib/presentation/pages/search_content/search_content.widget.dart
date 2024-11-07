import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/presentation/pages/item_details/item_details.page.dart';
import 'package:freeze_show/presentation/pages/search_content/search.bloc.dart';
import 'package:freeze_show/presentation/widgets/episode_list_item.widget.dart';
import 'package:freeze_show/presentation/widgets/show_list_item.widget.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0765B2),
              Color(0xFF00317C),
            ],
            begin: FractionalOffset.bottomLeft,
            end: FractionalOffset.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
        ),
        child: const SearchList(),
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
      ),
      child: BlocBuilder<SearchBloc, SearchState>(
        bloc: context.read<SearchBloc>(),
        builder: (BuildContext context, state) {
          if (state is SearchInitialState) {
            return const Center(child: Text("Nothing to see here 🤔"));
          } else if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white70,
              ),
            );
          } else if (state is SearchErrorState) {
            return Center(
              child: Text("There was an error 😔 \n ${state.message}"),
            );
          } else if (state is DoneSearchingState) {
            if (state.searchResults.isEmpty) {
              return Center(
                child: Text(
                  "Sorry, the show you searched for was not found 😔",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return ListView.separated(
              itemCount: state.searchResults.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ItemDetails(
                        state.searchResults[index].show,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45),
                            topLeft: Radius.circular(45),
                          ),
                          color: Colors.black45,
                        ),
                      ),
                      Container(
                        color: Colors.black45,
                        child: ShowListItem(
                          index,
                          state.searchResults[index].show,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 10,
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(75),
                      bottomLeft: Radius.circular(75),
                    ),
                    color: Colors.black45,
                  ),
                );
              },
            );
          } else if (state is DoneLoadInitialState) {
            return ListView.separated(
              itemCount: state.listResults.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ItemDetails(
                        state.listResults[index].show,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45),
                            topLeft: Radius.circular(45),
                          ),
                          color: Colors.black45,
                        ),
                      ),
                      EpisodeListItem(
                        index,
                        state.listResults[index],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 10,
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(75),
                      bottomLeft: Radius.circular(75),
                    ),
                    color: Colors.black45,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("You were not supposed to see this 🤔"),
            );
          }
        },
      ),
    );
  }
}
