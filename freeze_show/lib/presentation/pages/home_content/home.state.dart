part of 'home.bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeShowsLoadedState extends HomeState {
  final List<ShowItem> allShows;

  HomeShowsLoadedState({required this.allShows});
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
