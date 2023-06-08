import 'package:app/Dashboard.dart';
import 'package:app/ForgotPasswordPage.dart';
import 'package:app/SignUp.dart';
import 'package:app/components/BottomNavigationBar.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Login.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}


void signUserIn() {}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Bebspay',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        
        primaryColor: Color(0xFF2D0051),
        fontFamily: 'Opensans',
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xff979797),
          )
        )
      ),
      
      home: MyHomePage(
        title: "Bebspay",
      ),
    );
  }
}

