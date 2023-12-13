import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:target_sistemas_prova/app/modules/home/home.page.dart';
import 'package:target_sistemas_prova/app/modules/sign_in/sign_in.page.dart';
import 'package:target_sistemas_prova/app/router/routes.dart';

class CustomRouter {
  static GoRouter router = GoRouter(
    errorBuilder: (_, state) => onGenerateUnknowedRoute(state),
    initialLocation: Routes.signIn,
    routes: [
      GoRoute(
        path: Routes.signIn,
        builder: (_, state) => const SignInPage(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (_, state) => const HomePage(),
      ),
    ],
  );

  static go(String location) {
    router.go(location);
  }

  static Widget onGenerateUnknowedRoute(GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Text('Nenhuma rota definida para ${state.name}'),
      ),
    );
  }
}
