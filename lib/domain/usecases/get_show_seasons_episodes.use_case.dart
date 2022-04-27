import 'package:dartz/dartz.dart';
import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/domain/entities/episode_details.entity.dart';
import 'package:freeze_show/domain/repositories/shows.repository.dart';

abstract class GetShowSeasonsEpisodesUseCase {
  Future<Either<BaseException, List<EpisodeDetails>>> call(int id);
}

class GetShowSeasonsEpisodesUseCaseImpl extends GetShowSeasonsEpisodesUseCase {
  final ShowsRepository repository;

  GetShowSeasonsEpisodesUseCaseImpl({required this.repository});

  @override
  Future<Either<BaseException, List<EpisodeDetails>>> call(int id) async =>
      repository.getShowsSeasonEpisodes(id);
}
