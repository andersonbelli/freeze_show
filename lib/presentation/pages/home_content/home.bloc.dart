import 'package:bloc/bloc.dart';
import 'package:freeze_show/data/models/show_item.model.dart';
import 'package:freeze_show/data/models/show_item_image.model.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';
import 'package:freeze_show/domain/usecases/get_shows.use_case.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';

part 'home.event.dart';

part 'home.state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetShowsUseCase getShowsUseCase;

  final _allShowsListController = BehaviorSubject<List<ShowItem>>();

  Stream<List<ShowItem>> get allShowsList => _allShowsListController.stream;

  Function(List<ShowItem>) get onAllShowsChanged =>
      _allShowsListController.sink.add;

  HomeBloc({
    required this.getShowsUseCase,
  }) : super(HomeInitialState()) {
    on<HomeGetAllShowsEvent>((event, emit) async {
      emit(HomeLoadingState());
      final getShowsResult = await getShowsUseCase(event.page);

      getShowsResult.fold(
        (failure) {
          emit(HomeErrorState(message: "$failure"));
        },
        (allShowsList) {
          emit(
            HomeShowsLoadedState(
              allShows: [
                ShowItemModel(
                  name: "Tantufaz",
                  image: ShowItemImageModel(
                    medium: "asd",
                    original: "asd",
                  ),
                )
              ],
            ),
            // HomeShowsLoadedState(
            //   allShows: allShowsList,
            // ),
          );
          onAllShowsChanged(allShowsList);
          // onAllShowsChanged([
          //   ShowItemModel(
          //     name: "Tantufaz",
          //     image: ShowItemImageModel(
          //       medium: "asd",
          //       original: "asd",
          //     ),
          //   )
          // ]);
        },
      );
    });
  }
}
