// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/login_controller.dart';

import 'util.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({Key? key}) : super(key: key);

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(100, 50, 100, 50),
                child: Center(
                  child: Icon(
                    Icons.person_add,
                    color: Color.fromARGB(255, 78, 245, 245) ,
                    size: 150.0,
                  ),
                ),
              ),
            
            campoTexto('Nome', Icons.person, txtNome),
            campoTexto('E-mail', Icons.email, txtEmail),
            campoTexto('Senha', Icons.lock, txtSenha, senha: true),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                LoginController().criarConta(context,txtNome.text, txtEmail.text, txtSenha.text);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 245, 245) ,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Salvar',
                style: GoogleFonts.roboto(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "Cancelar",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Color.fromARGB(255, 78, 245, 245) ,
                    ),
                  ),
                  onPressed: () => {Navigator.pop(context)},
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }


}
