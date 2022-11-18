import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/util.dart';

class LoginController {
  //
  // LOGIN DO USU�RIO
  //
  void login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      sucesso(context, 'Usuario autenticado com sucesso.');
      Navigator.pushReplacementNamed(context, 'perfil');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email � invalido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuario n�o encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  //
  // ESQUECEU A SENHA
  //
  Future<void> esqueceuSenha(email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  //
  // CRIAR CONTA
  //
  void criarConta(context, nome, email, senha) 
  {
        FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      //Armazenar o nome no Firestore
      FirebaseFirestore.instance.collection('usuarios').add({
        "uid": res.user!.uid.toString(),
        "nome": nome,
      });

      sucesso(context, 'Usuario criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email j� foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O email � inv�lido.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  
  //
  // LOGOUT
  //
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  //
  // RETORNAR USU�RIO LOGADO
  //
  Future<String> retornarUsuarioLogado() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var res;
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then(
      (q) {
        if (q.docs.isNotEmpty) {
          res = q.docs[0].data()['nome'];
        } else {
          res = "";
        }
      },
    );
    return res;
  }
}
