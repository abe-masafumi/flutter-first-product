// 余計なコードを削除してfirebase_storeとコネクト
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('pets-info-01').snapshots();
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // headerのtitleの指定
        title: Text("firebase-data一覧"),
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['名前']),
              subtitle: Text(data['誕生日']),
            );
          }).toList(),
        );
      },
     ),
    );
  }
}