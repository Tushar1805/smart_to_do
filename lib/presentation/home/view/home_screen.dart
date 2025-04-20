import 'package:core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(
              text: TextSpan(
                text: 'Hello',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryFixedDim),
                children: [
                  TextSpan(
                    text: ' Tushar 👋',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w900, fontSize: 22),
                  ),
                ],
              ),
              textScaler: TextScaler.linear(1.1),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                'Manage Your Daily Tasks',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(fontSize: 45, fontFamily: 'Sans'),
                // textScaler: TextScaler.linear(0.8),
                textAlign: TextAlign.left,
              ),
            )
          ])),
    );
  }
}
