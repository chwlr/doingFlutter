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
          //todo
        }
        if(password.isEmpty){
          //todo
        }
        try{
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          if(credential.user==null){
            //todo
          }
          if(!credential.user!.emailVerified){
            //todo
          }

          var user = credential.user;
          if(user!=null){
            //we got verified user from firebase
          }else{
            //we have error getting user from firebase
          }
        }catch(e){
          //
        }
      }
    }catch(e){
      //todo
    }
  }
}