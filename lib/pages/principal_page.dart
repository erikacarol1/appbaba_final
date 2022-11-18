// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/login_controller.dart';
import 'tarefas_page.dart';



class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  var tarefas;

  // Telas de Navegecao
  final List<Widget> telas = [
    TarefasPage(),
  ];
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          children: [
             Expanded(
               child: Text(
                 'Servicos',
                 style: GoogleFonts.kanit(
                   fontSize: 36,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_box,
                  size: 14,
                ),

                //
                // TODO: Retornar usuário logado
                //
                FutureBuilder<String>(
                  future: LoginController().retornarUsuarioLogado(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                          ),
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 78, 245, 245) ,
        actions: [
          IconButton(
            tooltip: 'sair',
            onPressed: () {
              LoginController().logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                'login',
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
  

      body: telas[index],
       
    );
  }
}
