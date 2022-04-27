import 'package:bloc/bloc.dart';
import 'package:freeze_show/domain/entities/show_episode.entity.dart';
import 'package:freeze_show/domain/usecases/get_shows_schedule.use_case.dart';
import 'package:freeze_show/domain/usecases/get_shows_search.use_case.dart';
import 'package:meta/meta.dart';

part 'search.event.dart';
part 'search.state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetShowsSearchUseCase getShowsSearchUseCase;
  final GetShowsScheduleUseCase getShowsScheduleUseCase;

  SearchBloc(
    this.getShowsSearchUseCase,
    this.getShowsScheduleUseCase,
  ) : super(SearchInitialState()) {
    on<LoadInitialListEvent>((event, emit) async {
      emit(SearchLoadingState());

      final getShowsScheduleResult = await getShowsScheduleUseCase();

      getShowsScheduleResult.fold(
        (failure) {
          emit(SearchErrorState(message: "$failure"));
        },
        (scheduleList) {
          emit(
            DoneLoadInitialState(
              listResults: scheduleList,
            ),
          );
        },
      );
    });
    on<SearchShowEvent>((event, emit) async {
      emit(SearchLoadingState());

      final getSearchResult = await getShowsSearchUseCase(event.search);

      getSearchResult.fold(
        (failure) {
          emit(SearchErrorState(message: "$failure"));
        },
        (searchList) {
          emit(
            DoneSearchingState(
              searchResults: searchList,
            ),
          );
        },
      );
    });
    add(LoadInitialListEvent());
  }
}
