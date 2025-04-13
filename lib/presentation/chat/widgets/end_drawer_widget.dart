import 'package:core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mutual_funds_manager/presentation/chat/model/chat_response_model.dart';

Widget endDrawer({
  required final Size size,
  required final BuildContext context,
  required final ChatResponseModel? conversationResponse,
  required final bool loading,
}) =>
    Container(
      width: size.width * 0.75,
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.light ? Colors.white : colorScheme.onSurface,
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
              height: 20,
            ),
            SizedBox(
              height: size.height * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: conversationResponse?.data?.length,
                itemBuilder: (final context, final index) {
                  final conversation = conversationResponse?.data?[index];
                  return TextButton(
                    onPressed: () {},
                    child: Text(
                      conversation?.title ?? 'New Conversation',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
