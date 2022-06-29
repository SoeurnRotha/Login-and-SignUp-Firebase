import 'package:email_and_password/Page/SignUp.dart';
import 'package:email_and_password/Page/homePage.dart';
import 'package:email_and_password/helper/EmailAndPassword.dart';
import 'package:email_and_password/helper/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

EmailAndPassword _emailAndPassword = EmailAndPassword();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }
  get _buildBody{
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.purpleAccent,Colors.blue]
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign In",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white,decoration: TextDecoration.underline),),
            SizedBox(height: 10,),
            _buildEmail,
            SizedBox(height: 10,),
            _buildPassword,
            SizedBox(height: 10,),
            _boxSignIn,
            SizedBox(height: 10,),
            _boxSignUpAccount
          ],
        ),
      ),
    );
  }
  get _buildEmail{
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _email,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
  get _buildPassword{
    return TextField(
      obscureText: true,
      controller: _password,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.vpn_key),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }

  get _boxSignIn{
    return ElevatedButton(
      onPressed: () async{
        auth.User ? user = await _emailAndPassword.signIn(_email.text.trim(),_password.text);
        if(user == null){
          showSnackBar(context, "login false");
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      child: Text("Sgin In",style: TextStyle(color: Colors.white,fontSize: 18),),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(150, 60),
        primary: Colors.orange
      ),
    );
  }
  get _boxSignUpAccount{
    return TextButton.icon(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
      },
      label: Text("Create a new account",style: TextStyle(fontSize: 16,color: Colors.white),),
      icon: Icon(Icons.account_circle,color: Colors.white,),
    );
  }
}
