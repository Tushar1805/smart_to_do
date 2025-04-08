import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:core/theme/app_colors.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutual_funds_manager/presentation/chat/widgets/end_drawer_widget.dart';
import 'package:mutual_funds_manager/resources/app_api_keys.dart';
import 'package:mutual_funds_manager/resources/app_image.dart';

class ChatScreen extends HookWidget {
  ChatScreen({super.key});

  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'Tushar', lastName: 'Kalbhande');
  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: 'ChatGPT');

  @override
  Widget build(final BuildContext context) {
    final ValueNotifier<List<ChatMessage>?> _messages =
        useState<List<ChatMessage>>(<ChatMessage>[]);
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    final size = MediaQuery.of(context).size;
    final openAI = OpenAI.instance.build(
      token: OPEN_AI_KEY,
      baseOption: HttpSetup(),
      enableLog: true,
    );

    final _typingUsers = useState<List<ChatUser>>([]);

    Future<void> getChatResponse(final ChatMessage m) async {
      _messages.value = [m, ..._messages.value ?? []];
      _typingUsers.value.add(_gptChatUser);
      // _typingUsers.value = List.from(_typingUsers.value);

      final _messageHistory = _messages.value!.map((final m) {
        if (m.user == _currentUser) {
          return Messages(role: Role.user, content: m.text);
        } else {
          return Messages(role: Role.assistant, content: m.text);
        }
      }).toList();

      final request = ChatCompleteText(
        messages: _messageHistory.map((final m) => m.toJson()).toList(),
        maxToken: 200,
        model: GptTurboChatModel(),
      );

      final response = await openAI.onChatCompletion(request: request);

      for (var element in response!.choices) {
        if (element.message != null) {
          _messages.value?.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: element.message!.content,
            ),
          );
          _messages.value = List.from(_messages.value ?? []);
        }
      }
      _typingUsers.value.remove(_gptChatUser);
    }

    // var size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawer(
        size: size,
        context: context,
      ),
      appBar: AppBar(
        title: Text(
          'ChatGPT',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            tooltip: 'New Conversation',
            onPressed: () {
              _messages.value = [];
            },
            icon: SvgPicture.asset(
              addNewConversation,
              width: 30,
              height: 30,
            ),
          ),
          IconButton(
            tooltip: 'Side Panel',
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: SvgPicture.asset(
              openPanelLogo,
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DashChat(
          inputOptions: InputOptions(
            cursorStyle: CursorStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? colorScheme.primaryFixedDim
                  : colorScheme.primary,
            ),
            alwaysShowSend: true,
            inputDecoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                  ),
              hintText: 'Write a message...',
              border: InputBorder.none,
            ),
            inputTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Colors.black,
                ),
            inputToolbarStyle: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? darkBackGroundColor
                  : colorScheme.primaryFixedDim,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          messageOptions: MessageOptions(
            currentUserTextColor: colorScheme.onPrimary,
            currentUserContainerColor: Theme.of(context).brightness == Brightness.light
                ? colorScheme.onPrimaryContainer
                : colorScheme.primaryFixedDim,
            timeTextColor: colorScheme.primaryFixedDim,
            messageTextBuilder: (final message, final previousMessage, final nextMessage) => Text(
              message.text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
          ),
          messageListOptions: MessageListOptions(),
          typingUsers: _typingUsers.value,
          currentUser: _currentUser,
          onSend: (final ChatMessage m) async {
            //* This does not trigger rebuild, it only mutates the list
            // _messages.value?.insert(0, m);
            //* This line creates a new instance of list and is notified by the hooks
            // _messages.value = [m, ..._messages.value ?? []];
            await getChatResponse(m);
          },
          messages: _messages.value ?? [],
        ),
      ),
      //   Container(
      //       child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // children: [inputCard(size)],
      // )
    );
  }
}
