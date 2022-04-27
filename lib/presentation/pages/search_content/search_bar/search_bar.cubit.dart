import 'package:bloc/bloc.dart';

class SearchBarCubit extends Cubit<bool> {
  SearchBarCubit() : super(false);

  void toggleSearchButton(bool active) => emit(active);
}
