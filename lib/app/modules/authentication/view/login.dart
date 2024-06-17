import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_firebase/app/modules/authentication/view/signup_page.dart';
import 'package:project_firebase/app/services/auth_service.dart';
import 'package:project_firebase/app/shared/config/constants.dart';
import 'package:project_firebase/app/shared/theme/app_theme.dart';
import 'package:project_firebase/app/shared/widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  login() async {
    setState(() => loading = true);
    try {
      await AuthService().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await AuthService().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              const Text("Bem vindo",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.5)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
                  controller: email,
                  cursorColor: appTheme.primaryColor,
                  decoration: InputDecoration(
                    hoverColor: appTheme.primaryColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: appTheme.primaryColor),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o email corretamente!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 10.0),
                child: TextFormField(
                  controller: senha,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Senha',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informa sua senha!';
                    } else if (value.length < 6) {
                      return 'Sua senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Button(
                    text: 'Entrar',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        isLogin ? login() : registrar();
                      }
                    },
                    color: appTheme.primaryColor),
              ),
              TextButton(
                onPressed: () => (setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                })),
                child: Text("Ainda não tem conta? Cadastre-se agora.",
                    style:
                        TextStyle(fontSize: 16, color: appTheme.primaryColor)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
