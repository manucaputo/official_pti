import 'package:flutter/material.dart';
import 'package:official_pti/buttons/second_button.dart';
import 'buttons/first_button.dart';
import 'buttons/second_button.dart';
import 'buttons/third_button.dart';
import 'menus/prof_menu.dart';
import 'menus/Student_menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'connexion/token.dart' ;
import 'connexion/signup.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'MixMath'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();


  var url = "http://192.168.1.100:3000/api/users/login";
  Map<String, String> headers = {
    "Content-type": "application/json",
  };
  var _postsJson;
  @override
  void initState() {
    super.initState();
    print(Token.token);


  }

  Future<void> postConnexion() async {
    try {
      print(emailController.text);
      print(passController.text);
      Map<String, String> json = {"email":emailController.text.toString(),"password":passController.text.toString()};
      String json2= jsonEncode(json);


      final response = await http.post(Uri.parse(url),headers:headers,body:json2);
      final jsonData = jsonDecode(response.body);
      print(jsonData);

      if(response.statusCode==201)
        {Token.setToken(jsonData["token"]);
          if(jsonData["isAdmin"]==false) {

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      StudentMenu()),
            );
          }
          if(jsonData["isAdmin"]==true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfMenu()),
            );
          }

        }

      else{
       ScaffoldMessenger.of(context)
           .showSnackBar(SnackBar(content: Text("Il manque des champs")));
    }
    } catch (err) {print(err);}
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Menu'),
      backgroundColor: const Color.fromRGBO(0, 0, 255, 0.55),
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
          child :SafeArea(child:Center
            (child:Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: "Email",
                    border:  OutlineInputBorder(),
                    suffixIcon:  Icon(Icons.email)),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password",
                    border:  OutlineInputBorder(),
                    suffixIcon:  Icon(Icons.email)),
              ),
              SizedBox(
                height:45
              ),
              OutlinedButton.icon(onPressed: () {postConnexion();}, icon: Icon(Icons.login,size:18), label: Text("Login")),
              SizedBox(
                  height:45
              ),
              OutlinedButton.icon(onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SignUp()),
              );
              }, icon: Icon(Icons.login,size:18), label: Text("S'enregistrer")),
      RaisedButton(
        child: const Text(
          'Menu éléves',
        ),
        onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentMenu()),
        );},
      ),
      RaisedButton(
      child: const Text(
      'Menu prof',
    ),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    ProfMenu()),
    );})


            ],))))
    );
  }
}
