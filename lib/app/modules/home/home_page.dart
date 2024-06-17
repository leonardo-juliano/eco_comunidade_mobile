import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_firebase/app/services/auth_service.dart';
import 'package:project_firebase/app/shared/config/constants.dart';
import 'package:project_firebase/app/shared/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        foregroundColor: appTheme.white,
      ),
      drawer: menu(),
      body: content(),
    );
  }

  Widget content() {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appTheme.inactiveBtn,
          ),
        ),
      )
    ]));
  }

  Drawer menu() {
    return Drawer(
      shadowColor: appTheme.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: appTheme.primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: appTheme.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Problemas Resolvidos'),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text('Resolver'),
            onTap: () async {
              AuthService().logout();
            },
          ),
        ],
      ),
    );
  }
}
