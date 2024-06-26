import 'package:flutter/material.dart';

import 'package:utaxi/screens/login_screen.dart';
import 'package:utaxi/services/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LoginScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
