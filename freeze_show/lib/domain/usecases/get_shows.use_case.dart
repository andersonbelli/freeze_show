import 'package:dartz/dartz.dart';
import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';
import 'package:freeze_show/domain/repositories/shows.repository.dart';

abstract class GetShowsUseCase {
  Future<Either<BaseException, List<ShowItem>>> call({int? page});
}

class GetShowsUseCaseImpl extends GetShowsUseCase {
  final ShowsRepository repository;

  GetShowsUseCaseImpl({required this.repository});

  @override
  Future<Either<BaseException, List<ShowItem>>> call({int? page}) async =>
      repository.getShows(page);
}
