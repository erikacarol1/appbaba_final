// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/login_controller.dart';


class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.close,
                    size: 35,
                    //color: Colors.white,
                  ),
                  iconSize: 35,
                  color: Color.fromARGB(255, 43, 42, 42),
                  onPressed: () {Navigator.pop(context);},
                ),
              ],
            )),

            Card(
              color: Colors.white,
                child: ListTile(
                title: Center(
                child: Text(
                'SERVICOS',
                style: 
                  GoogleFonts.roboto(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 134, 64),
                    ),
                ),
                ), 
                onTap: () =>
                        {Navigator.pushNamed(context, 'principal')},
                ),
            ),

            Card(
              color: Colors.white,
                child: ListTile(
                title: Center(
                child: Text(
                'AVALIAR',
                style: 
                  GoogleFonts.roboto(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 134, 64),
                    ),
                ),
                ), 
                onTap: () =>{},
                ),
            ),

            Card(
              color: Colors.white,
                child: ListTile(
                title: Center(
                child: Text(
                'PERFIL',
                style: 
                  GoogleFonts.roboto(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 134, 64),
                    ),
                ),
                ), 
                onTap: () =>
                        {Navigator.pushNamed(context, 'perfil')},
                ),
            ),

            
            Card(
              color: Colors.white,
                child: ListTile(
                title: Center(
                child: Text(
                'CHAT',
                style: 
                  GoogleFonts.roboto(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 134, 64),
                    ),
                ),
                ), 
                onTap: () =>
                        {},
                ),
            ),
            
            Card(
              color: Colors.white,
                child: ListTile(
                title: Center(
                child: Text(
                'CONFIGURACOES',
                style: 
                  GoogleFonts.roboto(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 134, 64),
                    ),
                ),
                ), 
                onTap: () =>
                        {},
                ),
            ), 

            Card(
              color: Colors.white,
                child: ListTile(
                title: Center(
                child: Text(
                'SAIR',
                style: 
                  GoogleFonts.roboto(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 134, 64),
                    ),
                ),
                ), 
                onTap: () {
                          Navigator.pop(context);
                        },
                ),
            ), 
            
          ],
        ),
        backgroundColor: Color.fromARGB(255, 78, 245, 245),
      ),

      //BARRA DE TÍTULO
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 78, 245, 245)),
      //backgroundColor: Colors.purple.shade50,

      //CORPO DA TELA
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              
              children: [
                Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ( //Barra de rolagem vertical
                    Text(
                    'Conheca',
                    style: TextStyle(
                    color: Color.fromARGB(255, 255, 134, 64),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    ),
                    )
                  ),
                ),
                ),

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

             
                circleImage(),
                botao('Professora'),
                botao('Experiencia: 8 anos'),
                botao('Bacharel Certificada'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  circleImage() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: new Container(
          width: 190.0,
          height: 190.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('../lib/images/foto1.png'))),
        ),
      ),
    );
  }

   //
  // BOTAO
  //
  botao(rotulo) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            minimumSize: Size(400,70),
            primary: Color.fromARGB(255, 248, 246, 245),
            shape: StadiumBorder(),     
          ),
          //COMPORTAMENTO
          onPressed: () {
            //VALIDAR OS CAMPOS DE TESTO
          },
          //CONTEÚDO
          child: Text(
            rotulo,
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 134, 64),
            ),
          ),
          ),
    );

  }
}
