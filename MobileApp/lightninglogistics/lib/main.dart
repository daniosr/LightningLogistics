import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKeyBTWD = GlobalKey<FormState>();
  var BTWD = '';
  var SalesOrderReference = '';
  var End = '';
  var Weight = '';
  var Location = '';
  var SubLocation = '';
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
  var _controller4 = TextEditingController();
  var _controller5 = TextEditingController();
  var _controller6 = TextEditingController();
  List<String> growableList = ['BTWD/Reference'];

  var txt = TextEditingController();

  void ScanBarcode() async {
    await FlutterBarcodeScanner.scanBarcode("#ff6666", "cancel", false, ScanMode.DEFAULT)
      .then((barcode) => txt.text = barcode);
  }
  void ContinuousBarcodeScanner() async {
    await FlutterBarcodeScanner.getBarcodeStreamReceiver("#ff6666", "Cancel", false, ScanMode.DEFAULT)
      .listen((barcode) => growableList.add(barcode));
  }

  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Lightning Logistics"),
              backgroundColor: Color(0xFFFF0000),
              bottomOpacity: 0.8,
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Text('Incoming', style: new TextStyle(fontSize: 18.0)),
                  Text('Outgoing', style: new TextStyle(fontSize: 18.0))
                ],
              )
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: ListView(
                      children: <Widget>[
                        Form(
                          key: _formKeyBTWD,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                  controller: txt,
                                  onEditingComplete: () =>
                                      node.nextFocus(),
                                  decoration: InputDecoration(
                                    icon: IconButton(
                                      icon: Icon(
                                        Icons.camera_alt_rounded,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        ScanBarcode();
                                      },
                                    ),
                                    hintText: 'Scan by clicking camera',
                                    labelText: 'BTWD/Ref*',
                                  ), //Add functionality to icon
                                  onChanged: (String value) {
                                    BTWD = value;
                                  },
                                  validator: (String value) {
                                    return value.isEmpty
                                        ? 'This cannot be left empty'
                                        : null;
                                  }),
                              Container(height: 20),
                              TextFormField(controller: _controller2,
                                  onEditingComplete: () =>
                                      node.nextFocus(),
                                  decoration: const InputDecoration(
                                    labelText: 'Sales Order Reference*',
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (String value) {
                                    SalesOrderReference = value;
                                  },
                                  validator: (String value) {
                                    return value.length != 8
                                        ? '8 digits are required'
                                        : null;
                                  }),
                              Container(height: 20),
                              TextFormField(controller: _controller3,
                                onEditingComplete: () => node.nextFocus(),
                                decoration: const InputDecoration(
                                  labelText: 'End*',
                                ),
                                onChanged: (String value) {
                                  End = value;
                                },
                                validator: (String value) {
                                  return value.length != 1
                                      ? 'Name must be only one characters'
                                      : null;
                                },
                              ),
                              Container(height: 20),
                              TextFormField(controller: _controller4,
                                onEditingComplete: () => node.nextFocus(),
                                decoration: const InputDecoration(
                                  labelText: 'Weight*',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (String value) {
                                  Weight = value;
                                },
                                validator: (String value) {
                                  return value.isEmpty
                                      ? 'This cannot be left empty'
                                      : null;
                                },
                              ),
                              Container(height: 20),
                              TextFormField(controller: _controller5,
                                onEditingComplete: () => node.nextFocus(),
                                decoration: const InputDecoration(
                                  labelText: 'Location*',
                                ),
                                onChanged: (String value) {
                                  Location = value;
                                },
                                validator: (String value) {
                                  return value.isEmpty
                                      ? 'This cannot be left empty'
                                      : null;
                                },
                              ),
                              Container(height: 20),
                              TextFormField(controller: _controller6,
                                onEditingComplete: () => node.nextFocus(),
                                decoration: const InputDecoration(
                                  labelText: 'Sub-Location',
                                ),
                                onChanged: (String value) {
                                  SubLocation = value;
                                },
                                validator: (String value) {
                                  return value.contains('@')
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                              Container(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  //if all validators return true
                                  if (_formKeyBTWD.currentState
                                      .validate()) {
                                    //submit to database
                                    final body = {
                                      'BTWDRef': BTWD,
                                      'SalesOrderReference': SalesOrderReference,
                                      'End': End,
                                      'Weight': Weight,
                                      'Location': Location,
                                      'Sublocation': SubLocation
                                    };
                                    await http
                                    .post(
                                      'http://65.21.3.71/api/item/',
                                      headers: <String, String>{
                                        'Content-Type':
                                        'application/json',
                                        'Host': '65.21.3.71'
                                      },
                                      body: jsonEncode(body))
                                    .then((response) => print(End));
                                  txt.clear();
                                  _controller2.clear();
                                  _controller3.clear();
                                  _controller4.clear();
                                  _controller5.clear();
                                  _controller6.clear();
                                  }
                                },
                                child: Text('Submit'),
                              )
                            ],
                          )
                        )
                    ],
                  ),
                ),
              ),
              ListView(
                children:[
                  IconButton(icon: Icon(Icons.camera_alt_rounded, size: 100), onPressed: () {ContinuousBarcodeScanner();}),
                  Container(height: 30),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: growableList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${growableList[index]}'),
                      );
                    },
                  ),
                ] 
              )
            ]
          )
        )
      )
    );
  }
}
