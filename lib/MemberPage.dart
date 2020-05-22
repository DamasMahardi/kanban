import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  DateTime date2;
  String group = "";
  var _nama = ['A', 'B', 'C', 'D'];
  var _sip = ['1', '2', '3'];
  var _currentItemSelected = 'A';
  var _currentItemSelected2 = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        
        title: Container(
          alignment: Alignment.center,
          child: Text("Menu Utama Sistem kanban",style: TextStyle(color: Colors.white),),
        ),
        
      ),
      body: Column(
        children: <Widget>[
          Image.asset('asset/image/hankook.png'),
          
          Text(
            'Pilih Rencana Produksi',
            style: TextStyle(fontSize: 30.0),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.0),
          ),
          Row(
            
            children: <Widget>[
              Padding(
            padding: EdgeInsets.only(left: 30.0),
          ),
              Text("Pilih Group "),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
              ),
              DropdownButton<String>(
                iconEnabledColor: Colors.blue,
                items: _nama.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  // Your code to execute, when a menu item is selected from drop down
                  _onDropDownItemSelected(newValueSelected);
                },
                value: _currentItemSelected,
              ),
              Padding(
                padding: EdgeInsets.only(right: 130.0),
              ),
              Text("Pilih Sip "),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
              ),
              DropdownButton<String>(
                iconEnabledColor: Colors.blue,
                items: _sip.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  // Your code to execute, when a menu item is selected from drop down
                  _onDropDownItemSelected2(newValueSelected);
                },
                value: _currentItemSelected2,
              ),
              
            ],
          ),
          Center(
            
            child: DateTimePickerFormField(
            
                  inputType: InputType.date,
                  format: DateFormat("yyyy-MM-dd"),
                  
                  decoration: InputDecoration(
                      labelText: 'Date', hasFloatingPlaceholder: false),
                  onChanged: (dt) {
                    setState(() => date2 = dt);
                    print('Selected date: $date2');
                  },
                ),
          ),
              Padding(
            padding: EdgeInsets.only(bottom: 30.0),
          ),
          
          RaisedButton(
            
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/PlanKanban');
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.00)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Masuk Sistem Kanban", style: TextStyle(fontSize: 20.00),)
                  
                ],
              )
              
            ),
          
          
          Padding(
            padding: EdgeInsets.only(bottom: 30.0),
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text("Log Out"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MyHomePage');
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.00)
              ),
          ),
        ],
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  void _onDropDownItemSelected2(String newValueSelected) {
    setState(() {
      this._currentItemSelected2 = newValueSelected;
    });
  }
}
