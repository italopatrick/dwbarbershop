import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:dwbarbershop/src/core/ui/barbershop_theme.dart';
import 'package:dwbarbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dwbarbershop/src/feature/auth/login/login_page.dart';
import 'package:dwbarbershop/src/feature/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
        customLoader: const BarbershopLoader(),
        builder: (AsyncNavigatorObserver) {
          return MaterialApp(
            title: 'DW Barbershop',
            theme:  BarbershopTheme.themeData,
            navigatorObservers: [AsyncNavigatorObserver],
            routes: {'/': (_) => const SplashPage(),
            '/auth/login':(_) => const LoginPage()
            
            },
          );
        });
  }
}

// Minuto 29:21 dia 15/08/23 Aula 01
