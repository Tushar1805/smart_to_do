import 'package:core/di/service_locator.dart';
import 'package:core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_to_do_app/navigation/app_router.dart';
import 'package:smart_to_do_app/resources/app_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(final context) {
    final themeCubit = sl<ThemeCubit>();

    useEffect(
      () {
        themeCubit.getTheme();
        return null;
      },
      [],
    );

    return BlocBuilder<ThemeCubit, ThemeData>(
      bloc: themeCubit,
      builder: (final context, final state) => MaterialApp.router(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: state,
        routerConfig: router,
      ),
    );
  }
}
