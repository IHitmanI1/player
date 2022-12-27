import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:player/auth.dart';
import 'package:player/authService.dart';
import 'package:player/tracks.dart';

class AlbumsList extends StatefulWidget {
  const AlbumsList({Key ? key}) : super(key: key);

  @override
  _AlbumsListState createState() => _AlbumsListState();
}

class _AlbumsListState extends State<AlbumsList>{
  late Future<ListResult> futureDirs;

  @override
  void initState() {
    super.initState();
    futureDirs = FirebaseStorage.instance.ref().listAll();
  }

  //Container(
  //child:
  //ListView.builder(
  //itemCount: .length,
  //itemBuilder: (context,i){
  //return Card(
  //elevation: 2.0,
  //child: InkWell(onTap: () {}, child:Container(
  //decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(5)),
  //child: ListTile(
  //title: Text(albums[i].title),
  //trailing: Icon(Icons.keyboard_arrow_right),
  //),
  //),)
  //);
  //},
  //),
  //)

  @override
  Widget build(BuildContext context){
      return Scaffold(
          body:
              FutureBuilder<ListResult>(
            future: futureDirs,
            builder: (context, snapshot){
              if(snapshot.hasData){
                final dirs = snapshot.data!.prefixes;
                return ListView.builder(
                    itemCount: dirs.length,
                    itemBuilder: (context, index){
                      final dir = dirs[index];
                      return Card(
                          child: InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Tracks(dir: dir.name))), child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(5)),
                          child: ListTile(
                          title: Text(dir.name),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          ),)));
                    }
                );
              }else if(snapshot.hasError){
                return const Center(child: Text("Error"),);
              }else{
                return const Center(child: Text("No data"),);
              }
            },
          )
  );
  }
}
