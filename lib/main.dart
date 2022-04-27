import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'helpers/custom_routes.dart';
import 'menus/prof_menu.dart';
import 'menus/Student_menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'connexion/token.dart';
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

  var url = "/users/login";
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
      Map<String, String> json = {
        "email": emailController.text.toString(),
        "password": passController.text.toString()
      };
      String json2 = jsonEncode(json);

      final response = await http.post(Uri.parse(Token.url + url),
          headers: headers, body: json2);
      final jsonData = jsonDecode(response.body);
      print(jsonData);

      if (response.statusCode == 201) {
        Token.setToken(jsonData["token"]);
        if (jsonData["isAdmin"] == false) {
          /*

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      StudentMenu()),
            );

             */

          Navigator.of(context).pushReplacement(CustomRoute(
            builder: (ctx) => StudentMenu(),
          ));
        }
        if (jsonData["isAdmin"] == true) {
          /*

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfMenu()),
            );

             */
          Navigator.of(context).pushReplacement(CustomRoute(
            builder: (ctx) => ProfMenu(),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: const Text("Il manque des champs")));
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        'Bienvenue sur MixMath',
      ),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SafeArea(
                  child: Center(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: CircleAvatar(
                        backgroundColor:
                            const Color.fromRGBO(221, 229, 221, 1.0),
                        radius: 70,
                        child: Image.asset('assets/images/logo.png', scale: 9)),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(height: 45),
                  OutlinedButton.icon(
                      onPressed: () {
                        postConnexion();
                      },
                      icon: const Icon(
                        Icons.login,
                        size: 18,
                        color: Color.fromRGBO(13, 78, 5, 0.75),
                      ),
                      label: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color.fromRGBO(13, 78, 5, 0.75),
                        ),
                      )),
                  const SizedBox(height: 45),
                  OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      icon: const Icon(Icons.login,
                          size: 18, color: Color.fromRGBO(13, 78, 5, 0.75)),
                      label: const Text(
                        "S'enregistrer",
                        style: TextStyle(
                          color: Color.fromRGBO(13, 78, 5, 0.75),
                        ),
                      )),
                  RaisedButton(
                    child: const Text(
                      'Menu éléves',
                    ),
                    onPressed: () {
                      /*

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StudentMenu()),
                      );

                       */

                      Navigator.of(context).pushReplacement(CustomRoute(
                        builder: (ctx) => StudentMenu(),
                      ));
                    },
                  ),
                  RaisedButton(
                      child: const Text(
                        'Menu prof',
                      ),
                      onPressed: () {
                        /*


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfMenu()),
                        );

                         */

                        Navigator.of(context).pushReplacement(CustomRoute(
                          builder: (ctx) => ProfMenu(),
                        ));
                      })
                ],
              )))),
        ));
  }
}
