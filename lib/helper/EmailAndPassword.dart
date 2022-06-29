import 'package:firebase_auth/firebase_auth.dart' as auth;
class EmailAndPassword{
  //create
  Future<auth.User?> signUp(String email,String password) async{
    try{
      auth.UserCredential userCredential = await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }on auth.FirebaseAuthException catch(e){
      print("signUp: FirebaseAuthException e.code = ${e.code}");
      if(e.code == "weak-password"){
        print("the password provided is to weak");
      }else if(e.code == "email-already in use"){
        print("The account already for that email");
      }
    }catch(e){
      print(e);
    }finally{
      return null;
    }
  }
  //signIn
  Future<auth.User?> signIn(String email,String password) async{
    try{
      auth.UserCredential userCredential = await auth.FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }on auth.FirebaseAuthException catch(e){
      print("login: FirebaseAuthException e.code = ${e.code}");
      if(e.code == "user not found"){
        print("No user found for that email");
      }else if(e.code == "wrong password"){
        print("Wrong password provided for that user.");
      }
    }
    return null;
  }
}