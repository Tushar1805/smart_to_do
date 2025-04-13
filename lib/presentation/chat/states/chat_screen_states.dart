import 'package:core/states/data_state.dart';

class ConversationLoadingState extends LoadingState {
  ConversationLoadingState(super.loadingMessage);
}

class ConversationLoadedState extends LoadedState {
  ConversationLoadedState({required super.data});
}
