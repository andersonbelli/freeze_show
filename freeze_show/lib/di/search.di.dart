import 'package:freeze_show/di/base.di.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/search_content/search.bloc.dart';
import 'package:freeze_show/presentation/pages/search_content/search_bar/search_bar.cubit.dart';

class SearchDI extends BaseDI {
  final _di = Injector().di;

  @override
  void registerAll() {
    _di.registerSingleton<SearchBloc>(
      SearchBloc(
        _di(),
        _di(),
      ),
    );

    _di.registerSingleton<SearchBarCubit>(SearchBarCubit());
  }
}
