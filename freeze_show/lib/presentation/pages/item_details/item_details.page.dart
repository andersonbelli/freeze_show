import 'package:flutter/material.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/domain/entities/episode_details.entity.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';
import 'package:freeze_show/domain/entities/show_season_item.entity.dart';
import 'package:freeze_show/presentation/pages/item_details/item_details_bloc.dart';
import 'package:freeze_show/presentation/widgets/show_details_item.widget.dart';

class ItemDetails extends StatefulWidget {
  final ShowItem show;

  const ItemDetails(this.show, {Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final ItemDetailsBloc bloc = Injector().di.get<ItemDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.black12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          spreadRadius: 15,
                        ),
                        BoxShadow(
                          color: Colors.white12,
                          blurRadius: 70,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.network(
                        widget.show.image?.original ?? "",
                        height: 350,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return const Image(
                            image: AssetImage(
                              'assets/film-poster-placeholder1.png',
                            ),
                            fit: BoxFit.fitHeight,
                            height: 250,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF052C4F),
                        Color(0xFF001D36),
                      ],
                      begin: FractionalOffset.center,
                      end: FractionalOffset.bottomRight,
                      stops: [0.2, 0.9],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Builder(
                          builder: (context) {
                            final List<Widget> showsSchedule = [];
                            widget.show.schedule?.days?.forEach((element) {
                              showsSchedule.add(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        element,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        " ",
                                        textAlign: TextAlign.end,
                                      ),
                                      Text(
                                        widget.show.schedule?.time ?? "",
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontSize: 20,
                                              color: Colors.white70,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                            return ShowDetailsItem(
                              body: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  width: double.maxFinite,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ...showsSchedule,
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.white70,
                        indent: 190,
                        endIndent: 20,
                        height: 0,
                        thickness: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            widget.show.name,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      if (widget.show.genres != null &&
                          widget.show.genres!.isNotEmpty)
                        Builder(
                          builder: (context) {
                            final List<Widget> showsGenres = [];
                            widget.show.genres?.forEach((element) {
                              showsGenres.add(
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    element,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            });
                            return ShowDetailsItem(
                              title: "Genre",
                              body: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...showsGenres,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const SizedBox(),
                      if (widget.show.summary != null &&
                          widget.show.summary!.isNotEmpty)
                        const ShowDetailsItem(
                          title: "Summary",
                          body: Text(""),
                        )
                      else
                        const SizedBox(),
                      StreamBuilder<List<EpisodeDetails>>(
                        stream: bloc.seasonEpisodesList,
                        builder: (context, state) {
                          final List<Widget> seasonEpisodes = [];

                          final allSeasonEpisodes = state.data;

                          if (allSeasonEpisodes != null) {
                            for (final element in allSeasonEpisodes) {
                              seasonEpisodes.add(
                                InkWell(
                                  onTap: () => bloc.add(
                                    ItemDetailsGetAllEpisodesFromSeasonEvent(
                                      id: element.id,
                                    ),
                                  ),
                                  child: Card(
                                    color: Colors.black45,
                                    child: Column(
                                      children: [
                                        Flex(
                                          direction: Axis.horizontal,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  child: Image.network(
                                                    element.image?.medium ?? "",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (
                                                      context,
                                                      error,
                                                      stackTrace,
                                                    ) {
                                                      return const Image(
                                                        image: AssetImage(
                                                          'assets/film-poster-placeholder1.png',
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                      10,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          element.number
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        const Text(". "),
                                                        Flexible(
                                                          child: Text(
                                                            element.name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                            maxLines: 3,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Text(""),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          }

                          return StreamBuilder<List<ShowSeason>>(
                            stream: bloc.seasonsList,
                            builder: (context, state) {
                              final allSeasons = state.data;

                              if (allSeasons == null) {
                                return const SizedBox();
                              }

                              final List<Widget> showSeasons = [];

                              for (final element in allSeasons) {
                                showSeasons.add(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white24,
                                      ),
                                      onPressed: () => bloc.add(
                                        ItemDetailsGetAllEpisodesFromSeasonEvent(
                                          id: element.id,
                                        ),
                                      ),
                                      child: Text(
                                        element.number.toString(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return ShowDetailsItem(
                                title: "Seasons",
                                body: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    child: Column(
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...showSeasons,
                                            ],
                                          ),
                                        ),
                                        ...seasonEpisodes,
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bloc.add(ItemDetailsGetAllSeasonsEvent(id: widget.show.id));
  }
}
