// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, annotate_overrides, override_on_non_overriding_member, unused_import, unnecessary_new


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      //CORPO DA TELA
      body: Center(
        child: ( //Barra de rolagem vertical
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextButton(
                    child: Text(
                      "FUNTIME",
                      style: 
                        GoogleFonts.roboto(
                        fontSize: 70,
                        color: Color.fromARGB(255, 255, 134, 64),
                      ),
                    ),
                    onPressed: () =>
                        {Navigator.pushNamed(context, 'escolher_login')},
                  ),
              
            ],
          )       
        ),
      ),
    backgroundColor: Color.fromARGB(255, 78, 245, 245) 
    );
  }
}