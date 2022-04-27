import 'package:freeze_show/core/http/http_manager.dart';
import 'package:freeze_show/data/models/episode_details.model.dart';
import 'package:freeze_show/data/models/show_episode_item.model.dart';
import 'package:freeze_show/data/models/show_item.model.dart';
import 'package:freeze_show/data/models/show_season_item.model.dart';

abstract class ShowsDataSource {
  Future<List<ShowItemModel>> getShows(int? page);

  Future<List<ShowEpisodeItemModel>> getShowsSchedule(String? date);

  Future<List<ShowEpisodeItemModel>> getShowsSearch(String search);

  Future<List<ShowSeasonModel>> getShowsSeasons(int id);

  Future<List<EpisodeDetailsModel>> getShowsSeasonEpisodes(int id);
}

class ShowsDataSourceImpl extends ShowsDataSource {
  final HttpManager http;

  ShowsDataSourceImpl({required this.http});

  @override
  Future<List<ShowItemModel>> getShows(int? page) async {
    final String endpoint = "shows${page != null ? "?page=$page" : ""}";

    final response = await http.get(endpoint);

    return (response as List)
        .map((e) => ShowItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ShowEpisodeItemModel>> getShowsSchedule(String? date) async {
    final String endpoint = "schedule${date != null ? "?date=$date" : ""}";

    final response = await http.get(endpoint);

    return (response as List)
        .map((e) => ShowEpisodeItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ShowEpisodeItemModel>> getShowsSearch(String search) async {
    final String endpoint = "search/shows?q=$search";

    final response = await http.get(endpoint);

    return (response as List)
        .map((e) => ShowEpisodeItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ShowSeasonModel>> getShowsSeasons(int id) async {
    final String endpoint = "shows/$id/seasons";

    final response = await http.get(endpoint);

    return (response as List)
        .map((e) => ShowSeasonModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<EpisodeDetailsModel>> getShowsSeasonEpisodes(int id) async {
    final String endpoint = "seasons/$id/episodes";

    final response = await http.get(endpoint);

    return (response as List)
        .map((e) => EpisodeDetailsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
