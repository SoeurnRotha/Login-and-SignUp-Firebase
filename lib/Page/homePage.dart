import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }
  get _buildAppbar =>AppBar(
    backgroundColor: Colors.purpleAccent,
    title: Text("Home"),
  );
  get _buildBody{
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Text("SignOut"),
        onPressed: (){
          FirebaseAuth.instance.signOut();
        },
      ),
    );
  }
}
