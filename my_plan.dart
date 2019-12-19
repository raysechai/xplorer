import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing2/screens/explore_screen.dart';
import 'package:testing2/screens/tripped.dart';
import 'package:testing2/services/auth.dart';

class MyPlanScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Plan'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.collections_bookmark),
            onPressed: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tripped()));
            }
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {Provider.of<Auth>(context, listen: false).logout();}
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/notebook.jpg',),
              height: 90.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('No plans... yet !'),
            Text('Explore amazing experiences and plan seamlessly'),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              onPressed: () => ExploreScreen(),
              child: Text('Go to Explore Page'),
            ),
          ],
        ),
      ),
    );
  }
}

