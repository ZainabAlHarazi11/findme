import 'package:flutter/material.dart';
import 'package:findme/views/register.dart';
import 'package:findme/views/login.dart';



class Authenticate extends StatefulWidget{
  @override
  _AuthenticateState createState() => _AuthenticateState();

  }

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }


@override
Widget build(BuildContext context){
  if (showSignIn) {
    return LoginPage(toggleView:  toggleView);
  } else {
    return RegisterPage(toggleView:  toggleView);
  }




}
}