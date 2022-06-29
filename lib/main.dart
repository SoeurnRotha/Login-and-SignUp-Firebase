import 'package:email_and_password/Page/Login.dart';
import 'package:email_and_password/Page/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
void main(){

  runApp(MyFirebase());
}
class MyFirebase extends StatefulWidget {
  const MyFirebase({Key? key}) : super(key: key);

  @override
  State<MyFirebase> createState() => _MyFirebaseState();
}

class _MyFirebaseState extends State<MyFirebase> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _buildStreamBuilder,
      ),
    );
  }
  get _buildStreamBuilder{
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return LoginPage();
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
