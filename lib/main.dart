import 'package:animated_text_kit/animated_text_kit.dart';
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
            const SnackBar(content: Text("Il manque des champs")));
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 110.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(221, 229, 221, 1.0),
                          radius: 85,
                          child:
                              Image.asset('assets/images/logo.png', scale: 6)),
                      const SizedBox(height: 20.0),
                      TextLiquidFill(
                        text: 'Bienvenue !',
                        waveColor: const Color.fromRGBO(13, 78, 5, 0.6),
                        boxBackgroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                        boxHeight: 70,
                        loadDuration: const Duration(seconds: 8),
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.email,
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                              ),
                              labelText: "Email...",
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromRGBO(0, 12, 0, 0.6),
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(13, 78, 5, 0.6),
                                    width: 3.5,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 1,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Mot de passe...",
                                labelStyle: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(0, 12, 0, 0.6),
                                    fontSize: 14),
                                suffixIcon: const Icon(
                                  Icons.lock,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(13, 78, 5, 0.6),
                                      width: 3.5,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      width: 1,
                                    )),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.login,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Connexion',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: 'OpenSans',
                                        fontStyle: FontStyle.italic),
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(175, 55),
                                      maximumSize: const Size(175, 55),
                                      primary:
                                          const Color.fromRGBO(13, 78, 5, 0.7),
                                      side: const BorderSide(
                                        width: 3,
                                        color: Color.fromRGBO(13, 78, 5, 0.1),
                                      )),
                                  onPressed: () {
                                    postConnexion();
                                  },
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: 50,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.app_registration,
                                      size: 30,
                                      color: Color.fromRGBO(13, 78, 5, 0.7),
                                    ),
                                    label: const Text(
                                      'Inscription',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color.fromRGBO(13, 78, 5, 0.7),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'OpenSans',
                                          fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.center,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(175, 55),
                                        maximumSize: const Size(175, 55),
                                        primary: Colors.white,
                                        side: const BorderSide(
                                          width: 3,
                                          color: Colors.white,
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()),
                                      );
                                    },
                                  ))),
                          /*
                          ElevatedButton(
                              child: const Text(
                                'Menu élèves',
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentMenu()));
                              }),
                          ElevatedButton(
                              child: const Text(
                                'Menu prof',
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfMenu()));
                              }),

                            */
                        ],
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
