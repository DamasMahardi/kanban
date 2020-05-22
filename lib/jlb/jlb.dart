import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:kanban/PlanKanban.dart';


class Jlb extends StatefulWidget {
  @override
  _JlbState createState() => new _JlbState();
}

class _JlbState extends State<Jlb> {
  String code="";
  String getcode="";


  Future scanbarcode()async{
    getcode=await FlutterBarcodeScanner.scanBarcode("#009922", "Cancel", false,ScanMode.DEFAULT);
setState(() {
  code=getcode;
});
    
   
  }



TextEditingController controllerIdmaterial = new TextEditingController();
TextEditingController controllerStatus = new TextEditingController();
TextEditingController controllerStock = new TextEditingController();

void addData(){
  var url="http://10.0.2.2/kanban/adddatajlb.php";

  http.post(url, body: {
    "material_idmaterial": controllerIdmaterial.text,
    "status": controllerStatus.text,
  
    "stock": controllerStock.text
  });
}



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
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
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.of(context).push(new MaterialPageRoute
                    ( builder: (BuildContext context)=> new Home(),
                    )
                    );
                  },
                ),
                FlatButton(
              child: Text("Scan  ",style: TextStyle(fontSize: 20,color: Colors.white),),
              color: Colors.blue,
              onPressed: (){scanbarcode().then((String)=> setState((){
                controllerIdmaterial.text= code;
              }
              
              ));},
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
