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
        body:
        SingleChildScrollView(
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: CircleAvatar(
                        backgroundColor:
                            const Color.fromRGBO(221, 229, 221, 1.0),
                        radius: 80,
                        child: Image.asset('assets/images/logo.png', scale: 6)),
                  ),
                  Container(
                    child: Column(
                      children: const [
                        Text(
                          "Bienvenu",
                          style:TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(0, 12, 0, 0.6),
                              fontSize: 20),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Color.fromRGBO(0, 0, 0, 0.6),),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                          ),
                        focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color :Color.fromRGBO(13, 78, 5, 0.6),
                          width: 3.5,


                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(

                          width: 0.5,)
                    ),
                         ),
                          
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
                  child :TextFormField(

                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Mot de passe",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 12, 0, 0.6),
                          fontSize: 20),
                        suffixIcon: Icon(
                            Icons.lock,
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color :Color.fromRGBO(13, 78, 5, 0.6),
                          width: 3.5,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(

                          width: 0.5,)
                    ),)



                  ),),
                  const SizedBox(height: 30),

                  Container(

                    margin: const EdgeInsets.fromLTRB(35.0, 20, 35.0, 0),
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.login,
                        size: 35,
                        color: Color.fromRGBO(221, 229, 221, 1.0),

                      ),
                      label : const Text('Connexion',
                          style: TextStyle(
                              color: Color.fromRGBO(221, 229, 221, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(800, 55),
                        maximumSize: const Size(800, 55),
                        primary: const Color.fromRGBO(13, 78, 5, 0.75),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(13, 78, 5, 0.6),
                              )),


                      ),
                      onPressed: () {
                        postConnexion();

                      },
                    ),
                  ),
                  Container(

                    margin: const EdgeInsets.fromLTRB(35.0, 20, 35.0, 0),
                    child: ElevatedButton(
                      child : const Text('Créer un nouveau compte',
                          style: TextStyle(
                              color: Color.fromRGBO(221, 229, 221, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(800, 55),
                        maximumSize: const Size(800, 55),
                        primary: const Color.fromRGBO(13, 78, 5, 0.75),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(13, 78, 5, 0.6),
                            )),


                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );

                      },
                    ),
                  ),
/*
                  OutlinedButton.icon(
                      onPressed: () {
                        postConnexion();
                      },

                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(13, 78, 5, 0.6),
                              ))

                      ),
                      icon: const Icon(
                        Icons.login,
                        size: 35,
                        color: Color.fromRGBO(13, 78, 5, 0.75),

                      ),
                      label: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color.fromRGBO(13, 78, 5, 0.75),
                        ),
                      )),
                  const SizedBox(height: 10),
                  OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(13, 78, 5, 0.6),
                              ))

                      ),
                      icon: const Icon(Icons.login,
                          size: 35,
                          color: Color.fromRGBO(13, 78, 5, 0.75)),
                      label: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromRGBO(13, 78, 5, 0.75),
                        ),
                      )),*/
                  ElevatedButton(
                    child: const Text(
                      'Menu élèves',
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
                  ElevatedButton(
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
              )));
  }
}
