// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, annotate_overrides, override_on_non_overriding_member, unused_import, unnecessary_new, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

class EscolherLogin extends StatelessWidget {
  const EscolherLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //BARRA DE TÍTULO
      //appBar: AppBar(backgroundColor: Color.fromARGB(255, 78, 245, 245)),
      //backgroundColor: Colors.purple.shade50,

      //CORPO DA TELA
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables

        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: (Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'FUN',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 134, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    'TIME',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 134, 64),
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ],
              )),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: ( //Barra de rolagem vertical
                  Text(
                'Acesse como:',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 134, 64),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: Image.asset('../lib/images/bag.png'),
                        iconSize: 90,
                        onPressed: () =>
                        {Navigator.pushNamed(context, 'login')},
                      ),
                    ),
                    Text(
                      'Profissional',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 134, 64),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: Image.asset('../lib/images/heart.png'),
                        iconSize: 90,
                        onPressed: () =>
                        {Navigator.pushNamed(context, 'login')},
                      ),
                    ),
                    Text(
                      'Responsavel',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 134, 64),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
    
  }
}
