import 'package:beamer/beamer.dart';
import 'package:beamer_test/router.dart';
import 'package:beamer_test/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    required this.routerDelegate,
    required this.beamerKey,
    Key? key,
  }) : super(key: key);

  final GlobalKey<BeamerState> beamerKey;
  final BeamerDelegate routerDelegate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.search_sharp),
          onPressed: () => context.beamToNamed(
            AppRouter.dialogRoute,
          ),
        ),
      ),
      body: Beamer(
        key: beamerKey,
        routerDelegate: routerDelegate,
      ),
      bottomNavigationBar: BottomNavigationScreen(
        beamerKey: beamerKey,
      ),
    );
  }
}
