part of 'home.bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeGetAllShowsEvent extends HomeEvent {
  final int? page;

  HomeGetAllShowsEvent({this.page});
}
