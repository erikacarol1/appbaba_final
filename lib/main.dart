// ignore_for_file: prefer_const_constructors

import 'package:app06_task_list/pages/escolher_login.dart';
import 'package:app06_task_list/pages/principal_page.dart';
import 'package:app06_task_list/pages/tela_inicial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/criar_conta_page.dart';
import 'pages/login_page.dart';
import 'pages/perfil.dart';
import 'pages/tela_inicial.dart';



Future<void> main() async {
  //
  // INICIALIZAÇÃO DO FIREBASE
  //
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FUNTIME',
      initialRoute: 'tela_inicial',
      routes: {
        'tela_inicial':(context) => TelaInicial(),
        'escolher_login':(context) => EscolherLogin(),
        'login': (context) => LoginPage(),
        'perfil':(context) => Perfil(),
        'criar_conta': (context) => CriarContaPage(),
        'principal':(context) => PrincipalPage(),
      },
    ),
  );
}
