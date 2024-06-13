import 'package:flutter/material.dart';
import 'package:project_firebase/app/modules/authentication/view/login.dart';
import 'package:project_firebase/app/modules/home/home_page.dart';
import 'package:project_firebase/app/services/auth_service.dart';
import 'package:project_firebase/app/widgets/auto_check.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  checkAuth() {
    final auth = context.watch<AuthService>();
    if (_navigator.currentState != null) {
      if (auth.usuario == null) {
        _navigator.currentState!.pushReplacement(MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ));
      } else if (auth.usuario != null) {
        _navigator.currentState!.pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage()));
      } else {
        _navigator.currentState!.pushReplacement(MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: Center(child: CircularProgressIndicator()))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'EcoComunidade',
      debugShowCheckedModeBanner: false,
      home: AuthCheck(),
    );
  }
}
