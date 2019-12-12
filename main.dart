import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing2/screens/home_screen.dart';
import 'package:testing2/screens/login_screen.dart';
import 'package:testing2/screens/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xplorer', 
      debugShowCheckedModeBanner: false,
      home: _getScreenId(),
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.transparent,
      ),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      }
    );
  }
}