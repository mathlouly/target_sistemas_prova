import 'package:get_it/get_it.dart';
import 'package:target_sistemas_prova/app/data/repositories/sign_in.repository.dart';
import 'package:target_sistemas_prova/app/data/storage/card.storage.dart';
import 'package:target_sistemas_prova/app/modules/home/home.store.dart';
import 'package:target_sistemas_prova/app/modules/sign_in/sign_in.store.dart';

class DependenciesInjection {
  static final _getIt = GetIt.instance;

  static T get<T extends Object>() {
    return _getIt<T>();
  }

  static void setup() {
    _getIt.registerFactory<SignInRepository>(
      () => ISignInRepository(),
    );

    _getIt.registerFactory<CardStorage>(
      () => ICardStorage(),
    );

    _getIt.registerFactory<SignInStore>(
      () => SignInStore(
        _getIt<SignInRepository>(),
      ),
    );

    _getIt.registerFactory<HomeStore>(
      () => HomeStore(
        _getIt<CardStorage>(),
      ),
    );
  }
}
