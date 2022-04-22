import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'token.dart';
import '../main.dart';


// from scratch

void main() =>
    runApp(SignUp()); // for functions who had only one argument

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
        "email":emailController.text.toString(),
        "password":passController.text.toString(),
        "name":nameController.text.toString(),
        "firstName":firstNameController.text.toString(),
      "isAdmin":_value.toString()};
      String json2= jsonEncode(json);


      final response = await http.post(Uri.parse(Token.url+url),headers:headers,body:json2);
      final jsonData = jsonDecode(response.body);
      print(jsonData);

      if(response.statusCode==200)
      {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>MyApp()),
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
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: "Prénom",
                    border:  OutlineInputBorder(),),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
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
                  height: 15,
                ),
                Row(

                  children:[
                Radio(
                    value: true,
                    groupValue: _value,
                    onChanged: (value){
                      setState(() {
                        _value = true;
                      });
                    }),
                    SizedBox( height: 10,),
                    Text("Professeur"),]),
                Row(
                  children:[
                Radio(
                    value: false,
                    groupValue: _value,
                    onChanged: (value){
                      setState(() {
                        _value = false;
                      });

                    }),
                SizedBox( height: 10,),
                Text("Etudiant"),]),
                SizedBox(
                    height:45
                ),
                RaisedButton(
                  child: const Text(
                    'Enregistrer',
                  ),
                  onPressed: () {postlClass();},)

              ],))))
    );
  }
}
