import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: null,
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:12.0, bottom: 12.0),
                child: Container(
                  child: Image(
                      image: AssetImage("assets/images/citysphere.png"),
                      width: 150.0,
                      height: 50.0,
                  ),
                ),
              ),
              AptList()
            ],
          ),
        )
    );
  }
}

class AptCard extends StatelessWidget{
  AptCard({this.image, this.address, this.area, this.rooms});

  ImageProvider<dynamic> image;
  String address;
  double area;
  int rooms;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 48.0;

    // TODO: implement build
    return InkWell(
          onTap: () =>
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AptDetails()),
            ),
        child: Row(
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:10.0, bottom: 10.0),
                child: Container(
                  child:
                    Ink.image(
                      image: this.image,
                      width: 220.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                      child: new InkWell(),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: AptText(address: this.address, area: this.area, rooms: this.rooms)
              )
          ],
        )
      );
  }
}

class AptList extends StatelessWidget{

  AptList();
  @override
  Widget build(BuildContext context) {
    const double iconSize = 48.0;

    // TODO: implement build
    return MyCard(title: "Apartments",
        child: Column(
        children: <Widget>[
          AptCard(image: AssetImage("assets/images/apt1.jpg"),
              address: "15 Campus Drive", area: 80.0, rooms: 3),
          AptCard(image: AssetImage("assets/images/apt2.jpg"),
              address: "276 Marble Road", area: 67.4, rooms: 2),
          AptCard(image: AssetImage("assets/images/apt3.jpg"),
              address: "7 Everett Avenue", area: 133.5, rooms: 4),
          AptCard(image: AssetImage("assets/images/apt4.jpg"),
              address: "155 Princeton Way", area: 70.2, rooms: 2),
        ],
      )
    );
  }
}

class AptText extends StatelessWidget{
  AptText({this.address, this.area, this.rooms});

  String address;
  double area;
  int rooms;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 48.0;

    // TODO: implement build
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.address, style: TextStyle(fontStyle: FontStyle.italic)),
        Text(this.area.toString() + " sq. m"),
        Text(this.rooms.toString() + " rooms")
    ]
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
  _MyHomePageState createState() => new _MyHomePageState();
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyCard extends StatelessWidget{
  MyCard({this.title, this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical:  8.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              this.title,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
              ),
            ),
          ),
          this.child,
        ],
      ),
    );
  }
}

class AptDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apartment"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Text("...")
          ],
        ),
      ),
    );
  }
}
