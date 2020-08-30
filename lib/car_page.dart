import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'main.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

DateTime selectedDate;

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff131132),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
            child: Center(
                child: Image.asset('assets/images/Taxi-Cab-Download-PNG.png')),
          )),
          Divider(
            thickness: 2,
            color: Colors.white,
            indent: 50,
            endIndent: 50,
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Want to share cab ?",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //MyButton(50, "from", 100, 20),
                      ToAndFrom('From'),
                      ToAndFrom('To'),
                    ],
                  ),
                  DateTimePicker(50, "Date Time Picker", 280, 20),
                  MyButton(50, "Search", 600, 30),
                ],
              ),
            ),
            flex: 1,
          ),
          Divider(
            thickness: 2,
            color: Colors.white,
            indent: 50,
            endIndent: 50,
          ),
          Text(
            "Available Drivers",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 20),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                MyCard("DRIVER'S NAME"),
                MyCard("PHONE NUMBER"),
                MyCard("PHONE NUMBER"),
                MyCard("PHONE NUMBER"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class DateTimePicker extends StatefulWidget {
  DateTimePicker(this.height, this.txt, this.width, this.FontSize);
  double FontSize;
  String txt;
  double height;
  double width;
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime.now(),
            maxTime: DateTime(2030, 10, 7),
            theme: DatePickerTheme(
                backgroundColor: Color(0xff1D1D3E),
                cancelStyle: TextStyle(
                  color: Colors.blue,
                ),
                itemStyle: TextStyle(color: Colors.white)),
            onChanged: (date) {}, onConfirm: (date) {
              DatePicker.showTime12hPicker(context,
                  showTitleActions: true,
                  onChanged: (date) {},
                  theme: DatePickerTheme(
                      backgroundColor: Color(0xff1D1D3E),
                      cancelStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      itemStyle: TextStyle(color: Colors.white)),
                  onConfirm: (date) {
                    selectedDate = date;
                    print(selectedDate);
                  }, currentTime: DateTime.now());
            }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
              widget.txt,
              style: TextStyle(
                  color: Colors.white, letterSpacing: 1, fontSize: widget.FontSize),
            )),
      ),

    );
  }
}

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  @override
  MyButton(this.height, this.txt, this.width, this.FontSize);


  double FontSize;
  String txt;
  double height;
  double width;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          widget.txt,
          style: TextStyle(
              color: Colors.white, letterSpacing: 1, fontSize: widget.FontSize),
        )),
      ),
    );
  }
}
class ToAndFrom extends StatefulWidget {
  ToAndFrom(this.dropdownValue);
  String dropdownValue;
  @override
  _ToAndFromState createState() => _ToAndFromState();
}

class _ToAndFromState extends State<ToAndFrom> {
  Widget build(BuildContext context) {

    return DropdownButton<String>(
      dropdownColor: Colors.pink,
      value: widget.dropdownValue,
      elevation: 16,
      style: TextStyle(color: Colors.white,fontSize: 20),
      underline: Container(
        height: 4,
        width: 100,
        color: Colors.pinkAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
      items: <String>['Manipal', 'Manglore', 'Udupi','From','To']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}




// ignore: must_be_immutable
class MyCard extends StatefulWidget {
  @override
  MyCard(this.txt);

  String txt;

  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(25.0),
      color: Color(0xff1D1D3E),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 50.0,
              color: Colors.pink,
            ),
            title: Text(
              "DRIVER'S NAME",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text("PHONE NUMBER",
                style: TextStyle(
                    color: Colors.white, fontStyle: FontStyle.italic)),
          ),
        ],
      ),
    );
  }
}
