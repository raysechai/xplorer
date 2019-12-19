import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:testing2/screens/show_itinerary.dart';

class SettingFilter extends StatefulWidget {
  @override
  _SettingFilterState createState() => _SettingFilterState();
}

class _SettingFilterState extends State<SettingFilter> {
  final List<String> days = ['1', '2', '3'];

  String _date = ' Select start date';
  String _time = ' Select start time';
  String _days;
  int _budget;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 4,
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  theme: DatePickerTheme(
                    containerHeight: 210.0,
                  ),
                  showTitleActions: true,
                  minTime: DateTime(DateTime.now().year - 10),
                  maxTime: DateTime(DateTime.now().year + 10),
                  onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.day} - ${date.month} - ${date.year}';
                    setState(() {});
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.date_range,
                                size: 18.0,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                '$_date',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 4.0,
              onPressed: () {
                DatePicker.showTimePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true, onConfirm: (time) {
                  print('confirm $time');
                  _time = '${time.hour} : ${time.minute}';
                  setState(() {});
                }, currentTime: DateTime.now(), locale: LocaleType.en);
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 18.0,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                " $_time",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Change',
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('How many days: '),
                      DropdownButton(
                        value: _days ?? '1',
                        items: days.map((day) {
                          return DropdownMenuItem(
                            value: day,
                            child: Text('$day days'),
                          );
                        }).toList(),
                        onChanged: (value) => setState(() => _days = value),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Budget '),
                Slider(
                  value: (_budget ?? 0).toDouble(),
                  min: 0,
                  max: 1,
                  onChanged: (value) => setState(() => _budget = value.round()),
                ),
                Text('Luxury'),
              ],
            ),
            RaisedButton(
              child: Text('Start Planning!'),
              onPressed: () async {
                print(_date);
                print(_time);
                print(_days);
                print(_budget);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowItinerary()));
              },
            ),
          ],
        ),
      )),
    );
  }
}
