import 'package:dartz/dartz.dart';
import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/domain/entities/show_episode.entity.dart';
import 'package:freeze_show/domain/repositories/shows.repository.dart';

abstract class GetShowsScheduleUseCase {
  Future<Either<BaseException, List<ShowEpisodeItem>>> call({String? date});
}

class GetShowsScheduleUseCaseImpl extends GetShowsScheduleUseCase {
  final ShowsRepository repository;

  GetShowsScheduleUseCaseImpl({required this.repository});

  @override
  Future<Either<BaseException, List<ShowEpisodeItem>>> call({
    String? date,
  }) async =>
      repository.getShowsSchedule(date);
}
