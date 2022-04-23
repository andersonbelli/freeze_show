import 'package:freeze_show/core/http/models/base_exception.dart';
import 'package:freeze_show/data/models/show_item.model.dart';
import 'package:dartz/dartz.dart';

abstract class ShowsRepository {
  Future<Either<BaseException, List<ShowItemModel>>> getShows(int? page);
}
