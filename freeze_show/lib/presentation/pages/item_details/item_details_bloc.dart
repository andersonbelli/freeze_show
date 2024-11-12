import 'package:bloc/bloc.dart';
import 'package:freeze_show/domain/entities/episode_details.entity.dart';
import 'package:freeze_show/domain/entities/show_season_item.entity.dart';
import 'package:freeze_show/domain/usecases/get_show_seasons.use_case.dart';
import 'package:freeze_show/domain/usecases/get_show_seasons_episodes.use_case.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';

part 'item_details_event.dart';

part 'item_details_state.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {
  final GetShowSeasonsUseCase getShowSeasonsUseCase;
  final GetShowSeasonsEpisodesUseCase getShowSeasonsEpisodesUseCase;

  final _seasonsListController = BehaviorSubject<List<ShowSeason>>();

  Stream<List<ShowSeason>> get seasonsList => _seasonsListController.stream;

  Function(List<ShowSeason>) get _onSeasonsListChanged =>
      _seasonsListController.sink.add;

  final _seasonEpisodesListController = BehaviorSubject<List<EpisodeDetails>>();

  Stream<List<EpisodeDetails>> get seasonEpisodesList =>
      _seasonEpisodesListController.stream;

  Function(List<EpisodeDetails>) get _onSeasonEpisodesListChanged =>
      _seasonEpisodesListController.sink.add;

  ItemDetailsBloc({
    required this.getShowSeasonsUseCase,
    required this.getShowSeasonsEpisodesUseCase,
  }) : super(ItemDetailsInitialState()) {
    on<ItemDetailsGetAllSeasonsEvent>((event, emit) async {
      emit(ItemDetailsLoadingState());
      final getShowsResult = await getShowSeasonsUseCase(event.id);

      getShowsResult.fold(
        (failure) {
          emit(ItemDetailsErrorState(message: "$failure"));
        },
        (allSeasons) {
          _onSeasonsListChanged(allSeasons);
          emit(ItemDetailsSeasonsLoadedState());
        },
      );
    });
    on<ItemDetailsGetAllEpisodesFromSeasonEvent>((event, emit) async {
      emit(ItemDetailsLoadingState());
      final getShowsResult = await getShowSeasonsEpisodesUseCase(event.id);

      getShowsResult.fold(
        (failure) {
          emit(ItemDetailsErrorState(message: "$failure"));
        },
        (allSeasons) {
          _onSeasonEpisodesListChanged(allSeasons);
          emit(ItemDetailsEpisodesLoadedState());
        },
      );
    });
    add(
      ItemDetailsGetAllEpisodesFromSeasonEvent(id: 1),
    );
  }
}
