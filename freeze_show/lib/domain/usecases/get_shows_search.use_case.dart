import 'package:dartz/dartz.dart';
import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/domain/entities/show_episode.entity.dart';
import 'package:freeze_show/domain/repositories/shows.repository.dart';

abstract class GetShowsSearchUseCase {
  Future<Either<BaseException, List<ShowEpisodeItem>>> call(String search);
}

class GetShowsSearchUseCaseImpl extends GetShowsSearchUseCase {
  final ShowsRepository repository;

  GetShowsSearchUseCaseImpl({required this.repository});

  @override
  Future<Either<BaseException, List<ShowEpisodeItem>>> call(
    String search,
  ) async =>
      repository.getShowsSearch(search);
}
