part of 'search.bloc.dart';

@immutable
abstract class SearchEvent {}

class LoadInitialListEvent extends SearchEvent {
}

class SearchShowEvent extends SearchEvent {
  final String search;

  SearchShowEvent({required this.search});
}
