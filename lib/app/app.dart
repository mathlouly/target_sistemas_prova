import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/app/configs/theme/app_theme_style.dart';
import 'package:target_sistemas_prova/app/router/router.dart';

final globalKey = GlobalKey<NavigatorState>();
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: globalKey,
      debugShowCheckedModeBanner: false,
      title: 'Target Sistemas Prova',
      theme: AppTheme.themeData,
      routerConfig: CustomRouter.router,
    );
  }
}
