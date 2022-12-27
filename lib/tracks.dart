import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as fireStore;
import 'package:flutter/material.dart';

class Tracks extends StatefulWidget {
  final String dir;
  const Tracks({Key? key, required this.dir}) : super(key: key);

  @override
  State<Tracks> createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  late Future<ListResult> futureTracks;
  final fireStore.FirebaseStorage storage = fireStore.FirebaseStorage.instance;

  AudioPlayer audioPlayer = new AudioPlayer();

  Duration duration = new Duration();
  Duration position = new Duration();

  bool isPlaying = false;



  Future<String> getDownloadURL(String dir, String fileName) async {
    try {
      return await FirebaseStorage.instance
          .ref("/$dir")
          .child("/$fileName")
          .getDownloadURL();
    } catch (e) {
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    futureTracks = FirebaseStorage.instance.ref('/${widget.dir}').listAll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ListResult>(
      future: futureTracks,
      builder: (context, snapshot){
        if(snapshot.hasData){
          final tracks = snapshot.data!.items;
          return ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index){
                final track = tracks[index];
                return Card(
                    elevation: 2.0,
                    child: InkWell(onTap: () => setState(() {
                      isPlaying = !isPlaying;
                      String url = "";
                      if(isPlaying){
                        if(track.name == "2Pac - Ambitionz Az A Ridah.mp3"){
                          url = "https://firebasestorage.googleapis.com/v0/b/playeronflutter.appspot.com/o/2Pac%2F2Pac%20-%20Ambitionz%20Az%20A%20Ridah.mp3?alt=media&token=7ac07c6e-8fb8-46db-a5e6-ee35d8b067a6";
                          audioPlayer.play(UrlSource(url));
                        }
                        else if(track.name == "2Pac feat. Dr. Dre - California Love.mp3"){
                          url = "https://firebasestorage.googleapis.com/v0/b/playeronflutter.appspot.com/o/2Pac%2F2Pac%20feat.%20Dr.%20Dre%20-%20California%20Love.mp3?alt=media&token=bff671e7-e554-4722-9f4d-7dfc01b2fae4";
                          audioPlayer.play(UrlSource(url));
                        }
                        else if(track.name == "Dr. Dre - Still D.R.E. (feat. Snoop Dogg).mp3"){
                          url = "https://firebasestorage.googleapis.com/v0/b/playeronflutter.appspot.com/o/Dr.Dre%2FDr.%20Dre%20-%20Still%20D.R.E.%20(feat.%20Snoop%20Dogg).mp3?alt=media&token=a7a11814-68c4-42c1-8308-fc7c5a9d97fb";
                          audioPlayer.play(UrlSource(url));
                        }
                        else if(track.name == "Eminem - Rap God.mp3"){
                          url = "https://firebasestorage.googleapis.com/v0/b/playeronflutter.appspot.com/o/Eminem%2FEminem%20-%20Rap%20God.mp3?alt=media&token=cfea587f-d981-4c2d-a479-4be81eaad77b";
                          audioPlayer.play(UrlSource(url));
                        }
                        else if(track.name == "Eminem - The Real Slim Shady.mp3"){
                          url = "https://firebasestorage.googleapis.com/v0/b/playeronflutter.appspot.com/o/Eminem%2FEminem%20-%20The%20Real%20Slim%20Shady.mp3?alt=media&token=f10d6c3e-22fc-4e2c-8ac9-f08b3de34d38";
                          audioPlayer.play(UrlSource(url));
                        }
                        else if(track.name == "Eminem - Without Me.mp3"){
                          url = "https://firebasestorage.googleapis.com/v0/b/playeronflutter.appspot.com/o/Eminem%2FEminem%20-%20Without%20Me.mp3?alt=media&token=7705a3e8-3e4b-4844-b3ae-b16045572ea6";
                          audioPlayer.play(UrlSource(url));
                        }
                      }
                      else{
                        audioPlayer.stop();
                      }
                    }), child:Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text("${track.name}"),
                        trailing: isPlaying ? Icon(Icons.pause_circle_outline) : Icon(Icons.play_circle_outline)
                      ),)));
              }
          );
        }else if(snapshot.hasError){
          return const Center(child: Text("Error"),);
        }else{
          return const Center(child: Text("No data"),);
        }
      },
    ),
    );
  }
}
