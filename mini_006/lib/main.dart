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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 65, 190, 186)),
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
  // List<String> Schedual_names = [
  //   "Morning",
  //   "Afternoon",
  //   "Evening",  
  //   "Night",
  // ];
  dynamic scheduale = [];
  
  
  TextEditingController name_controller = TextEditingController();
  

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
                SizedBox(width: 200, child: TextField(controller: name_controller)),
                OutlinedButton(onPressed: () {
                  String name = name_controller.text;
                  
                  dynamic data = {
                    "Name": name,
                    "Date": "xxxx-xx-xx",
                    "Time": "xx:xx",
                  };
                  scheduale.add(data);
                  setState(() {});
                }, 
                child: Text("Add")),
              ],
            ),

            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: scheduale.length,
                itemBuilder: (context, int index){
                  return Row(
                    children: [
                      Text("Scheduale ${index + 1}: "),
                      Text("${scheduale[index]["Name"]}"),
                      //Text("${scheduale[index]["Date"]}"),
                      //Text("${scheduale[index]["Time"]}"),
                      OutlinedButton(onPressed: () async{
                        DateTime? date = await showDatePicker(
                          context: context, 
                          firstDate: DateTime(2000), 
                          lastDate: DateTime(2100),
                        );
                        //print(date.day);
                        if(date != null){
                          String str_date = "${date.year}-${date.month}-${date.day}";
                          scheduale[index]["Date"] = str_date;
                          setState(() {});
                        }
                      }, 
                        child: Text("${scheduale[index]["Date"]}")),
                    
                      OutlinedButton(onPressed: () async {
                        TimeOfDay? str_time = await showTimePicker(
                          context: context, 
                          initialTime: TimeOfDay.now(),
                        );
                        if(str_time != null){
                          String time = "${str_time.hour}:${str_time.minute}";
                          scheduale[index]["Time"] = time;
                          setState(() {});
                        }
                       
                      }, child: Text("${scheduale[index]["Time"]}")),
                      Spacer(),
                      OutlinedButton(onPressed: () {
                        scheduale.removeAt(index);
                        setState(() {});
                      }, 
                        child: Icon(Icons.delete, color: Colors.red),
                        ),
                    ],
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}