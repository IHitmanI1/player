import 'package:firebase_core/firebase_core.dart';
import 'package:player/authService.dart';
import 'package:flutter/material.dart';
import 'package:player/albums.dart';
import 'package:player/auth.dart';
import 'package:player/tracks.dart';

class LandingPage extends StatefulWidget{
  const LandingPage({Key ? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();

}

class _LandingPageState extends State<LandingPage>{

  void initFireBase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDdmiezuZDomto2fZ3i2EEfBvP3cJyE4k4", appId: "1:99349547360:android:1471792dada2ca6cc13605", messagingSenderId: "99349547360", projectId: "playeronflutter", storageBucket: "playeronflutter.appspot.com")
    );
  }


  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: Auth().authStateChanges,
        builder: (context, snapshot){
        if(snapshot.hasData){
          return AlbumsList();
        }
        else{
          return AuthPage();
        }
      }

    );

  }
}
