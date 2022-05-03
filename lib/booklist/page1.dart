// 余計なコードを削除してfirebase_storeとコネクト
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/booklist/page2.dart';
import 'package:flutter_application_1/domain/dog.dart';
import 'package:provider/provider.dart';

import 'dog_list.model.dart';

class Page01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DogListModel>(
      create: (_) => DogListModel()..fetchDogList(),
      child: Scaffold(
      appBar: AppBar(
        // headerのメニュー
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('ここにページの名前'),
        centerTitle: true,
      
        actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
          // appbarの透明感
          elevation: 1,
          // backgroundColor: Color.fromARGB(0, 230, 226, 226),
          // appbarに写真を追加
          flexibleSpace: Image.network(
            '../images/image01.png',
            fit: BoxFit.cover,
          ),
          //  ここで高さを指定してあげるとまた雰囲気が変わります
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
      ),


      // bodyの始まる位置がappbarの下になる
        extendBodyBehindAppBar:true,
        body: Center(
          child: Consumer<DogListModel>(
          builder: (context, model, child) {
            final List<Dog>? dogs = model.dogs;

            if (dogs == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = dogs
                .map(
                  (dog) => ListTile(
                    title: Text(dog.name),
                    subtitle: Text(dog.birthday),
                  ),
                )
                .toList();
            return ListView(
              children: widgets,

            );
          },
        ),)
      ),
    );
  }
}
