import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
  final gtr_logo = Image.asset('assets/gtr_logo.png');
  String str_sum = "";
  String str_num1 = "";
  String str_num2 = "";

  var controller_num1 = TextEditingController();
  var controller_num2 = TextEditingController();

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
            SizedBox(width: 150, child: gtr_logo),
            Spacer(),
            Row(
              children: [
                Spacer(),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: controller_num1,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                Text("+"),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: controller_num2,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                Text("Sum: $str_sum"),
                Spacer(),
              ],
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                str_num1 = controller_num1.text;
                str_num2 = controller_num2.text;

                int num1 = int.parse(str_num1);
                int num2 = int.parse(str_num2);

                int sum = num1 + num2;
                str_sum = sum.toString();
                // print(str_num1);
                // print(str_num2);

                // str_sum = "200";
                // print(str_sum);
                setState(() {});
              },
              child: Text("Click me"),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}