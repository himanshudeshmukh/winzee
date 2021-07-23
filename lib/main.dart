
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:winzee/splashScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Winzee',
      home: SplashScreen(),
    );
  }
}
