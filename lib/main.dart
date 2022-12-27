import 'package:flutter/material.dart';
import 'package:player/landing.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDdmiezuZDomto2fZ3i2EEfBvP3cJyE4k4", appId: "1:99349547360:android:1471792dada2ca6cc13605", messagingSenderId: "99349547360", projectId: "playeronflutter", storageBucket: "playeronflutter.appspot.com"));
  //options: FirebaseOptions(apiKey: "AIzaSyDdmiezuZDomto2fZ3i2EEfBvP3cJyE4k4", appId: "1:99349547360:android:1471792dada2ca6cc13605", messagingSenderId: "99349547360", projectId: "playeronflutter", storageBucket: "playeronflutter.appspot.com")
  runApp(Main());
}

class Main extends StatelessWidget{
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Player",
      home: const LandingPage()
    );
  }
}

