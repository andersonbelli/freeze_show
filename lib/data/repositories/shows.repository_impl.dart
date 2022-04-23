import 'package:dartz/dartz.dart';
import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/core/http/models/http_exceptions.dart';
import 'package:freeze_show/core/http/models/url_not_found_exception.dart';
import 'package:freeze_show/data/datasources/shows.remote.datasource.dart';
import 'package:freeze_show/data/models/errors/generic_error.model.dart';
import 'package:freeze_show/data/models/show_item.model.dart';
import 'package:freeze_show/domain/repositories/shows.repository.dart';

class ShowsRepositoryImpl extends ShowsRepository {
  final ShowsDataSource remote;

  ShowsRepositoryImpl({required this.remote});

  @override
  Future<Either<BaseException, List<ShowItemModel>>> getShows(
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
}
