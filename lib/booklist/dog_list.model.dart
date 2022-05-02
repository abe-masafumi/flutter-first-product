import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/dog.dart';

class DogListModel extends ChangeNotifier {
  // _usersStream >> 変化した時に発火
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('pets-info-01').snapshots();

  List<Dog>? dogs;

  void fetchDogList() {
    // listenして変化があれば snapshotに値が入る
    _usersStream.listen((QuerySnapshot snapshot) {
      final List<Dog> dogs = snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        // firebaseのデータ取得(日本語でもok) 注意！！一つでもデータが入っていないとNUll扱いになる
        final String name = data["名前"];
        final String birthday = data["誕生日"];

        return Dog(name, birthday);
      }).toList();
 
      this.dogs = dogs;
      // 終わりの宣言
      notifyListeners();
    });
  }
}
