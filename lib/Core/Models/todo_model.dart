import 'package:cloud_firestore/cloud_firestore.dart';

class TODO_Model {
  String? documentID;
   String? title;
   String? description;
   String? category;
   String? date;
   String? time;
   bool? status;
   String? userId;

  TODO_Model.name();

  TODO_Model({
    this.documentID,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.time,
    required this.userId,
    required this.status,
  });

  Map<String, dynamic> toMap() {

    return <String, dynamic>{
      'documentID': documentID,
      'title': title,
      'description': description,
      'category': category,
      'date': date,
      'time': time,
      'userId': userId,
      'status': status
    };
  }

  factory TODO_Model.fromMap(Map<String, dynamic> map) {
    return TODO_Model(
        documentID:
            map['documentID'] != null ? map['documentID'] as String : null,
        title: map['title'] as String,
        description: map['description'] as String,
        category: map['category'] as String,
        date: map['date'] as String,
        time: map['time'] as String,
        userId: map['userId'] as String,
        status: map['status'] as bool);
  }

  factory TODO_Model.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapShot) {
    return TODO_Model(
        documentID: documentSnapShot.id,
        title: documentSnapShot['title'],
        description: documentSnapShot['description'],
        category: documentSnapShot['category'],
        date: documentSnapShot['date'],
        time: documentSnapShot['time'],
        userId: documentSnapShot['userId'],
        status: documentSnapShot['status']);
  }
}
