import 'package:beamer/beamer.dart';
import 'package:beamer_test/widgets/bar.dart';
import 'package:beamer_test/widgets/dashboard.dart';
import 'package:beamer_test/widgets/dialog.dart';
import 'package:beamer_test/widgets/foo.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static const _prefix = '/dashboard';
  static const dashboardRoute = '$_prefix/*';
  static const dialogRoute = '/dialog';
  static const fooRoute = '$_prefix/foo';
  static const barRoute = '$_prefix/bar';

  static final routeInformationParser = BeamerParser();
  static final routerDelegate = BeamerDelegate(
    initialPath: fooRoute,
    locationBuilder: RoutesLocationBuilder(
      routes: {
        dashboardRoute: (
          context,
          state,
          data,
        ) {
          final GlobalKey<BeamerState> beamerKey = GlobalKey<BeamerState>();

          return BeamPage(
            child: Dashboard(
              routerDelegate: BeamerDelegate(
                initialPath: fooRoute,
                updateFromParent: false,
                transitionDelegate: const NoAnimationTransitionDelegate(),
                locationBuilder: RoutesLocationBuilder(
                  routes: {
                    fooRoute: (
                      context,
                      state,
                      data,
                    ) =>
                        const Foo(),
                    barRoute: (
                      context,
                      state,
                      data,
                    ) =>
                        const Bar(),
                  },
                ),
              ),
              beamerKey: beamerKey,
            ),
          );
        },
        dialogRoute: (
          context,
          state,
          data,
        ) =>
            const BeamPage(
              fullScreenDialog: true,
              key: const ValueKey('dialog'),
              child: const DialogScreen(),
            ),
      },
    ),
  );
}
