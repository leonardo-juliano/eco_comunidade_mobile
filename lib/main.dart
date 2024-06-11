import 'package:flutter/material.dart';
import 'package:project_firebase/myApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_firebase/src/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}