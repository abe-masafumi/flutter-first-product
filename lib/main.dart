import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

// ※※※別ページに移動※※※
// 余計なコードを削除してfirebase_storeとコネクト
class MyHomePage extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('pets-info-01').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // headerのメニュー
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('新規登録'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(onSurface: Colors.red),
              child: Text('次のページ'),
              onPressed: () {
                // ここにボタンを押した時に呼ばれるコードを書く
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


class NextPage extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('pets-info-01').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // headerのメニュー
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('ログイン'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(onSurface: Colors.red),
              child: Text('前のページ'),
              onPressed: () {
                // 戻る
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
