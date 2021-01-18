import 'package:flutter/material.dart';

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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
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
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onEditingComplete: () => node.nextFocus(),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.camera_alt_rounded, size: 30),
                      hintText: 'Scan by clicking camera',
                      labelText: 'BTWD/Ref*',
                    ),//Add functionality to icon
                    onSaved: (String value){},
                  ),
                  Container(height: 20),
                  TextFormField(
                    onEditingComplete: () => node.nextFocus(),
                    decoration: const InputDecoration(
                      labelText: 'Sales Order Reference*',
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (String value) {},
                    validator: (String value) {//Validator for length?
                      return value.contains('@')
                          ? 'Do not use the @ char.'
                          : null;
                    },//....................//
                  ),
                  Container(height: 20),
                  TextFormField(
                    onEditingComplete: () => node.nextFocus(),
                    decoration: const InputDecoration(
                      labelText: 'End*',
                    ),
                    onSaved: (String value) {},
                    validator: (value){
                      return value.length != 1?  'Name must be only one characters' : null;
                    },
                  ),
                  Container(height: 20),
                  TextFormField(
                    onEditingComplete: () => node.nextFocus(),
                    decoration: const InputDecoration(
                      labelText: 'Weight*',
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (String value) {},
                    validator: (String value) {
                      return value.contains('@')
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                  Container(height: 20),
                  TextFormField(
                    onEditingComplete: () => node.nextFocus(),
                    decoration: const InputDecoration(
                      labelText: 'Location*',
                    ),
                    onSaved: (String value) {},
                    validator: (String value) {
                      return value.contains('@')
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                  Container(height: 20),
                  TextFormField(
                    onEditingComplete: () => node.nextFocus(),
                    decoration: const InputDecoration(
                      labelText: 'Sub-Location',
                    ),
                    onSaved: (String value) {},
                    validator: (String value) {
                      return value.contains('@')
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                  Container(height: 20),
                  ElevatedButton(
                    onPressed: () {},
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
