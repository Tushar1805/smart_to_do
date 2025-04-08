import 'package:core/baseCubit/base_cubit.dart';
import 'package:mutual_funds_manager/presentation/auth/states/splash_states.dart';

class SplashCubit extends BaseCubit {
  void splashTime() {
    Future.delayed(const Duration(seconds: 3), () {
      emit(SplashLoadedState(data: const{}));
    });
  }
}
