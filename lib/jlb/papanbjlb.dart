import 'package:flutter/material.dart';
import 'package:kanban/beltsatu/beltsatuedit.dart';
import 'package:kanban/jlb/jlbedit.dart';

import 'jlb.dart';

class Papanjlb extends StatefulWidget {
  final List list;
  final int index;
  Papanjlb({this.list, this.index});
  @override
  _PapanjlbState createState() => new _PapanjlbState();
}

class _PapanjlbState extends State<Papanjlb> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title:
              new Text("${widget.list[widget.index]['material_idmaterial']}")),
      body: new Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                new Text(
                  widget.list[widget.index]['material_idmaterial'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "status: ${widget.list[widget.index]['status']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "stock: ${widget.list[widget.index]['stock']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Jlbedit(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    new RaisedButton(
                      child: new Text("Add"),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => Jlb(),
                        ));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
