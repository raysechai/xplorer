import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testing2/models/destination_model.dart';
import 'package:testing2/services/database_service.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
 
class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot> _destination;
  final Trip trip;
  NewTripDateView({Key key, @required this.trip}) : super(key: key);
  
  _buildDestinationTile(Destination destination) {
    return ListTile(
      title: Text(destination.location_name),
      onTap: () => _showFilter(context),
    );
  }

  _showFilter(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Start Date: ${DateFormat('MM/dd/yyyy').format(_startDate).toString()}'),

                ],
              )
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            border: InputBorder.none,
            hintText: 'Search by destination',
            prefixIcon: Icon(
              Icons.search,
              size: 30.0,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
              ),
              onPressed: () => _showFilter(context),
            ),
            filled: true,
          ),
          onSubmitted: (input) {
            setState(() {
            });
          },
        ),
      ),
      /*body: FutureBuilder(
        future: _destination, 
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data.documents.length == 0) {
            return Center(
              child: Text('No destination'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = Destination.fromDoc(snapshot.data.documents[index]);
              return _buildDestinationTile(destination);
            },
          );
        },
      ),*/
    );
  }
}
