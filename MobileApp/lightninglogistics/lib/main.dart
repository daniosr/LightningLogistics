import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
                //change to list view to prevent keyboard error
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onEditingComplete: () => node.nextFocus(),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.camera_alt_rounded, size: 30),
                      hintText: 'Scan by clicking camera',
                      labelText: 'BTWD/Ref*',
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
                      labelText: 'Sales Order Reference*',
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
                      labelText: 'End*',
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
                      labelText: 'Weight*',
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
