import 'package:flutter/material.dart';
import 'package:testing2/services/auth_service.dart';

class MyPlanScreen extends StatefulWidget {
  @override
  _MyPlanScreenState createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends State<MyPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('My Plan'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed:() => AuthService.logout(context),
          )
        ],
      ),
      body: Center(
        
      ),
    );
  }
}
