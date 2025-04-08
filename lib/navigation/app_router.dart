import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mutual_funds_manager/navigation/app_routes.dart';
import 'package:mutual_funds_manager/presentation/auth/view/splash_screen.dart';
import 'package:mutual_funds_manager/presentation/chat/view/chat_screen.dart';
import 'package:mutual_funds_manager/presentation/home/view/home_screen.dart';

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

/// The route configuration.
final GoRouter router = GoRouter(
  navigatorKey: navigationKey,
  routes: [
    GoRoute(
      name: splashScreen,
      path: splashScreen,
      builder: (final context, final state) => const SplashScreen(),
    ),
    GoRoute(
      name: homeScreen,
      path: homeScreen,
      builder: (final context, final state) => const HomeScreen(),
    ),
    GoRoute(
      name: chatScreen,
      path: chatScreen,
      builder: (final context, final state) =>  ChatScreen(),
    ),
  ],
);
