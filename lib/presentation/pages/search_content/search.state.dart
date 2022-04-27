part of 'search.bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class DoneLoadInitialState extends SearchState {
  final List<ShowEpisodeItem> listResults;

  DoneLoadInitialState({required this.listResults});
}

class DoneSearchingState extends SearchState {
  final List<ShowEpisodeItem> searchResults;

  DoneSearchingState({required this.searchResults});
}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({required this.message});
}
