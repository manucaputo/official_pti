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
    final appBar = AppBar(
      title: DefaultTextStyle(
        style: const TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              'Bienvenue sur MixMath !',
              textAlign: TextAlign.center,
              duration: const Duration(
                seconds: 2,
              ),
            ),
            FadeAnimatedText(
              'Défie les élèves de ta classe...',
              textAlign: TextAlign.center,
              duration: const Duration(seconds: 3),
            ),
            FadeAnimatedText(
              'Tout en testant tes connaissances sur les chapitres !',
              textAlign: TextAlign.center,
              duration: const Duration(seconds: 3),
            ),
            FadeAnimatedText(
              'Aide tes camarades quand tu peux après chaque partie...',
              textAlign: TextAlign.center,
              duration: const Duration(seconds: 3),
            ),
            FadeAnimatedText(
              'Et écoute leurs explications pour évoluer un max !',
              textAlign: TextAlign.center,
              duration: const Duration(seconds: 3),
            ),
          ],
          repeatForever: true,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: const Color.fromRGBO(221, 229, 221, 1.0),
                radius: 80,
                child: Image.asset('assets/images/logo.png', scale: 6)),
            Container(
              margin: const EdgeInsets.fromLTRB(25.0, 10, 25.0, 0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email...",
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(0, 12, 0, 0.6),
                      fontSize: 14),
                  suffixIcon: const Icon(
                    Icons.email,
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
                        width: 0.5,
                      )),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25.0, 10, 25.0, 0),
              child: TextFormField(
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
                          width: 0.5,
                        )),
                  )),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(105, 20, 105, 0),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.login,
                  size: 30,
                  color: Colors.white,
                ),
                label: const Text('Connexion',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 55),
                    maximumSize: const Size(400, 55),
                    primary: const Color.fromRGBO(13, 78, 5, 0.7),
                    side: const BorderSide(
                      width: 3,
                      color: Color.fromRGBO(221, 229, 221, 1.0),
                    )),
                onPressed: () {
                  postConnexion();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(85, 150, 85, 0),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.app_registration,
                  size: 30,
                  color: Colors.black,
                ),
                label: const Text('Nouveau membre',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontStyle: FontStyle.italic)),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(800, 45),
                    maximumSize: const Size(800, 45),
                    primary: const Color.fromRGBO(221, 229, 221, 1.0),
                    side: const BorderSide(
                      width: 2.5,
                      color: Color.fromRGBO(221, 229, 221, 1.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
              ),
            ),
            ElevatedButton(
                child: const Text(
                  'Menu élèves',
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentMenu()));
                }),
            ElevatedButton(
                child: const Text(
                  'Menu prof',
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfMenu()));
                }),
          ],
        ),
      )),
    );
  }
}
