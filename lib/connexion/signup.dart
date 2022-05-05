import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'token.dart';
import '../main.dart';

// from scratch

void main() => runApp(SignUp()); // for functions who had only one argument

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<SignUp> {
  var nameController = TextEditingController();
  var firstNameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  var url = "/users/register";
  Map<String, String> headers = {
    "Content-type": "application/json",
  };
  var _postsJson;
  bool _value = false;
  @override
  void initState() {
    super.initState();
    print(Token.token);
  }

  Future<void> postlClass() async {
    try {
      Map<String, String> json = {
        "email": emailController.text.toString(),
        "password": passController.text.toString(),
        "name": nameController.text.toString(),
        "firstName": firstNameController.text.toString(),
        "isAdmin": _value.toString()
      };
      String json2 = jsonEncode(json);

      final response = await http.post(Uri.parse(Token.url + url),
          headers: headers, body: json2);
      final jsonData = jsonDecode(response.body);
      print(jsonData);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
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
      title: const Text('Enregistrez vous '),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
      appBar: appBar,
      body: Stack(alignment: Alignment.center, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Nom",
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(0, 12, 0, 0.6), fontSize: 20),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(13, 78, 5, 0.6),
                        width: 3.5,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 0.5,
                      )),
                  suffixIcon: Icon(
                    Icons.account_circle_sharp,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
              child: TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: "Prénom",
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(0, 12, 0, 0.6), fontSize: 20),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(13, 78, 5, 0.6),
                        width: 3.5,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 0.5,
                      )),
                  suffixIcon: Icon(
                    Icons.account_circle_sharp,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(0, 12, 0, 0.6), fontSize: 20),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(13, 78, 5, 0.6),
                        width: 3.5,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 0.5,
                      )),
                  suffixIcon: Icon(
                    Icons.email,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
              child: TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(0, 12, 0, 0.6), fontSize: 20),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(13, 78, 5, 0.6),
                        width: 3.5,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 0.5,
                      )),
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 45),
            Text("Choisi ton statut",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                )),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                      value: true,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = true;
                        });
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Professeur",
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 12, 0, 0.6), fontSize: 30),
                  ),
                  Radio(
                      value: false,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = false;
                        });
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Etudiant",
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 12, 0, 0.6), fontSize: 30),
                  ),
                ]),
            SizedBox(height: 45),
            Container(
              margin: const EdgeInsets.fromLTRB(35.0, 20, 35.0, 0),
              child: ElevatedButton(
                child: const Text('Enregistrer',
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
                  postlClass();
                },
              ),
            ),
          ],
        )
      ]),
    );
  }
}
