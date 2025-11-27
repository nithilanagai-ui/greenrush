import 'package:flutter/material.dart';
import 'login_page.dart';

class Welcomepage extends StatefulWidget {     //first page

  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => WelcomepageState();
}

class WelcomepageState extends State<Welcomepage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
    });
  }
@override
  Widget build(BuildContext context){
  return Scaffold(

      body:Center(child:Image.asset("assets/images/Logo.jpg"),


      ),

    );
  }
}
