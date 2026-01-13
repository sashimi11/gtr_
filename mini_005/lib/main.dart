import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 15, 179, 228),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MINI_005 - Radio Button Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? selected_speaker = null;
  String speaker = "N/A";
  AudioPlayer player = AudioPlayer();
  double volume = 1.0;

  @override
  void initState() {
    super.initState();
    player.setSourceAsset("Chris Grey - LET THE WORLD BURN (Official Lyric Video).mp3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Chris Grey"),
            Radio<int>(
              value: 1,
              groupValue: selected_speaker,
              onChanged: (int? value) {
                selected_speaker = value;
                speaker = "Let the world burn";
                setState(() {});
              },
            ),
            Text("JBL Speaker"),
            Radio<int>(
              value: 2,
              groupValue: selected_speaker,
              onChanged: (int? value) {
                selected_speaker = value;
                speaker = "JBL Speaker";
                setState(() {});
              },
            ),
            Text("Bose Speaker"),
            Radio<int>(
              value: 3,
              groupValue: selected_speaker,
              onChanged: (int? value) {
                selected_speaker = value;
                speaker = "Bose Speaker";

                setState(() {});
              },
            ),
            Text("Selected Speaker: ${speaker}"),

            Row(
              children: [
                Spacer(),
                OutlinedButton(
                  onPressed: () async {
                    await player.resume();
                  },
                  child: Icon(Icons.play_arrow),
                ),
                OutlinedButton(
                  onPressed: () async {
                    await player.stop();
                  },
                  child: Icon(Icons.stop),
                ),
                Spacer(),
              ],
            ),
            Slider(
              value: volume,
              onChanged: (double value) async {
                volume = value;
                await player.setVolume(volume);
                setState(() {});
              },
            ),
            Text("Volume : ${(volume * 100).toInt()}%"),
          ],
        ),
      ),
    );
  }
}