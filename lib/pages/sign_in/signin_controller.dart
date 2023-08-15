import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_one/pages/sign_in/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try{
      if(type=="email"){
        //BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if(email.isEmpty){
          print("email is empty");
        }else{
          print("email is $email");
        }
        if(password.isEmpty){
          print("password is empty");
        }
        try{
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          if(credential.user==null){
            print("user does not exist");
          }
          if(!credential.user!.emailVerified){
            print("user does not verified");
          }

          var user = credential.user;
          if(user!=null){
            print("user exist");
            //we got verified user from firebase
          }else{
            print("not found user");
            //we have error getting user from firebase
          }
        } on FirebaseAuthException catch(e){
          if(e.code == 'user-not-found'){
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            print('The email address is badly formatted.');
          }
        }
      }
    }catch(e){
      print(e.toString());
    }
  }
}