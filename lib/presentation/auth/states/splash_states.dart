import 'package:core/states/data_state.dart';

class SplashLoadingState extends LoadingState {
  SplashLoadingState(super.loadingMessage);
}

class SplashLoadedState extends LoadedState {
  SplashLoadedState({required super.data});
}
