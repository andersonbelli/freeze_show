part of 'item_details_bloc.dart';

@immutable
abstract class ItemDetailsState {}

class ItemDetailsInitialState extends ItemDetailsState {}

class ItemDetailsLoadingState extends ItemDetailsState {}

class ItemDetailsSeasonsLoadedState extends ItemDetailsState {
  ItemDetailsSeasonsLoadedState();
}

class ItemDetailsEpisodesLoadedState extends ItemDetailsState {
  ItemDetailsEpisodesLoadedState();
}

class ItemDetailsErrorState extends ItemDetailsState {
  final String message;

  ItemDetailsErrorState({required this.message});
}
