import 'package:core/baseCubit/base_cubit.dart';
import 'package:core/utils/core_utils.dart';
import 'package:mutual_funds_manager/presentation/chat/repository/chat_screen_repository.dart';
import 'package:mutual_funds_manager/presentation/chat/states/chat_screen_states.dart';

class ChatScreenCubit extends BaseCubit {
  ChatScreenCubit(this._chatScreenRepository);
  final ChatScreenRepository _chatScreenRepository;

  void getConversations() async {
    emit(ConversationLoadingState('Loading Conversations'));
    try {
      final response = await _chatScreenRepository.getConversations();
      emit(ConversationLoadedState(data: response));
    } catch (e) {
      handleExceptions(e);
    }
  }

  void saveConversation({
    required final String title,
    required final List<Map<String, dynamic>>? messages,
  }) async {
    try {
      await _chatScreenRepository.saveConversation(
        title: title,
        messages: messages ?? [],
      );
    } catch (e) {}
  }
}
