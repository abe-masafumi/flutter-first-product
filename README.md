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

### vscodeでのホットリロード

デバックでの実行のみホットリロードに対応
毎回の起動に時間がかかるのでデバックで実行がおすすめ

※ XCodeで実行するのもいいかも(めんどくさい)