import 'package:flutter/material.dart';
import 'package:official_pti/buttons/second_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../connexion/token.dart';
import '../menus/Student_menu.dart';

// from scratch

void main() => runApp(JoinClass()); // for functions who had only one argument

class JoinClass extends StatefulWidget {
  @override
  State<JoinClass> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<JoinClass> {
  var nameController = TextEditingController();
  var passController = TextEditingController();

  var url = "/class/join";
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };
  var _postsJson;
  @override
  void initState() {
    super.initState();
  }

  Future<void> joinClass() async {
    try {
      print(nameController.text);
      print(passController.text);
      Map<String, String> json = {
        "name": nameController.text.toString(),
        "password": passController.text.toString()
      };
      String json2 = jsonEncode(json);

      final response = await http.post(Uri.parse(Token.url + url),
          headers: headers, body: json2);
      final jsonData = jsonDecode(response.body);
      print(jsonData);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentMenu()),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Il manque des champs")));
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Rejoins ta classe !'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );
    return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Accueil_TITRE.png', scale: 5),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
                    child: SizedBox(
                      width: 1000,
                      child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Nom de la classe",
                            labelStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(0, 12, 0, 0.6),
                                fontSize: 14),
                            suffixIcon: const Icon(
                              Icons.school,
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
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                    child: SizedBox(
                      width: 1000,
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
                                  width: 1,
                                )),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.login,
                          size: 30,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Rejoindre',
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
                            primary: const Color.fromRGBO(13, 78, 5, 0.7),
                            side: const BorderSide(
                              width: 3,
                              color: Color.fromRGBO(13, 78, 5, 0.1),
                            )),
                        onPressed: () {
                          joinClass();
                        },
                      ),
                    ),
                  )
                ]),
          ),
        ));
/*
    return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child :SafeArea(child:Center
              (child:Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [


                Image.asset('assets/images/Accueil_TITRE.png',
                    scale: 2),

                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color :Color.fromRGBO(13, 78, 5, 0.6),
                          width: 2.5,


                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color :Color.fromRGBO(13, 78, 5, 0.6),
                          width: 1.0,)
                    ),
                    labelText: "Nom",
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(0, 12, 0, 0.6),
                        fontSize: 20),
                    border:  OutlineInputBorder(),
                    ),

                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: passController,
                  obscureText: true,

                  decoration: const InputDecoration(
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color :Color.fromRGBO(13, 78, 5, 0.6),
                       width: 2.5,

                     )
                   ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color :Color.fromRGBO(13, 78, 5, 0.6),
                        width: 1.0,)
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(0, 12, 0, 0.6),
                    fontSize: 20),
                    border:  OutlineInputBorder(),),
                ),
                SizedBox(
                    height:45
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: ElevatedButton(
                    child: const Text('Rejoindre',
                        style: TextStyle(
                            color: Color.fromRGBO(13, 78, 5, 0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(800, 65),
                      maximumSize: const Size(800, 65),
                      primary: const Color.fromRGBO(221, 229, 221, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(
                            width: 5.0,
                            color: Color.fromRGBO(13, 78, 5, 0.6),
                          )),
                    ),
                    onPressed: () {
                      joinClass();
                    },
                  ),
                ),
                /*
                RaisedButton(
                  child: const Text(
                    'Rejoindre',
                  ),
                  onPressed: () {joinClass();},)*/

              ],))))
    );*/
  }
}
