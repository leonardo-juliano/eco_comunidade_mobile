import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_firebase/app/modules/authentication/view/login.dart';
import 'package:project_firebase/app/modules/authentication/view/signup_page.dart';
import 'package:project_firebase/app/modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login',
            child: (_, args) => const LoginPage()),
        ChildRoute('/sign-up',
            child: (_, args) => const SignupPage()),
        ChildRoute(
          '/home',
          child: (_, args) => const HomePage(),
        )
      ];
}
