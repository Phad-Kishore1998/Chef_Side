import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var fsconnect = FirebaseFirestore.instance;

  myget() async {
    var d = await fsconnect.collection("Products").get();
    // print(d.docs[0].data());

    for (var i in d.docs) {
      print(i.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(
                "Kitchen",
              style: GoogleFonts.pacifico(fontSize: 38.0,),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              //one container
              /*
              Container(
                alignment: Alignment.center,
                color: Colors.amber[400],
                width: 330.0,
                height: 30.0,
                child: Column(
                  children: [
                    Text(
                        "Table No. 1",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),*/

              Container(
                alignment: Alignment.center,
                color: Colors.amber[400],
                width: 330.0,
                height: 70.0,
                child: Column(
                  children: [
                    Text(
                      "Table No. 1",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      //padding: EdgeInsetsGeometry(5.0),
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Status : ",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          ToggleSwitch(
                            minWidth: 95.0,
                            cornerRadius: 20.0,
                            activeBgColors: [[Colors.blue[800]], [Colors.green[800]]],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['Progressing', 'Ready'],
                            radiusStyle: true,
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),




              Container(
                color: Colors.amber[600],
                width: 330.0,
                height: 150.0,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("categoryicon").snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.data == null) return CircularProgressIndicator();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        DocumentSnapshot product = snapshot.data.documents[index];
                        return ListTile(
                          leading: Text(product['name']),
                          //title: Text(product['desc']),
                        );
                        },
                    );
                    },
                ),
              ),
              //two contianer
              /*Container(
                alignment: Alignment.center,
                color: Colors.amber[400],
                width: 330.0,
                height: 30.0,
                child: Text(
                  "Table No. 2",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),*/



              Container(
                alignment: Alignment.center,
                color: Colors.amber[400],
                width: 330.0,
                height: 70.0,
                child: Column(
                  children: [
                    Text(
                      "Table No. 2",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      //padding: EdgeInsetsGeometry(5.0),
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Status : ",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          ToggleSwitch(
                            minWidth: 95.0,
                            cornerRadius: 20.0,
                            activeBgColors: [[Colors.blue[800]], [Colors.green[800]]],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['Progressing', 'Ready'],
                            radiusStyle: true,
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),




              Container(
                color: Colors.amber[200],
                width: 330.0,
                height: 150.0,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("Products").snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.data == null) return CircularProgressIndicator();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        DocumentSnapshot product = snapshot.data.documents[index];
                        return ListTile(
                          leading: Text(product['name']),
                          //title: Text(product['desc']),
                        );
                        },
                    );
                    },
                ),
              ),
              //container 3
              //Text("Name"),

              Container(
                alignment: Alignment.center,
                color: Colors.amber[400],
                width: 330.0,
                height: 70.0,
                child: Column(
                  children: [
                    Text(
                        "Table No. 3",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      //padding: EdgeInsetsGeometry(5.0),
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Status : ",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          ToggleSwitch(
                            minWidth: 95.0,
                            cornerRadius: 20.0,
                            activeBgColors: [[Colors.blue[800]], [Colors.green[800]]],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['Progressing', 'Ready'],
                            radiusStyle: true,
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                            /*
                            minWidth: 50.0,
                            minHeight: 30.0,
                            fontSize: 16.0,
                            initialLabelIndex: 1,
                            activeBgColor: [Colors.green],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.grey[900],
                            totalSwitches: 3,
                            labels: ['Tall', 'Grande', 'Venti'],
                            onToggle: (index) {
                              print('switched to: $index');
                            },*/
                          ),
                        ],
                      ),
                    ),
                    /*ToggleButtons(
                      children: <Widget>[
                        Icon(Icons.ac_unit),
                        Icon(Icons.call),
                        Icon(Icons.cake),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                            if (buttonIndex == index) {
                              isSelected[buttonIndex] = !isSelected[buttonIndex];
                            } else {
                              isSelected[buttonIndex] = false;
                            }
                          }
                        });
                      },
                      isSelected: isSelected,
                    ),*/
                  ],
                ),
              ),
              Container(
                color: Colors.amber[600],
                width: 330.0,
                height: 150.0,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("kitchen").snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.data == null) return CircularProgressIndicator();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        DocumentSnapshot product = snapshot.data.documents[index];
                        return ListTile(
                          leading: Text(product['name']),
                          //title: Text(product['desc']),
                        );
                        },
                    );
                    },
                ),
              ),
              //Empty container for scrolling entire list
              Container(
                alignment: Alignment.center,
                color: Colors.black,
                width: 600.0,
                height: 70.0,
                child: Text(
                  'Collect your order when "Ready"...',
                  style:
                  /*GoogleFonts.lato(
                    fontSize: 22.0,
                    color: Colors.white,),*/
                  TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                  //GoogleFonts.lato(),

                ),
              )
            ]
            ),
          )
      ),
    );
  }
}

/* 
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  var fsconnect = FirebaseFirestore.instance;
  myget() async {
    var d = await fsconnect.collection("Products").get();
    // print(d.docs[0].data());
    for (var i in d.docs) {
      print(i.data());
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Firebase Firestore App'),
      ),
      body: 
      ListView(
          children: <Widget>[ 
        Column(
        children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("Products").snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.data == null) return CircularProgressIndicator();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        DocumentSnapshot product = snapshot.data.documents[index];
                        return ListTile(
                          leading: Text(product['name']),
                          //title: Text(product['desc']),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("categoryicon").snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.data == null) return CircularProgressIndicator();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        DocumentSnapshot product = snapshot.data.documents[index];
                        return ListTile(
                          leading: Text(product['name']),
                          //title: Text(product['desc']),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ] 
        )
          ]
        ),
      )
   // )
    );
  }
}
*/
