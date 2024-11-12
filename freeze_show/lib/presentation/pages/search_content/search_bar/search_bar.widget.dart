import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/search_content/search.bloc.dart';
import 'package:freeze_show/presentation/pages/search_content/search_bar/search_bar.cubit.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  final SearchBloc bloc = Injector().di.get<SearchBloc>();
  final SearchBarCubit searchCubit = Injector().di.get<SearchBarCubit>();

  AppSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
            child: Material(
              color: Colors.transparent,
              child: TextField(
                controller: controller,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: "Search a show...",
                  hintStyle: TextStyle(fontSize: 18),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                cursorColor: Colors.white54,
                keyboardType: TextInputType.url,
                onSubmitted: (String search) => bloc.add(
                  SearchShowEvent(
                    search: search,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15),
          ),
          BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              state is! SearchLoadingState
                  ? context.read<SearchBarCubit>().toggleSearchButton(true)
                  : context.read<SearchBarCubit>().toggleSearchButton(false);

              return ElevatedButton(
                onPressed: context.read<SearchBarCubit>().state
                    ? () {
                        if (controller.text.isNotEmpty) {
                          bloc.add(
                            SearchShowEvent(
                              search: controller.text,
                            ),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                ),
                child: const Icon(Icons.search),
              );
            },
          ),
        ],
      ),
    );
  }
}
