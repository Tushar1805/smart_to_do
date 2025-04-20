import 'package:core/di/service_locator.dart';
import 'package:core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_to_do_app/navigation/app_routes.dart';
import 'package:smart_to_do_app/presentation/auth/cubit/splash_cubit.dart';
import 'package:smart_to_do_app/presentation/auth/states/splash_states.dart';
import 'package:smart_to_do_app/resources/app_image.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final splashCubit = sl<SplashCubit>();
    useEffect(
      () {
        splashCubit.splashTime();
        return null;
      },
      [],
    );

    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocListener(
        bloc: splashCubit,
        listener: (final context, final state) {
          if (state is SplashLoadedState) {
            // context.goNamed(loginScreen);
            context.goNamed(dashboardScreen);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                appLogo,
                width: size.width * 0.8,
              )
                  .animate()
                  .fadeIn(duration: 800.ms)
                  .scale(begin: const Offset(0.5, 0.5), end: const Offset(1.0, 1.0)),
              const SizedBox(height: 20),
              Container(
                width: size.width * 0.3,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: const LinearGradient(colors: [Colors.blue, Colors.green]),
                ),
              ).animate().moveY(begin: 10, end: 0, duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
