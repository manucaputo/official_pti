import 'package:flutter/material.dart';
import 'package:official_pti/second_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'token.dart';
import 'Student_menu.dart';

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

  var url = "http://192.168.1.100:3000/api/class/join";
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };
  var _postsJson;
  @override
  void initState() {
    super.initState();
    print(Token.token);


  }

  Future<void> joinClass() async {
    try {
      print(nameController.text);
      print(passController.text);
      Map<String, String> json = {"name":nameController.text.toString(),"password":passController.text.toString()};
      String json2= jsonEncode(json);


      final response = await http.post(Uri.parse(url),headers:headers,body:json2);
      final jsonData = jsonDecode(response.body);
      print(jsonData);

      if(response.statusCode==200)
      {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  StudentMenu()),
        );
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
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Nom",
                    border:  OutlineInputBorder(),),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border:  OutlineInputBorder(),),
                ),
                SizedBox(
                    height:45
                ),
                RaisedButton(
                  child: const Text(
                    'Rejoindre',
                  ),
                  onPressed: () {joinClass();},)

              ],))))
    );
  }
}
