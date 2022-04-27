import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabs.state.dart';

class TabsCubit extends Cubit<int> {
  TabsCubit() : super(0);

  void toggleTabs(int selectedTab) => emit(selectedTab);
}
