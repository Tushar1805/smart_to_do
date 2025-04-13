import 'package:core/network/api_call_type.dart';
import 'package:core/network/base_repository.dart';
import 'package:mutual_funds_manager/presentation/chat/model/chat_response_model.dart';
import 'package:mutual_funds_manager/resources/app_api.dart';

class ChatScreenRepository extends BaseRepository {
  Future<ChatResponseModel> getConversations() async {
    final responseData = await fetchData(
      apiCallType: ApiCallType.get,
      apiUrl: getConversationUrl,
    );
    return ChatResponseModel.fromJson(
      responseData as Map<String, dynamic>,
    );
  }

  Future<void> saveConversation({required final String title, required final List<Map<String, dynamic>> messages}) async {
     await fetchData(
      apiCallType: ApiCallType.post,
      apiUrl: getConversationUrl,
      requestModel: {
        'title': title,
        'messages':messages,
      },
    );
  }
}
