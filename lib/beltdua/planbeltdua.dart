import 'dart:convert';

import 'package:flutter/material.dart';

import 'papanbeltdua.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(new MaterialApp(
    title: "My Store",
    home: new Planbeltdua(),
  ));
}

class Planbeltdua extends StatefulWidget {
  final List list;
  final int index;
  Planbeltdua({this.list, this.index});
  @override
  _PlanbeltduaState createState() => new _PlanbeltduaState();
}

class _PlanbeltduaState extends State<Planbeltdua> {
  Future<List> getData() async {
    final response = await http.get("http://10.0.2.2/kanbanm2/index.php/belt");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Belt Dua"),
      ),
      
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Papanbeltsatu(list:list , index: i,)
              )
            ),
            child: new Card(

              child: new ListTile(
                title: new Text(list[i]['material_idmaterial']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Stock : ${list[i]['stock']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
