// ignore_for_file: inference_failure_on_collection_literal

import 'package:core/baseCubit/base_cubit.dart';
import 'package:smart_to_do_app/presentation/auth/states/splash_states.dart';

class SplashCubit extends BaseCubit {
  void splashTime() {
    Future.delayed(const Duration(seconds: 3), () {
      emit(SplashLoadedState(data: const {}));
    });
  }
}
