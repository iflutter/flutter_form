import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';

void main() => runApp(MyApp());

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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final userInfoFormDefines = [
  fInput(
      'k="name1",suffix="id:+",l="姓名1",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6"'),
  fInput(
      'k="name2",suffix="str::元",l="姓名2",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6"'),
  fInput(
      'k="name3",prefix="str:c_#FF0000 s_12:*",l="姓名3",h="+^请输&quot;入姓名&quot;",v-req ,v-len="6"'),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
            Padding(
              child: FormBuilder(
                stringWidgetBuilders: {
                  "ic_+": (BuildContext context, String str) {
                    return Icon(Icons.add);
                  }
                },
                tipsHintFormat: "hello hint %s",
                tipsRequiredFormat: "required item",
                fields: userInfoFormDefines,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
