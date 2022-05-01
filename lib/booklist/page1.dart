// 余計なコードを削除してfirebase_storeとコネクト
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/dog.dart';
import 'package:provider/provider.dart';

import 'dog_list.model.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DogListModel>(
      create: (_) => DogListModel()..fetchDogList(),
      child: Scaffold(
        appBar: AppBar(
          // headerのtitleの指定
          title: Text("firebase-data一覧"),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         // 画面遷移
          //       },
          //       icon: Icon(Icons.person))
          // ],
        ),
        body: Center(child: Consumer<DogListModel>(
          builder: (context, model, child) {
            final List<Dog>? dogs = model.dogs;

            if (dogs == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = dogs
                .map(
                  (book) => ListTile(
                    title: Text(book.name),
                    subtitle: Text(book.birthday),
                  ),
                )
                .toList();
            return ListView(
              children: widgets,
            );
          },
        )),
      ),
    );
  }
}
