import 'package:get_it/get_it.dart';
import 'package:mutual_funds_manager/presentation/chat/cubit/chat_screen_cubit.dart';
import 'package:mutual_funds_manager/presentation/chat/repository/chat_screen_repository.dart';

import '../../theme/theme_cubit.dart';
import '../../utils/app_storage.dart';
import 'package:mutual_funds_manager/presentation/auth/cubit/splash_cubit.dart';

final sl = GetIt.I;

void setupServiceLocator() async {
  sl.registerFactory<SecureStorage>(SecureStorage.new);
  sl.registerFactory<ChatScreenRepository>(ChatScreenRepository.new);

  sl.registerLazySingleton<ThemeCubit>(ThemeCubit.new);
  sl.registerSingleton<SplashCubit>(SplashCubit());
  sl.registerSingleton<ChatScreenCubit>(ChatScreenCubit(sl<ChatScreenRepository>()));
}
