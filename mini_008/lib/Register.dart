import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RegisterPage(title: 'Register Form'),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool is_password_visible = false;
  bool is_verify_password_visible = false;

  String username = "";
  String password = "";
  String verify_password = "";
  TextEditingController controller_username = TextEditingController();
  TextEditingController controller_password = TextEditingController();
  TextEditingController controller_verify_password = TextEditingController();

    FirebaseFirestore db = FirebaseFirestore.instance;

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
                Container(
                  width: 120,
                  alignment: Alignment.centerRight,
                  child: Text("Username:"),
                ),

                SizedBox(width: 300, child: TextField(
                  controller: controller_username,
                )),
                Spacer(),
              ],
            ),

            Row(
              children: [
                Spacer(),
                Container(
                  width: 120,
                  alignment: Alignment.centerRight,
                  child: Text("Password:"),
                ),

                SizedBox(width: 300, child: TextField(
                    controller: controller_password,
                )),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  width: 120,
                  alignment: Alignment.centerRight,
                  child: Text("Verify Password:"),
                ),

                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: controller_verify_password,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.vibration),
                      ),
                    ),
                  ),
                ),

                Spacer(),
              ],
            ),
            SizedBox(height: 20),
            OutlinedButton(onPressed: () {
              username = controller_username.text;
              password = controller_password.text;
              verify_password = controller_verify_password.text;

              if(verify_password != password){
                print("verify password incorrect");
                return;
              }
              if(username.length < 5){
                print("username shorter than 5");
                return;
              }
              db.collection("collection credential").add({
                "username": username,
                "password": password,
              });
              print("register success");
            }, child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
