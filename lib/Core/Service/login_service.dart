import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/Core/Models/user_model.dart';

import '../../View/home_page.dart';
import 'shared_pref.dart';

//GooGle Login

late Stream<User?> stream;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

 const String collectionName = 'users';
var msg = '';
var uid = '';
int statusCode = 0;


Future<String> signInWithGoogle(context ) async {
  var msg = '';
  var uid = '';
  //Auth request\
  try {
    final GoogleSignInAccount? getUser = await googleSignIn.signIn();
    if (getUser != null) {
      final authentication = await getUser.authentication;
      //final TODO_Model model =TODO_Model(title: 'title', description: 'description', category: 'category', date: 'date', time: 'time', status: false);

      //create credential
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      await _firebaseAuth.signInWithCredential(credential);
      await saveUser(getUser);
      uid =   _firebaseAuth.currentUser!.uid;
      log(uid);
      Prefs.setStringValue('uid', uid);
      Prefs.setBooleanValue('loginState', true);

    }
  } on FirebaseException catch (error) {
    log(error.toString());
  }
  if (msg.isEmpty) {
    print( uid);
    return uid;
  }
  log('msg : $msg');
  return msg;
}
Future<void> saveUser(GoogleSignInAccount account) async {
  await FirebaseFirestore.instance.collection('users').doc(account.email).set({
    "uid": _firebaseAuth.currentUser!.uid,
    "email": account.email,
    "displayName": account.displayName,
    "photoUrl": account.photoUrl,

  });
  print('dddddooooooooooneeeee');
}

Future<UserModel> getUser(String uid) async {
  var result = await _fireStore
      .collection(collectionName)
      .where('uid', isEqualTo: uid)
      .get();
  log(result.docs[0].data().toString());


  return UserModel.fromJson(result.docs[0].data());
}

Future<void> addUser(UserModel model) async {
  await _fireStore
      .collection(collectionName)
      .add(model.toJson())
      .catchError((err) {
    handleAuthErrors(err);
  });
}

Future<UserModel> getUserData(String uid) async {
  QuerySnapshot query = await _fireStore
      .collection(collectionName)
      .where('uid', isEqualTo: uid)
      .get();
  var data = query.docs[0];
  Map<String, dynamic> dataMap = {};
  dataMap['uid'] = data.get('uid');
  dataMap['displayName'] = data.get('displayName');
  dataMap['photoUrl'] = data.get('photoUrl');
  dataMap['email'] = data.get('email'); ;

  return UserModel.fromJson(dataMap);
}

Future<List<UserModel>> getUsers() async {
  List<UserModel> result = [];
  QuerySnapshot query = await _fireStore.collection(collectionName).get();
  for (var item in query.docs) {
    result.add(UserModel.fromJson(item.data() as Map<String, dynamic>));
  }
  return result;
}

void handleAuthErrors(ArgumentError error) {
  String errorCode = error.message;
  switch (errorCode) {
    case "ABORTED":
      {
        statusCode = 400;
        msg = "The operation was aborted";
      }
      break;
    case "ALREADY_EXISTS":
      {
        statusCode = 400;
        msg = "Some document that we attempted to create already exists.";
      }
      break;
    case "CANCELLED":
      {
        statusCode = 400;
        msg = "The operation was cancelled";
      }
      break;
    case "DATA_LOSS":
      {
        statusCode = 400;
        msg = "Unrecoverable data loss or corruption.";
      }
      break;
    case "PERMISSION_DENIED":
      {
        statusCode = 400;
        msg =
            "The caller does not have permission to execute the specified operation.";
      }
      break;
    default:
      {
        statusCode = 400;
        msg = error.message;
      }
      break;
  }
  log('msg : $msg');
}
