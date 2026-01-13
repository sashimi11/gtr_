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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  final itc_logo = Image.asset('assets/itc_logo.png');
  final gtr_logo = Image.asset('assets/gtr_logo.png');

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
            Row(children: [
              Spacer(),
              SizedBox(
                width : 100,
                height : 100,
                child : itc_logo,
              ),
            Text(
              "កម្មវិធីតូច០០២",
              style : TextStyle(
                fontFamily : 'NotoSansKhmer.ttf',
                fontSize : 36,
                fontWeight : FontWeight.bold,
                backgroundColor : Colors.yellow,
                color : Colors.green,
                decoration : TextDecoration.underline, 
                decorationColor : Colors.grey,
                decorationStyle : TextDecorationStyle.wavy,
                fontStyle : FontStyle.italic,
              ),
              ),
            SizedBox(width: 20),
            SizedBox(
            width : 100,
            height : 100,
            child : gtr_logo,
          ),
          Spacer(),
            ],
            ),
          Spacer(),
        ],
       
        ),
      ),
    );
  }
}