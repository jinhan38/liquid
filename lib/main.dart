import 'package:flutter/material.dart';
import 'package:liquid/liquid_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static String pkg = "drink_rewards_list";
  // static String get pkg => Env.getPackage(_pkg);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: LiquidScreen(),
      ),
    );
  }
}
