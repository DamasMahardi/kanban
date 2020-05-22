import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:kanban/PlanKanban.dart';

class Beltsatuedit extends StatefulWidget {

  final List list;
  final int index;
  Beltsatuedit({this.list,this.index});
  @override
  _BeltsatueditState createState() => new _BeltsatueditState();
}

class _BeltsatueditState extends State<Beltsatuedit> {


TextEditingController controllerIdmaterial ;
TextEditingController controllerStatus ;
TextEditingController controllerStock ;

void editData(){
  var url="http://10.0.2.2/kanban/editdatabelt.php";

  http.post(url, body: {
    "idbelt": widget.list[widget.index]['idbelt'],
    "material_idmaterial": controllerIdmaterial.text,
    "status": controllerStatus.text,
    "stock": controllerStock.text,
  });
}

@override
  void initState() {
    controllerIdmaterial= new TextEditingController(text: widget.list[widget.index]['material_idmaterial'] );
      controllerStatus= new TextEditingController(text: widget.list[widget.index]['status'] );
      controllerStock= new TextEditingController(text: widget.list[widget.index]['stock'] );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerIdmaterial,
                  decoration: new InputDecoration(
                      hintText: "Item Idmaterial", labelText: "Code Material"),
                ),
                new TextField(
                  controller: controllerStatus,
                  decoration: new InputDecoration(
                      hintText: "Item Status", labelText: "Status"),
                ),
                
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute
                    ( builder: (BuildContext context)=> new Home(),
                    )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

