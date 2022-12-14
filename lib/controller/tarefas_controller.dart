import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TarefasController {
  //
  // STATUS
  // 0 = TO-DO
  // 1 = DOING
  // 2 = DONE

  listar(status) {
    return FirebaseFirestore.instance
        .collection('servicos')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
        //.where('status', isEqualTo: status);
  }

  void adicionar(titulo, descricao) {
    FirebaseFirestore.instance.collection('servicos').add(
      {
        'titulo': titulo,
        'descricao': descricao,
        //'status': '0',
        'uid': FirebaseAuth.instance.currentUser!.uid,
      },
    );
  }

  void remover(id) {
    FirebaseFirestore.instance.collection('servicos').doc(id).delete();
  }

  // void atualizar(id, status) {
  //   FirebaseFirestore.instance.collection('servicos').doc(id).update(
  //     {
  //       "status": status,
  //     },
  //   );
  // }
}
