import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_one/pages/sign_in/bloc/signin_events.dart';
import 'package:flutter_learning_one/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc():super(const SignInState()){
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    print("event email -> ${event.email}");
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    print("event password -> ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}