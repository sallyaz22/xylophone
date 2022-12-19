import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const XylophoneApp(),
  );
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone',
              style: TextStyle(
                color: Colors.white70,
              )),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          TileWidget(note: 'note1', color: Colors.red),
          TileWidget(note: 'note2', color: Colors.orange),
          TileWidget(note: 'note3', color: Colors.yellow),
          TileWidget(note: 'note4', color: Colors.green),
          TileWidget(note: 'note5', color: Colors.blue),
          TileWidget(note: 'note6', color: Colors.blue.shade900),
          TileWidget(note: 'note3', color: Colors.purple),
          TileWidget(note: 'note8', color: Colors.pink),
        ]),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final Color color;
  final String note;

  const TileWidget({super.key, required this.color, required this.note});

  playNote(String note) async {
    AudioPlayer player = AudioPlayer();
    await player.release();
    await player.setSource(AssetSource('audio/$note'));
    await player.play(AssetSource('audio/$note'));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playNote('$note.wav');
        },
        child: Stack(
          children: [
            Container(
              color: color,
            ),
            Positioned(
              left: 10,
              top: 35,
              child: Icon(
                Icons.circle,
                color: Colors.white70,
                size: 14,
              ),
            ),
            Positioned(
              right: 10,
              top: 35,
              child: Icon(
                Icons.circle,
                color: Colors.white70,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
