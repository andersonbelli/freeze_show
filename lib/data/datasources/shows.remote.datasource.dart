import 'dart:convert';

import 'package:freeze_show/core/http/http_manager.dart';
import 'package:freeze_show/data/models/show_item.model.dart';

abstract class ShowsDataSource {
  Future<List<ShowItemModel>> getShows(int? page);
}

class ShowsDataSourceImpl extends ShowsDataSource {
  final HttpManager http;

  ShowsDataSourceImpl({required this.http});

  @override
  Future<List<ShowItemModel>> getShows(int? page) async {
    final String endpoint = "shows${page != null ? "?page=$page" : ""}";

    final response = await http.get(endpoint);

    return (jsonDecode(jsonEncode(response)) as List)
        .map((e) => ShowItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
