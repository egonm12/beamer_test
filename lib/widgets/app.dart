import 'package:flutter/material.dart';

import '../router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.routeInformationParser,
      routerDelegate: AppRouter.routerDelegate,
    );
  }
}
