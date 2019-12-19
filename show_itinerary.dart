import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class ShowItinerary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget child;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        length: 3,
        indicatorColor: Colors.black,
        indicatorSelectorColor: Colors.grey,
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, position) {
            switch (position) {
              case 0:
                {
                  child = _buildItinerary('DAY 1');
                }
                break;
              case 1:
                {
                  child = _buildItinerary('DAY 2');
                }
                break;
              case 2:
                {
                  child = _buildItinerary('DAY 3');
                }
                break;
            }
            return new Container(child: child);
          },
        ),
      ),
      persistentFooterButtons: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('Start Journey!'),
              color: Colors.grey,
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Customize Itinerary'),
              color: Colors.grey,
              textColor: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildItinerary(String day) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            day,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                ),
                _left(Icons.directions_walk),
                _left(Icons.directions_bus),
                _left(Icons.directions_car),
              ],
            ),
            Column(
              children: <Widget>[
                _right('George Town', 'Penang'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '8 mins by walking',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
                _right('George Town', 'Penang'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '8 mins by walking',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
                _right('George Town', 'Penang'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '8 mins by walking',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
                _right('George Town', 'Penang'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _left(IconData icon) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 50.0,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
          child: Container(
            height: 140.0,
            width: 2.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _right(String name, String place) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20.0), boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(
            0.0,
            2.0,
          ),
          blurRadius: 6.0,
        )
      ]),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              'https://www.penang-insider.com/livingpenang/wp-content/uploads/2017/04/DSCF5563.jpg',
              height: 160.0,
              width: 260.0,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'George Town',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 10.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Penang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
