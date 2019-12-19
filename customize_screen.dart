import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class MyTinder extends StatefulWidget {
  @override
  _MyTinderState createState() => _MyTinderState();
}

class _MyTinderState extends State<MyTinder> with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "assets/images/penang-signboard.jpg",
    "assets/images/penang-signboard.jpg",
    "assets/images/penang-signboard.jpg",
    "assets/images/penang-signboard.jpg",
    "assets/images/penang-signboard.jpg",
    "assets/images/penang-signboard.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.
    return new Scaffold(
      body: Card(
        color: Colors.transparent,
        elevation: 4.0,
        child: Center(
          child: Container(
            width: 400,
            height: 450,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(8.0),
            ),
            child: Column(
              children: <Widget>[
                Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: new TinderSwapCard(
                            orientation: AmassOrientation.BOTTOM,
                            totalNum: 6,
                            stackNum: 3,
                            swipeEdge: 4.0,
                            maxWidth: MediaQuery.of(context).size.width * 0.9,
                            maxHeight: MediaQuery.of(context).size.width * 0.9,
                            minWidth: MediaQuery.of(context).size.width * 0.8,
                            minHeight: MediaQuery.of(context).size.width * 0.8,
                            cardBuilder: (context, index) => Card(
                                  child: Image.asset('${welcomeImages[index]}'),
                                ),
                            cardController: controller = CardController(),
                            swipeUpdateCallback:
                                (DragUpdateDetails details, Alignment align) {
                              /// Get swiping card's alignment
                              if (align.x < 0) {
                                //Card is LEFT swiping
                                //dislike

                              } else if (align.x > 0) {
                                //Card is RIGHT swiping
                                //like
                              }
                            },
                            swipeCompleteCallback:
                                (CardSwipeOrientation orientation, int index) {
                              /// Get orientation & index of swiped card!
                            }))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Dislike'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Like'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
