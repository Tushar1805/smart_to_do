// ignore_for_file: use_build_context_synchronously

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:core/di/service_locator.dart';
import 'package:core/theme/app_colors.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_to_do_app/presentation/chat/cubit/chat_screen_cubit.dart';
import 'package:smart_to_do_app/presentation/chat/model/chat_response_model.dart';
import 'package:smart_to_do_app/presentation/chat/states/chat_screen_states.dart';
import 'package:smart_to_do_app/resources/app_api_keys.dart';
import 'package:smart_to_do_app/resources/app_image.dart';

class ChatScreen extends HookWidget {
  ChatScreen({super.key});

  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'Tushar', lastName: 'Kalbhande');
  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: 'ChatGPT');

  @override
  Widget build(final BuildContext context) {
    final ValueNotifier<List<ChatMessage>?> _messages =
        useState<List<ChatMessage>>(<ChatMessage>[]);
    final _scaffoldKey = useMemoized(GlobalKey<ScaffoldState>.new);
    final textController = useTextEditingController();
    final _typingUsers = useState<List<ChatUser>>([]);
    final chatCubit = sl<ChatScreenCubit>();
    final conversationResponse = useState<ChatResponseModel?>(null);
    final _hasPopped = useState<bool>(false);
    final conversationChanged = useState<bool>(false);

    final size = MediaQuery.of(context).size;
    final openAI = OpenAI.instance.build(
      token: OPEN_AI_KEY,
      baseOption: HttpSetup(),
      enableLog: true,
    );

    final titlePrompt = """
Generate a short, descriptive title for this conversation in two words:
${_messages.value?.map((final m) => '${m.user.firstName ?? m.user.id}: ${m.text}').join('\n')}
""";

    useEffect(
      () {
        chatCubit.getConversations();
        return null;
      },
      [chatCubit],
    );

    void saveConversation() async {
      if ((_messages.value?.isNotEmpty ?? false) && conversationChanged.value) {
        final request = ChatCompleteText(
          messages: [
            {
              'role': 'user',
              'content': titlePrompt,
            }
          ],
          maxToken: 200,
          model: GptTurboChatModel(),
        );

        final response = await openAI.onChatCompletion(request: request);
        var title = '';
        for (var element in response!.choices) {
          if (element.message != null) {
            title = element.message!.content;
          }
        }
        final messageListJson = _messages.value!.map((final m) => m.toJson()).toList();
        chatCubit.saveConversation(
          title: title,
          messages: messageListJson,
        );
      }
    }

    Future<void> getChatResponse(final ChatMessage m) async {
      _messages.value = [m, ..._messages.value ?? []];
      _typingUsers.value.add(_gptChatUser);
      // _typingUsers.value = List.from(_typingUsers.value);

      final _messageHistory = _messages.value!.map((final m) {
        if (m.user == _currentUser) {
          return Messages(
            role: Role.user,
            content: m.text,
          );
        } else {
          return Messages(role: Role.assistant, content: m.text);
        }
      }).toList();

      final request = ChatCompleteText(
        //* This takes history but not working correctly
        messages: _messageHistory.map((final m) => m.toJson()).toList(),
        // messages: [
        //   {
        //     'role': 'user',
        //     'content': 'Explain DSA',
        //   },
        //   {
        //     'role': 'assistant',
        //     'content': 'DSA stands for digital signature algorith',
        //   },
        //   {
        //     'role': 'user',
        //     'content': 'No, in terms of programming',
        //   }
        // ],
        maxToken: 200,
        model: GptTurboChatModel(),
      );

      final response = await openAI.onChatCompletion(request: request);

      // Handle response and ensure it's correct
      if (response != null && response.choices.isNotEmpty) {
        final responseMessage = response.choices.first.message?.content ?? '';
        if (responseMessage.isNotEmpty) {
          _messages.value?.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: responseMessage,
            ),
          );
          _messages.value = List.from(_messages.value ?? []);
        }
      }
      _typingUsers.value.remove(_gptChatUser);
    }

    return PopScope(
      // canPop: true,
      onPopInvokedWithResult: (final didPop, final result) async {
        if (didPop) {
          _hasPopped.value = true;
          saveConversation();
        }
      },
      child: BlocConsumer(
        bloc: chatCubit,
        listener: (final context, final state) {
          if (state is ConversationLoadedState) {
            conversationResponse.value = state.data as ChatResponseModel;
          }
        },
        builder: (final context, final state) => Scaffold(
          key: _scaffoldKey,
          endDrawer: Container(
            width: size.width * 0.75,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : colorScheme.onSurface,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Conversations',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: size.height * 0.8,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: conversationResponse.value?.data?.length,
                      itemBuilder: (final context, final index) {
                        final conversation = conversationResponse.value?.data?[index];
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              _messages.value = (conversation?.messages?.isNotEmpty ?? false)
                                  ? conversation?.messages
                                      ?.map(
                                        (final msg) => ChatMessage.fromJson(msg.toJson()),
                                      )
                                      .toList()
                                  : [];
                              // _messages.value = co
                            },
                            child: Text(
                              conversation?.title ?? 'New Conversation',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
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
                  saveConversation();
                  chatCubit.getConversations();
                  _messages.value = [];
                },
                icon: SvgPicture.asset(
                  addNewConversation,
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color ?? Colors.black,
                    BlendMode.srcIn,
                  ),
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
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color ?? Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DashChat(
              inputOptions: InputOptions(
                textController: textController,
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
                containerColor: Theme.of(context).brightness == Brightness.light
                    ? colorScheme.primary
                    : colorScheme.onPrimary,
                currentUserTextColor: colorScheme.onPrimary,
                currentUserContainerColor: Theme.of(context).brightness == Brightness.light
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.primaryFixedDim,
                timeTextColor: colorScheme.primaryFixedDim,
                messageTextBuilder: (final message, final previousMessage, final nextMessage) =>
                    Text(
                  message.text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black,
                      ),
                ),
              ),
              typingUsers: _typingUsers.value,
              currentUser: _currentUser,
              onSend: (final ChatMessage m) async {
                //* This does not trigger rebuild, it only mutates the list
                // _messages.value?.insert(0, m);
                //* This line creates a new instance of list and is notified by the hooks
                // _messages.value = [m, ..._messages.value ?? []];
                conversationChanged.value = true;
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
        ),
      ),
    );
  }
}
