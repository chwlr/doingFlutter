import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_one/pages/sign_in/bloc/signin_blocs.dart';
import 'package:flutter_learning_one/pages/sign_in/sign_in.dart';
import 'package:flutter_learning_one/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_learning_one/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc()
        ),
        BlocProvider(create: (context)=>SignInBloc())
      ],
      child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white
              )
            ),
            home: const Welcome(),
            routes: {
              "myHomePage": (context) => const MyHomePage(),
              "signIn": (context) => const SignIn()
            },
          )),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("flutter Demo Home Page"),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}

