import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_firebase/app/modules/authentication/view/login.dart';
import 'package:project_firebase/app/modules/authentication/view/signup_page.dart';
import 'package:project_firebase/app/pages/home/home_page.dart';
import 'package:project_firebase/app/shared/config/config.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Constants.login, child: (context, args) => const LoginPage()),
        ChildRoute(Constants.signUp, child: (context, args) => const SignUpPage()),
      ];
}
