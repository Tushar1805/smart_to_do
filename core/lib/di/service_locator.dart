import 'package:get_it/get_it.dart';

import '../../theme/theme_cubit.dart';
import '../../utils/app_storage.dart';
import 'package:mutual_funds_manager/presentation/auth/cubit/splash_cubit.dart';

final sl = GetIt.I;

void setupServiceLocator() async {
  sl.registerLazySingleton<ThemeCubit>(ThemeCubit.new);
  sl.registerSingleton<SplashCubit>(SplashCubit());
  sl.registerFactory<SecureStorage>(SecureStorage.new);
}
