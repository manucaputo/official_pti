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
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
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
      title: const Text('Inscription'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
      appBar: appBar,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                //vertical: 75.0,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FittedBox(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                        child: Text("Complète le formulaire :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ))),
                    const SizedBox(height: 10),
                    TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.account_circle_sharp,
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                          ),
                          labelText: "Nom",
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
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.account_circle_sharp,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        ),
                        labelText: "Prénom",
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
                      controller: emailController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        ),
                        labelText: "e-mail",
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
                        suffixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        ),
                        labelText: "mot de passe",
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
                    const SizedBox(height: 20),
                    const FittedBox(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                        child: Text("Sélectionne ton statut :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ))),
                    const SizedBox(height: 10),
                    FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(children: [
                              Radio(
                                  value: true,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = true;
                                    });
                                  }),
                              const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Professeur",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 12, 0, 0.6),
                                      fontSize: 25,
                                      fontFamily: 'OpenSans',
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ]),
                            Row(children: [
                              Radio(
                                  value: false,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = false;
                                    });
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Etudiant",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 12, 0, 0.6),
                                      fontSize: 25,
                                      fontFamily: 'OpenSans',
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ]),
                          ]),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton.icon(
                            icon: const Icon(
                              Icons.login,
                              size: 25,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Je m\'inscris !',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
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
                              postlClass();
                            },
                          )),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
