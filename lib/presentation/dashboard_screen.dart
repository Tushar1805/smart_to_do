// ignore_for_file: prefer_expression_function_bodies

import 'package:core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_to_do_app/presentation/Profile/view/profile_screen.dart';
import 'package:smart_to_do_app/presentation/Tasks/view/all_tasks_screen.dart';
import 'package:smart_to_do_app/presentation/chat/view/chat_screen.dart';
import 'package:smart_to_do_app/presentation/home/view/home_screen.dart';
import 'package:smart_to_do_app/resources/app_image.dart';
import 'package:smart_to_do_app/resources/app_widgets.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({super.key});
  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(final BuildContext context) {
    final counter = useState<int>(0);

    void incrementCounter() {
      counter.value++;
    }

    final pageIndex = useState<int>(0);

    void onItemTapped(final int index) {
      pageIndex.value = index;
    }

    // final screens = [
    //   HomeScreen(),
    //   AllTasksScreen(),
    //   ChatScreen(),
    //   ProfileScreen(),
    // ];
    Widget _buildPage(final int index) {
      switch (index) {
        case 0:
          return const HomeScreen(key: ValueKey(0));
        case 1:
          return const AllTasksScreen(key: ValueKey(1));
        case 2:
          return ChatScreen(key: ValueKey(2));
        case 3:
          return const ProfileScreen(key: ValueKey(3));
        default:
          return const DashboardScreen(key: ValueKey(0));
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   title: Text(
      //     appTitle,
      //     style: Theme.of(context).textTheme.bodyMedium,
      //   ),
      //   actions: [
      //     Text(
      //       darkTheme.value ? 'Light Theme' : 'Dark Theme',
      //       style: Theme.of(context).textTheme.displaySmall,
      //     ),
      //     const SizedBox(
      //       width: 5,
      //     ),
      //     Switch(
      //       value: darkTheme.value,
      //       onChanged: (final _) {
      //         darkTheme.value = !darkTheme.value;
      //         themeCubit.toggleTheme();
      //       },
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (final Widget child, final Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: _buildPage(pageIndex.value), // This must return a different widget instance
        ),
      ),
      // SafeArea(
      //   child: screens[pageIndex.value],
      // ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: colorScheme.onPrimary,
            shape: CircleBorder(),
            onPressed: incrementCounter,
            tooltip: 'Increment',
            child: Icon(
              Icons.add,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: [
          //* Shadow Layer
          Positioned(
            left: 0,
            right: 0,
            bottom: 15,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 42,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          //* Actual Nav Bar
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomAppBar(
              elevation: 0,
              shape: CircularNotchedRectangle(),
              color: primaryContainerColor,
              notchMargin: 12.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    navButton(
                      iconPath: dashboardIcon,
                      isSelected: pageIndex.value == 0,
                      onTap: () => onItemTapped(0),
                    ),
                    navButton(
                      iconPath: calendarIcon,
                      isSelected: pageIndex.value == 1,
                      onTap: () => onItemTapped(1),
                    ),
                    SizedBox(width: 48),
                    navButton(
                      iconPath: chatIcon,
                      isSelected: pageIndex.value == 2,
                      onTap: () => onItemTapped(2),
                    ),
                    navButton(
                      iconPath: profileIcon,
                      isSelected: pageIndex.value == 3,
                      onTap: () => onItemTapped(3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      //* Curved navigation bar
      // bottomNavigationBar: CurvedNavigationBar(
      //   key: _bottomNavigationKey,
      //   items: <Widget>[
      //     Icon(Icons.add, size: 30),
      //     Icon(Icons.list, size: 30),
      //     Icon(Icons.compare_arrows, size: 30),
      //     Icon(Icons.call_split, size: 30),
      //     Icon(Icons.perm_identity, size: 30),
      //   ],
      //   color: colorScheme.onSurface,
      //   // buttonBackgroundColor: Colors.white,
      //   backgroundColor: colorScheme.primary,
      //   animationCurve: Curves.easeInOut,
      //   animationDuration: Duration(milliseconds: 600),
      //   onTap: (final index) {
      //     selectedIndex.value = index;
      //   },
      //   // letIndexChange: (final index) => true,
      // ),
    );
  }
}
