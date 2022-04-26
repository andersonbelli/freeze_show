import 'package:freeze_show/core/http/dio_impl.dart';
import 'package:freeze_show/core/http/http_manager.dart';
import 'package:freeze_show/di/base.di.dart';
import 'package:freeze_show/di/main.di.dart';
import 'package:freeze_show/di/injector.dart';
import 'package:freeze_show/di/search.di.dart';
import 'package:freeze_show/di/shows.di.dart';

class CoreDI extends BaseDI {
  final _di = Injector().di;

  @override
  void registerAll() {
    // Http requests handler DI
    _di.registerFactory<HttpManager>(() => DioImpl());

    ShowsDI().registerAll();
    MainDI().registerAll();
    SearchDI().registerAll();
  }
}
