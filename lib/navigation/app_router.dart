import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_to_do_app/navigation/app_routes.dart';
import 'package:smart_to_do_app/presentation/Profile/view/profile_screen.dart';
import 'package:smart_to_do_app/presentation/Tasks/view/all_tasks_screen.dart';
import 'package:smart_to_do_app/presentation/auth/view/login_screen.dart';
import 'package:smart_to_do_app/presentation/auth/view/splash_screen.dart';
import 'package:smart_to_do_app/presentation/chat/view/chat_screen.dart';
import 'package:smart_to_do_app/presentation/dashboard_screen.dart';
import 'package:smart_to_do_app/presentation/home/view/home_screen.dart';

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
      name: dashboardScreen,
      path: dashboardScreen,
      builder: (final context, final state) => DashboardScreen(),
    ),
    GoRoute(
      name: homeScreen,
      path: homeScreen,
      builder: (final context, final state) => HomeScreen(),
    ),
    GoRoute(
      name: chatScreen,
      path: chatScreen,
      builder: (final context, final state) => ChatScreen(),
    ),
    GoRoute(
      name: allTasksScreen,
      path: allTasksScreen,
      builder: (final context, final state) => AllTasksScreen(),
    ),
    GoRoute(
      name: profileScreen,
      path: profileScreen,
      builder: (final context, final state) => ProfileScreen(),
    ),
    GoRoute(
      name: loginScreen,
      path: loginScreen,
      builder: (final context, final state) => LoginScreen(),
    ),
  ],
);
