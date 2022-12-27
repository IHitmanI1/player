import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:player/authService.dart';

class AuthPage extends StatefulWidget{
  AuthPage({Key ? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController reppasswordController = TextEditingController();

   bool showLogin = true;

  void signWithEmailAndPassword() async{
    try{
      await Auth().signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch(e){
      setState(() {
        print(e.message);
      });
    }
  }

  void createWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch(e){
      setState(() {
        print(e.message);
      });}
  }

@override
Widget build(BuildContext context) {

  Widget _input(String hint, TextEditingController controller, bool obscure) {
    return TextField(controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(hintText: hint));
  }
  Widget _button(String label) {
    return OutlinedButton(onPressed: () {
      setState(() {
        showLogin ? signWithEmailAndPassword() : createWithEmailAndPassword();
      });
    },
      child: Text(label, style: TextStyle(color: Colors.black),),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1.0, color: Colors.black),),);
  }

  Widget _formLogin(String label, String buttonText) {
    return Container(child: Column(children:
    [
      Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 0)),
      Align(alignment: Alignment.center,
          child: Text(
            label, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,)),
      Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 0)),
      Container(child: _input("Login", emailController, false),
          decoration: BoxDecoration(border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.fromLTRB(80, 0, 80, 20)),
      Container(child: _input("Password", passwordController, true),
          decoration: BoxDecoration(border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.fromLTRB(80, 0, 80, 20)),
      _button(label),
      Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 20))
    ]),);
  }

  Widget _formSignin(String label, String buttonText) {
    return Container(child: Column(children:
    [
      Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 0)),
      Align(alignment: Alignment.center,
          child: Text(
            label, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,)),
      Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 0)),
      Container(child: _input("Name", nameController, false),
          decoration: BoxDecoration(border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.fromLTRB(80, 0, 80, 20)),
      Container(child: _input("Login", emailController, false),
          decoration: BoxDecoration(border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.fromLTRB(80, 0, 80, 20)),
      Container(child: _input("Password", passwordController, true),
          decoration: BoxDecoration(border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.fromLTRB(80, 0, 80, 20)),
      Container(child: _input("Repeat Password", reppasswordController, true),
          decoration: BoxDecoration(border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.fromLTRB(80, 0, 80, 20)),
      _button(label),
      Padding(padding: EdgeInsets.fromLTRB(0, 135, 0, 20))
    ]),);
  }


  return Scaffold(
    body: Column(
      children: <Widget>[
        showLogin ?
        Column(children: [
          _formLogin("Log in", "Log in"),
          TextButton(onPressed: () =>
              setState(() {
                showLogin = false;
              }),
              child: Text("sign in", style: TextStyle(fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline)))
        ]) : Column(children: [
          _formSignin("Sign in", "Sign in"),
          TextButton(onPressed: () =>
              setState(() {
                showLogin = true;
              }),
              child: Text("log in", style: TextStyle(fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline)))
        ])
      ],
    ),
  );
}
}
