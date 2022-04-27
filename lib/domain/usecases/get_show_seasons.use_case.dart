import 'package:dartz/dartz.dart';
import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/domain/entities/show_season_item.entity.dart';
import 'package:freeze_show/domain/repositories/shows.repository.dart';

abstract class GetShowSeasonsUseCase {
  Future<Either<BaseException, List<ShowSeason>>> call(int id);
}

class GetShowSeasonsUseCaseImpl extends GetShowSeasonsUseCase {
  final ShowsRepository repository;

  GetShowSeasonsUseCaseImpl({required this.repository});

  @override
  Future<Either<BaseException, List<ShowSeason>>> call(int id) async =>
      repository.getShowsSeason(id);
}
