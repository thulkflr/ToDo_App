import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/todo_model.dart';
import '../Service/todo_service.dart';

final serviceProvider = StateProvider<Todo_Service>((ref) {
  return Todo_Service();
});

final sstreamProvider = StreamProvider<List<TODO_Model>>((ref) async* {
  //for show list of cards

  final getData = FirebaseFirestore.instance
      .collection('todoApp')
      .snapshots()
      .map((event) =>
          event.docs.map((e) => TODO_Model.fromSnapShot(e)).toList());
  yield* getData;
});
