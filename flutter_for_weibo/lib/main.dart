import 'package:flutter/material.dart';
import './common/Global.dart';
import './common/network/HttpNetworking.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //初始化全局必要参数
    Global.init();

    return MaterialApp(
      title: '微博宇宙版',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '微博宇宙版'),
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

  void _incrementCounter() async{

    Object obj = await HttpNetworking().auth();
    
    setState(() {
      
      
    });
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
