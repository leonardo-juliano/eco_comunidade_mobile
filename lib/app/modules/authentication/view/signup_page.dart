import 'package:flutter/material.dart';
import 'package:project_firebase/app/shared/theme/app_theme.dart';
import 'package:project_firebase/app/shared/widgets/button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AppTheme appTheme = AppTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Senha'),
                    style: TextStyle(color: appTheme.primaryColor),  

                  ),
                  Button(
                    text: 'Cadastrar',
                    onPressed: () {},
                    color: appTheme.primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}