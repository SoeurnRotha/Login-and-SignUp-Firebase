import 'package:email_and_password/Page/Login.dart';
import 'package:email_and_password/Page/homePage.dart';
import 'package:email_and_password/helper/EmailAndPassword.dart';
import 'package:email_and_password/helper/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  EmailAndPassword _emailAndPassword = EmailAndPassword();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  get _buildBody{
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue,Colors.red,Colors.purple]
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,color: Colors.white),),
              SizedBox(height: 10,),
              _buildEmail,
              SizedBox(height: 10,),
              _buildPassword,
              SizedBox(height: 10,),
              _buildAlreadyAccount,
              SizedBox(height: 10,),
              _boxSignInAccount
            ],
        ),
      ),
    );
  }
  get _buildEmail{
    return TextField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email",
          hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),

    );
  }
  get _buildPassword{
    return TextField(
      controller: _password,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,

      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
      ),

    );
  }
  get _buildAlreadyAccount{
    return ElevatedButton(
      onPressed: ()async{
        auth.User ? user = await _emailAndPassword.signUp(_email.text.toLowerCase().trim(), _password.text);
        if(user == null){
          showSnackBar(context, "Sign Up false");
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
        }
      },
      child: Text("Sign Up",style: TextStyle(color: Colors.black,fontSize: 18),),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(150, 60),
        primary: Colors.white
      ),
    );
  }
  get _boxSignInAccount{
    return TextButton.icon(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
      },
      label: Text("Already account",style: TextStyle(color: Colors.white,fontSize: 16),),
      icon: Icon(Icons.account_circle,color: Colors.white,),
    );
  }
}
