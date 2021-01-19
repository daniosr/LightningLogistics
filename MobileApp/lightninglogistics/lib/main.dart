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

  var txt = TextEditingController();

  void ScanBarcode() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", "cancel", false, ScanMode.DEFAULT)
        .then((barcode) => txt.text = barcode);
  }

  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lightning Logistics"),
        backgroundColor: Color(0xFFFF0000),
        bottomOpacity: 0.8,
        centerTitle: true,
      ),
      body: Center(
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
                          onEditingComplete: () => node.nextFocus(),
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
                          onSaved: (String value) {
                            BTWD = value;
                          },
                          validator: (String value) {
                            return value.isEmpty
                                ? 'This cannot be left empty'
                                : null;
                          }),
                      Container(height: 20),
                      TextFormField(
                          onEditingComplete: () => node.nextFocus(),
                          decoration: const InputDecoration(
                            labelText: 'Sales Order Reference*',
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (String value) {
                            SalesOrderReference = value;
                          },
                          validator: (String value) {
                            return value.length != 8
                                ? '8 digits are required'
                                : null;
                          }),
                      Container(height: 20),
                      TextFormField(
                        onEditingComplete: () => node.nextFocus(),
                        decoration: const InputDecoration(
                          labelText: 'End*',
                        ),
                        onSaved: (String value) {
                          End = value;
                        },
                        validator: (String value) {
                          return value.length != 1
                              ? 'Name must be only one characters'
                              : null;
                        },
                      ),
                      Container(height: 20),
                      TextFormField(
                        onEditingComplete: () => node.nextFocus(),
                        decoration: const InputDecoration(
                          labelText: 'Weight*',
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (String value) {
                          Weight = value;
                        },
                        validator: (String value) {
                          return value.isEmpty
                              ? 'This cannot be left empty'
                              : null;
                        },
                      ),
                      Container(height: 20),
                      TextFormField(
                        onEditingComplete: () => node.nextFocus(),
                        decoration: const InputDecoration(
                          labelText: 'Location*',
                        ),
                        onSaved: (String value) {
                          Location = value;
                        },
                        validator: (String value) {
                          return value.isEmpty
                              ? 'This cannot be left empty'
                              : null;
                        },
                      ),
                      Container(height: 20),
                      TextFormField(
                        onEditingComplete: () => node.nextFocus(),
                        decoration: const InputDecoration(
                          labelText: 'Sub-Location',
                        ),
                        onSaved: (String value) {
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
                        onPressed: () {
                          //if all validators return true
                          if (_formKeyBTWD.currentState.validate()) {
                            //submit to database
                            Future<http.Response> createAlbum(String title) {
                              return http.post(
                                'http://135.181.25.227/api/item',
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                },
                              );
                            }
                          }
                        },
                        child: Text('Submit'),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
