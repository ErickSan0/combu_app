import 'package:combu_soporte/pantallas/login.dart';
import 'package:combu_soporte/pantallas/principal.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CombuApp',
      routes: {
        'login': (_) => const Plogin(),
        'inicio': (_) => const Pprincipal(),
      },
      initialRoute: 'login',
    );
  }
}
