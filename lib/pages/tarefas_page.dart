// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables


import 'package:app06_task_list/pages/tarefas_exibir_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/tarefas_controller.dart';
import 'util.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({Key? key}) : super(key: key);

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();

  var tarefas;

  @override
  void initState() {
    super.initState();
    tarefas = TarefasController().listar('0');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade50,
      child: Column(
        children: [

          //
          // EXIBIR TAREFAS
          //
          TarefasExibirWidget(
            tarefas,
            Colors.white,
            Icons.electric_bolt,
            '1',
          ),
          
          Container(
            //color: Colors.blueGrey.shade100,
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.add_task_outlined, color: Color.fromARGB(255, 78, 245, 245),),
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              title: Text(
                'Adicionar servico',
                style: GoogleFonts.roboto(fontSize: 22),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Adicionar',
                      style: GoogleFonts.roboto(
                        fontSize: 36,
                        color: Color.fromARGB(255, 78, 245, 245),
                      ),
                    ),
                    backgroundColor: Colors.blueGrey.shade50,
                    content: Container(
                      width: 350,
                      height: 260,
                      child: Column(
                        children: [
                          campoTexto('Titulo', Icons.title, txtTitulo),
                          TextField(
                            style: GoogleFonts.roboto(fontSize: 24),
                            controller: txtDescricao,
                            maxLines: 5,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              labelText: 'Descricao',
                              labelStyle: GoogleFonts.roboto(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    
                    actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(120, 50),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'cancelar',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Color.fromARGB(255, 78, 245, 245),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 78, 245, 245),
                          minimumSize: Size(120, 50),
                        ),
                        onPressed: () {
                          if (txtTitulo.text.isNotEmpty) {
                            TarefasController().adicionar(
                              txtTitulo.text,
                              txtDescricao.text,
                            );
                            txtTitulo.clear();
                            txtDescricao.clear();
                            sucesso(context, 'Servico adicionada com sucesso.');
                          } else {
                            erro(context, 'Informe o titulo do servico');
                          }

                          Navigator.pop(context);
                        },
                        child: Text(
                          'salvar',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          
        ],
      ),
    );
  }
}
