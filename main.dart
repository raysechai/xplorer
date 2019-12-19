import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing2/screens/home_screen.dart';
import 'package:testing2/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Widget _getScreenId() {
  //   return StreamBuilder<FirebaseUser>(
  //     stream: FirebaseAuth.instance.onAuthStateChanged,
  //     builder: (BuildContext context, snapshot) {
  //       if(snapshot.hasData) {
  //         return HomeScreen();
  //       } else {
  //         return LoginScreen();
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Xplorer',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.blueAccent,
            scaffoldBackgroundColor: Colors.white,
            canvasColor: Colors.transparent,
          ),
          //home: auth.isAuth ? HomeScreen() : LoginScreen(),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
