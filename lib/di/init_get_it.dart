import 'package:get_it/get_it.dart';
import 'init_get_it.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDependencies({String? environment}) async =>
    getIt.init(environment: environment);
