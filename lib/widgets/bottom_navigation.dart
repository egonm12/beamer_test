import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  final GlobalKey<BeamerState> beamerKey;

  const BottomNavigationScreen({
    Key? key,
    required this.beamerKey,
  }) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();

    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  void dispose() {
    super.dispose();
    _beamerDelegate.removeListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = _beamerDelegate.configuration.location == '/foo' ? 0 : 1;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(label: 'Foo', icon: Icon(Icons.book)),
        BottomNavigationBarItem(label: 'Bar', icon: Icon(Icons.article)),
      ],
      onTap: (index) => _beamerDelegate.beamToNamed(
        index == 0 ? '/foo' : '/bar',
      ),
    );
  }
}
