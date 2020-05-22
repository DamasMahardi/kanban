import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:kanban/papankanban.dart';

void main() {
  runApp(new MaterialApp(
    title: "Plan Kanban",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    final response =
        await http.get("http://10.0.2.2/kanban/plankanban1.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Plan Produksi Building"),
      ),
      body:
       
            new FutureBuilder<List>(
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
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new PapanKanban(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['spectire_idspectire']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Seqwen : ${list[i]['seqwen']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
