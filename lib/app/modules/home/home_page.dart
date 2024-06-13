import 'package:flutter/material.dart';
import 'package:project_firebase/app/services/auth_service.dart';
import 'package:project_firebase/app/shared/theme/app_theme.dart';
import 'package:provider/provider.dart';

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
            title: const Text('Registar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Resolver'),
            onTap: () async {
              await context.read<AuthService>().logout();
            },
          ),
        ],
      ),
    );
  }
}
