import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Consts/consts.dart';
import 'package:todo_app/Core/Service/shared_pref.dart';

import '../Models/todo_model.dart';
import '../Service/todo_service.dart';

final serviceProvider = StateProvider<Todo_Service>((ref) {
  return Todo_Service();
});

final sstreamProvider = StreamProvider<List<TODO_Model>>((ref) async* {
  //for show list of cards

  final getData = FirebaseFirestore.instance
      .collection('todoApp')
      .where('userId', isEqualTo: Prefs.getStringValue(userIDPrefs))
      .snapshots()
      .map((event) =>
          event.docs.map((e) => TODO_Model.fromSnapShot(e)).toList());
  yield* getData;
});
