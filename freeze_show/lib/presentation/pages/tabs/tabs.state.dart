part of 'tabs.cubit.dart';

@immutable
abstract class TabsState {}

class TabsInitial extends TabsState {}

class TabsClickHome extends TabsState {}

class TabsClickFavorites extends TabsState {}

class TabsClickSearch extends TabsState {}
