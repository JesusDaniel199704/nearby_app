import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nearby_app/injection.config.dart';

final locator = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => locator.init();
