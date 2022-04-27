import 'package:freeze_show/data/datasources/shows.remote.datasource.dart';
import 'package:freeze_show/data/repositories/shows.repository_impl.dart';
import 'package:freeze_show/di/base.di.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/domain/repositories/shows.repository.dart';
import 'package:freeze_show/domain/usecases/get_show_seasons.use_case.dart';
import 'package:freeze_show/domain/usecases/get_show_seasons_episodes.use_case.dart';
import 'package:freeze_show/domain/usecases/get_shows.use_case.dart';
import 'package:freeze_show/domain/usecases/get_shows_schedule.use_case.dart';
import 'package:freeze_show/domain/usecases/get_shows_search.use_case.dart';
import 'package:freeze_show/presentation/pages/item_details/item_details_bloc.dart';

class ShowsDI extends BaseDI {
  final _di = Injector().di;

  @override
  void registerAll() {
    /// UseCases
    _di.registerFactory<GetShowsUseCase>(
      () => GetShowsUseCaseImpl(repository: _di()),
    );

    _di.registerFactory<GetShowsScheduleUseCase>(
      () => GetShowsScheduleUseCaseImpl(repository: _di()),
    );

    _di.registerFactory<GetShowsSearchUseCase>(
      () => GetShowsSearchUseCaseImpl(repository: _di()),
    );

    _di.registerFactory<GetShowSeasonsUseCase>(
      () => GetShowSeasonsUseCaseImpl(repository: _di()),
    );

    _di.registerFactory<GetShowSeasonsEpisodesUseCase>(
      () => GetShowSeasonsEpisodesUseCaseImpl(repository: _di()),
    );

    _di.registerFactory<ShowsDataSource>(
      () => ShowsDataSourceImpl(http: _di()),
    );

    _di.registerFactory<ShowsRepository>(
      () => ShowsRepositoryImpl(remote: _di()),
    );

    _di.registerSingleton(
      ItemDetailsBloc(
        getShowSeasonsUseCase: _di(),
        getShowSeasonsEpisodesUseCase: _di(),
      ),
    );
  }
}
