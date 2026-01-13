import 'package:flutter/material.dart';

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
          seedColor: const Color.fromARGB(255, 136, 255, 45),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool is_light_0n = false;
  bool is_door_0pen = false;
  bool is_rice_cook = false;
  int counter = 20;
  void count_down(){
      if (counter > 0){
        Future.delayed(const Duration(seconds: 1), (){
          counter--;
          setState((){});
          count_down();
      }); 
    };
    if (counter == 0){
      counter = 20;
      is_rice_cook = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Rice is Cooked!"))
      );
    }

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
            Row(
              children: [
                Spacer(),
                Text("Light Control:"),
                Switch(
                  value: is_light_0n,
                  onChanged: (bool value) {
                    is_light_0n = value;
                    setState(() {});
                  },
                ),
                if (is_light_0n)
                  Icon(
                    Icons.lightbulb,
                    color: is_light_0n ? Colors.yellow : Colors.grey,
                  ),
                if (!is_light_0n) Icon(Icons.lightbulb_outline),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text("Door Control:"),
                Switch(
                  value: is_door_0pen,
                  onChanged: (bool value) {
                    is_door_0pen = value;
                    setState(() {});
                  },
                ),
                if (is_door_0pen)
                  Icon(
                    Icons.door_back_door,
                    color: is_door_0pen
                        ? const Color.fromARGB(255, 32, 145, 211)
                        : Colors.grey,
                  ),
                if (!is_door_0pen) Icon(Icons.door_front_door_outlined),
                Spacer(),
              ],
            ),
            Text("Rice is Cooking: ${counter}seconds"),
            Checkbox(value: is_rice_cook, onChanged: (bool? value){
              if (value != null) {
                is_rice_cook = value;
              if (is_rice_cook){
                count_down();
              }
                setState(() {});
              }
            }),

          ],
          
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
