import 'package:freeze_show/di/base.di.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/presentation/pages/home_content/home.bloc.dart';
import 'package:freeze_show/presentation/pages/tabs/tabs.cubit.dart';

class MainDI extends BaseDI {
  final _di = Injector().di;

  @override
  void registerAll() {
    _di.registerSingleton<HomeBloc>(
      HomeBloc(getShowsUseCase: _di()),
    );

    _di.registerSingleton<TabsCubit>(TabsCubit());
  }
}
