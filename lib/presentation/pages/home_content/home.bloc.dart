import 'package:bloc/bloc.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';
import 'package:freeze_show/domain/usecases/get_shows.use_case.dart';
import 'package:meta/meta.dart';

part 'home.event.dart';
part 'home.state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetShowsUseCase getShowsUseCase;

  HomeBloc({
    required this.getShowsUseCase,
  }) : super(HomeInitialState()) {
    on<HomeGetAllShowsEvent>((event, emit) async {
      emit(HomeLoadingState());
      final getShowsResult = await getShowsUseCase(page: event.page);

      getShowsResult.fold(
        (failure) {
          emit(HomeErrorState(message: "$failure"));
        },
        (allShowsList) {
          emit(
            HomeShowsLoadedState(
              allShows: allShowsList,
            ),
          );
        },
      );
    });
    add(HomeGetAllShowsEvent());
  }
}
