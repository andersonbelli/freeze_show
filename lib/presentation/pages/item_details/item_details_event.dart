part of 'item_details_bloc.dart';

@immutable
abstract class ItemDetailsEvent {}

class ItemDetailsGetAllSeasonsEvent extends ItemDetailsEvent {
  final int id;

  ItemDetailsGetAllSeasonsEvent({required this.id});
}

class ItemDetailsGetAllEpisodesFromSeasonEvent extends ItemDetailsEvent {
  final int id;

  ItemDetailsGetAllEpisodesFromSeasonEvent({required this.id});
}
