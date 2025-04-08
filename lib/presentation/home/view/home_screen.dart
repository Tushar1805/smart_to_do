import 'package:core/di/service_locator.dart';
import 'package:core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mutual_funds_manager/navigation/app_routes.dart';
import 'package:mutual_funds_manager/resources/app_strings.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final counter = useState<int>(0);
    final darkTheme = useState<bool>(true);

    final themeCubit = sl<ThemeCubit>();

    void incrementCounter() {
      counter.value++;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          Text(
            darkTheme.value ? 'Light Theme' : 'Dark Theme',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            width: 5,
          ),
          Switch(
            value: darkTheme.value,
            onChanged: (final _) {
              darkTheme.value = !darkTheme.value;
              themeCubit.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(chatScreen);
              },
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.transparent), // Removes tap effect
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Chat Screen',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.arrow_forward_outlined)
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
