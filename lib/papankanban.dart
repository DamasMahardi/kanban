import 'package:flutter/material.dart';
import 'package:kanban/bead/planbead.dart';

import 'package:kanban/beltsatu/planbeltsatu.dart' ;
import 'package:kanban/jlb/planjlb.dart';
import 'package:kanban/carcassdua/plancarcassdua.dart';
import 'package:kanban/carcasssatu/plancarcasssatu.dart';
import 'package:kanban/innerliner/planinnerliner.dart';
import 'package:kanban/beltdua/planbeltdua.dart';
import 'package:kanban/sidewall/plansidewall.dart';
import 'package:kanban/tread/plantread.dart';
class PapanKanban extends StatefulWidget {
  final List list;
  final int index;
  PapanKanban({this.list, this.index});
  @override
  _PapanKanbanState createState() => _PapanKanbanState();
}

class _PapanKanbanState extends State<PapanKanban> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("BOARD KANBAN ELEKTRIK")),
      body: new Container(
        height: 800.00,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                new Text(
                  widget.list[widget.index]['spectire_idspectire'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "jumlah: ${widget.list[widget.index]['jumlah']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "seqwen: ${widget.list[widget.index]['seqwen']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                    ),
                    
                    SizedBox(
                    
                      width: 100.00,
                      height: 100.00,
                      
                      child: new RaisedButton(
                          child: new Text(
                          widget.list[widget.index]['sidewall'],
                          style: new TextStyle(fontSize: 20.0),
                        ),
                     
                        color: Colors.red,
                        
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new PlanSidewall(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                    ),
                    SizedBox(
                      width: 100.00,
                      height: 100.00,
                      child: new RaisedButton(
                        child: new Text(
                  "${widget.list[widget.index]['innerliner']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                        color: Colors.yellow,
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Planinnerliner(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                    ),
                    SizedBox(
                      width: 100.00,
                      height: 100.00,
                      child: new RaisedButton(
                        child: new Text(
                  "${widget.list[widget.index]['carcass1']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                        color: Colors.green,
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Plancarcasssatu(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                    ),
                    SizedBox(
                      width: 100.00,
                      height: 100.00,
                      child: new RaisedButton(
                        child: new Text(
                  "${widget.list[widget.index]['carcass2']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                        color: Colors.green,
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Plancarcassdua(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                    ),
                    SizedBox(
                      width: 100.00,
                      height: 100.00,
                      child: new RaisedButton(
                        child: new Text(
                  "${widget.list[widget.index]['belt1']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                        color: Colors.green,
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Planbeltsatu(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                    ),
                    SizedBox(
                      width: 100.00,
                      height: 100.00,
                      child: new RaisedButton(
                        child: new Text(
                  "${widget.list[widget.index]['belt2']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                        color: Colors.green,
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Planbeltdua(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                    ),
                    SizedBox(
                      width: 100.00,
                      height: 100.00,
                      child: new RaisedButton(
                        child: new Text(
                  "${widget.list[widget.index]['jlb']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                        color: Colors.blue,
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Planjlb(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                    ),
                    SizedBox(
                      width: 100.00,
                      height: 100.00,
                      child: new RaisedButton(
                        child: new Text(
                  "${widget.list[widget.index]['tread']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                        color: Colors.red,
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Plantread(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                    ),
                    SizedBox(
                      width: 100.00,
                      height: 100.00,
                      child: new RaisedButton(
                        child: new Text(
                  "${widget.list[widget.index]['bead']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                        color: Colors.pink,
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Planbead(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    
                  ],
                ),
                Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text("                          Menu Utama Sistem                         "),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/PlanKanban');
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.00)
              ),
          ),
                       ],
                     ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
