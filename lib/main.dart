import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:xylophone_app/note_model.dart';

void main() {
  runApp(Xilophone());
}

List<Note> listaNotas() {

  return [
    Note(
      name: 'DO',
      audio: 1,
      color: Colors.pink,
    ),
    Note(
      name: 'RE',
      audio: 2,
      color: Colors.indigo,
    ),
    Note(
      name: 'MI',
      audio: 3,
      color: Colors.green,
    ),
    Note(
      name: 'FA',
      audio: 4,
      color: Colors.yellow,
    ),
    Note(
      name: 'SOL',
      audio: 5,
      color: Colors.orange,
    ),
    Note(
      name: 'LA',
      audio: 6,
      color: Colors.brown,
    ),
    Note(
      name: 'SI',
      audio: 7,
      color: Colors.blue,
    ),];
}

class Xilophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  void playNote(int note) {
    final player = AudioPlayer();
    player.play(AssetSource('audio/note$note.wav'));
  }

  List<Note> notas = listaNotas();
  
  Widget buildKey(
      {required Color colorKey, required int note, required String notas}) {
    return Expanded(
      child: Container(
        color: colorKey,
        child: TextButton(
          onPressed: () {
            playNote(note);
          },
          child: Text(
            notas,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Xylophone"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...notas.map((e) => buildKey(
                colorKey: e.color,
                note: e.audio,
                notas: e.name,
              ))
        ],
      ),
    );
  }
}
