import 'package:freeze_show/di/base.di.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';

class HomeDI extends BaseDI {
  final _di = Injector().di;

  @override
  void registerAll() {
    _di.registerFactory<HomeBloc>(
      () => HomeBloc(getShowsUseCase: _di()),
    );

    _di.registerFactory<TabsCubit>(() => TabsCubit());
  }
}
