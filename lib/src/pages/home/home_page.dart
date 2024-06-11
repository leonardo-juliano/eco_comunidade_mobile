import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:project_firebase/src/services/auth_service.dart';
import 'package:project_firebase/src/shared/theme/app_theme.dart';
import 'package:latlong2/latlong.dart';
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
      ),
      drawer: menu(),
      body: content(),
    );
  }

  Widget content() {
    return FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-21.310431, -46.717279),
        ),
        children: [
          TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app'),
        ]);
  }

  Drawer menu() {
    return Drawer(
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
