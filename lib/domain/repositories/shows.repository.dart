import 'package:dartz/dartz.dart';
import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/domain/entities/episode_details.entity.dart';
import 'package:freeze_show/domain/entities/show_episode.entity.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';
import 'package:freeze_show/domain/entities/show_season_item.entity.dart';

abstract class ShowsRepository {
  Future<Either<BaseException, List<ShowItem>>> getShows(int? page);

  Future<Either<BaseException, List<ShowEpisodeItem>>> getShowsSchedule(
    String? date,
  );

  Future<Either<BaseException, List<ShowEpisodeItem>>> getShowsSearch(
    String search,
  );

  Future<Either<BaseException, List<ShowSeason>>> getShowsSeason(
    int id,
  );

  Future<Either<BaseException, List<EpisodeDetails>>> getShowsSeasonEpisodes(
    int id,
  );
}
