import 'package:dartz/dartz.dart';
import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/core/http/models/http_exceptions.dart';
import 'package:freeze_show/core/http/models/url_not_found_exception.dart';
import 'package:freeze_show/data/datasources/shows.remote.datasource.dart';
import 'package:freeze_show/data/models/errors/generic_error.model.dart';
import 'package:freeze_show/domain/entities/episode_details.entity.dart';
import 'package:freeze_show/domain/entities/show_episode.entity.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';
import 'package:freeze_show/domain/entities/show_season_item.entity.dart';
import 'package:freeze_show/domain/repositories/shows.repository.dart';

class ShowsRepositoryImpl extends ShowsRepository {
  final ShowsDataSource remote;

  ShowsRepositoryImpl({required this.remote});

  @override
  Future<Either<BaseException, List<ShowItem>>> getShows(
    int? page,
  ) async {
    try {
      final response = await remote.getShows(page);

      return Right(response);
    } on UrlNotFoundException {
      return Left(UrlNotFoundException());
    } on GenericException catch (e) {
      return Left(GenericErrorModel(exception: e.message));
    }
  }

  @override
  Future<Either<BaseException, List<ShowEpisodeItem>>> getShowsSchedule(
    String? date,
  ) async {
    try {
      final response = await remote.getShowsSchedule(date);

      return Right(response);
    } on UrlNotFoundException {
      return Left(UrlNotFoundException());
    } on GenericException catch (e) {
      return Left(GenericErrorModel(exception: e.message));
    }
  }

  @override
  Future<Either<BaseException, List<ShowEpisodeItem>>> getShowsSearch(
    String search,
  ) async {
    try {
      final response = await remote.getShowsSearch(search);

      return Right(response);
    } on UrlNotFoundException {
      return Left(UrlNotFoundException());
    } on GenericException catch (e) {
      return Left(GenericErrorModel(exception: e.message));
    }
  }

  @override
  Future<Either<BaseException, List<ShowSeason>>> getShowsSeason(int id) async {
    try {
      final response = await remote.getShowsSeasons(id);

      return Right(response);
    } on UrlNotFoundException {
      return Left(UrlNotFoundException());
    } on GenericException catch (e) {
      return Left(GenericErrorModel(exception: e.message));
    }
  }

  @override
  Future<Either<BaseException, List<EpisodeDetails>>> getShowsSeasonEpisodes(
    int id,
  ) async {
    try {
      final response = await remote.getShowsSeasonEpisodes(id);

      return Right(response);
    } on UrlNotFoundException {
      return Left(UrlNotFoundException());
    } on GenericException catch (e) {
      return Left(GenericErrorModel(exception: e.message));
    }
  }
}
