import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kanban/sidewall/papansidewall.dart';
import 'package:kanban/sidewall/sidewall.dart';
import 'package:kanban/sidewall/sidewalledit.dart';
import 'AdminPage.dart';
import 'MemberPage.dart';
import 'PlanKanban.dart';
import 'package:kanban/sidewall/plansidewall.dart';


void main() => runApp(new MyApp());
String username ='';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Login System',
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/AdminPage':(BuildContext context)=> new AdminPage(username: username,),
        '/MemberPage':(BuildContext context)=> new MemberPage(),
        '/MyHomePage':(BuildContext context)=> new MyHomePage(),
        '/PlanKanban':(BuildContext context )=> new Home(),
        '/PlanSidewall':(BuildContext context)=> PlanSidewall(),
        '/sidewall':(BuildContext context)=> Sidewall(),
        'papansidewall':(BuildContext context)=> PapanSidewall(),
        'sidewalledit':(BuildContext context)=> Sidewalledit(),
      },
      
    );
  
  }

}


  

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  TextEditingController user= new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String  msg= '';

Future<List> _login() async {
final response = await http.post("http://10.0.2.2/kanban/login.php",body: {
  'username' : user.text,
  'password'  : pass.text,
 });
 var datauser = json.decode(response.body);
 if(datauser.length == 0){
   setState(() {
     msg="Login Failed";
   });
 }else{
   if(datauser[0]['level']=='admin'){
     Navigator.pushReplacementNamed(context, '/AdminPage');
         print("Welcome admin");
   }else if(datauser[0]['level']=='member'){
     Navigator.pushReplacementNamed(context, '/MemberPage');
   }
   setState(() {
     username =datauser[0]['username'];
   });
 }
 return datauser;
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),
      ),
        body: Center(
          child: Padding(
          padding: EdgeInsets.only(left: 20.0,right: 20.0),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: user, 
                           
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: 'Username'
                ),           
                ),
                
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
          
              Text("Password",style: TextStyle(fontSize: 18.0),),
              TextField(  
                 controller: pass,
                obscureText: true,                
                 decoration: InputDecoration(
                   icon: Icon(Icons.lock),
                  hintText: 'Password'
                ),                
                ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
              ),
              RaisedButton(
                
              color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Login", style: TextStyle(fontSize: 20.00),)
                  
                ],
                ),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.00)
              ),
                onPressed: (){
                 _login();
                },
              ),

              Text(msg, style: TextStyle(fontSize: 20, color: Colors.red),)

            ],
          ),
        ),
      ),
    );
}

}