import 'package:daily_notes/preferences/preferences.dart';
import 'package:daily_notes/screens/home/home.screen.dart';
import 'package:daily_notes/screens/onboarding/onboarding.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: !Preferences.showOnboarding ? '/' : '/onboarding',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'onboarding',
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          },
        ),
      ],
    ),
  ],
);
