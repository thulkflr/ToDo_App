
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? displayName;
  String? email;
  String? photoUrl;
  bool? loginState;
  bool? state;
  UserModel(this.uid, this.displayName, this.email, this.photoUrl,this.loginState,this.state);

  UserModel.name();

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    displayName = json['displayName'];
    photoUrl = json['photoUrl'];
    email = json['email'];
    loginState = json['loginState'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['displayName'] = displayName;
    data['photoUrl'] = photoUrl;
    data['email'] = email;
    data['loginState'] = loginState;
    data['state'] = state;

    return data;
  }

}


