# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

----

[doc](https://docs.flutter.dev/search?q=navigate)

## use

[元々xcodeでの使用が主流だったがvscodeでも使用できたため使い慣れているvscodeで使用する](https://qiita.com/apricotcomic/items/7ff53950e10fcff212d2)

シュミレーターも正常に起動できた

### clone後の処理

[pubspec.yaml のパッケージをインストール](https://laox.com/ja/uhq6)

```bash
flutter pub get 
```

## flutter doctor

環境構築が終わっているかの確認

2つほど終わっていないみたいだがこのまま進める

異常が出た時対応

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 2.10.5, on macOS 12.2.1 21D62 darwin-arm, locale ja-JP)
[!] Android toolchain - develop for Android devices (Android SDK version 32.1.0-rc1)
    ✗ cmdline-tools component is missing
      Run `path/to/sdkmanager --install "cmdline-tools;latest"`
      See https://developer.android.com/studio/command-line for more details.
    ✗ Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/macos#android-setup for more details.
[!] Xcode - develop for iOS and macOS (Xcode 13.3.1)
    ✗ CocoaPods not installed.
        CocoaPods is used to retrieve the iOS and macOS platform side's plugin code that responds to
        your plugin usage on the Dart side.
        Without CocoaPods, plugins will not work on iOS or macOS.
        For more info, see https://flutter.dev/platform-plugins
      To install see https://guides.cocoapods.org/using/getting-started.html#installation for
      instructions.
[✓] Chrome - develop for the web
[✓] Android Studio (version 2021.1)
[✓] VS Code (version 1.66.2)
[✓] Connected device (1 available)
[✓] HTTP Host Availability

! Doctor found issues in 2 categories.
```

### cliの環境構築

[firebase cli の説明](https://zenn.dev/pressedkonbu/articles/deploy-flutter-web-app-with-firebase-hosting)

[firebaseの初期化](https://firebase.google.com/docs/cli?hl=ja#macos)

```
'on':
  push:
    branches:
      - main <--- master に変更
```

### vscodeでのホットリロード

デバックでの実行のみホットリロードに対応
毎回の起動に時間がかかるのでデバックで実行がおすすめ

※ XCodeで実行するのもいいかも(めんどくさい)

### 今のところ不便なところ

1.
使用端末iphone12-でgooglechromeでデプロイしたfirebaseリンクを開くとバグる。まずUIがおかしくなる、ボタンクリックも反応しない。[こちら](https://www.amazon.co.jp/-/en/gp/video/detail/B09PRQJVB2/ref=atv_wl_hom_c_unkc_1_9?language=en)

2.
flutterのレンダリングと描画が特殊なので文字をコピーできない

対処法
[参考資料](https://qiita.com/sekitaka_1214/items/24f021605ef4961c746e)

### firebaseとflutterの連携

[firebase_core](https://pub.dev/packages/firebase_core)

[Initializing FlutterFire](https://firebase.flutter.dev/docs/overview/)

[ステップ 3: Firebase 構成ファイルを追加する](https://firebase.google.com/docs/flutter/setup?platform=ios)
[ステップ 3: Firebase 構成ファイルを追加する-webの場合](https://firebase.google.com/docs/projects/learn-more#config-files-objects)

```
Firebase configuration file lib/firebase_options.dart generated successfully with the following Firebase apps:

Platform  Firebase App Id
web       1:356844505654:web:adfd5e908abdd5e522a697
android   1:356844505654:android:ec7906ea548b095c22a697
ios       1:356844505654:ios:677b6c08071e761d22a697

Learn more about using this file in the FlutterFire documentation:
 > https://firebase.flutter.dev/docs/cli
 ```

 ### コマンド

```bash
flutter build web
```

```bash
flutter run
```

```bash
flutter packages get
```

### 英語表記のサイト

[firebase plugins](https://firebase.flutter.dev/)

[firestore clud処理](https://firebase.flutter.dev/docs/firestore/usage/)

### 必要な実装

fontの設定
ページ遷移
データベース連結（crud）
検索


### アイコンの追加方法

[設定](https://api.flutter.dev/flutter/material/Icons-class.html)

[アイコンの探し方](https://zenn.dev/tama8021/articles/dbc931e23120bb)

```dart
  こんな感じ
  appBar: AppBar(
    // headerのtitleの指定
    title: Text("firebase-data一覧"),
    actions: [
      Container(
        margin:  EdgeInsets.only(right: 50),
        child: Icon(
        Icons.arrow_circle_right_sharp,
        color: Colors.blue,
        size: 30.0,
      ),
      )
    ],
  ),
```



### AppBarの編集

[appbarの編集](https://zenn.dev/sugitlab/articles/e68b2fce02e50f)

### memo


```
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
```