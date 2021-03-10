import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CafeX Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.white,
      ),
      home: Center(
        child: SizedBox(
          child: MyHomePage(title: 'CafeX Demo'),
          height: 1920,
          width: 400,
        ),
      ),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      Scrollable.ensureVisible(
        pageKeys[_tabController.index].currentContext,
        duration: Duration(milliseconds: 500),
      );
    });
  }

  Widget _tile() {
    // return Card(
    //   child: ListTile(
    //     title: Text('Test Item'),
    //     trailing: Image.asset('res/hot1.png'),
    //     subtitle: Text('test description'),
    //
    //   ),
    // );
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Item',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'description',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "\$8.88",
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Image.asset('res/hot1.png'),
            )
          ],
        ),
      ),
    );
  }

  final pageKeys = [GlobalKey(), GlobalKey(), GlobalKey()];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        primary: false,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BubbleTabIndicator(
              indicatorHeight: 40.0,
              indicatorColor: Colors.blueAccent,
              tabBarIndicatorSize: TabBarIndicatorSize.label,
              // Other flags
              indicatorRadius: 20,
              insets: EdgeInsets.all(0),
              padding: EdgeInsets.all(0)),
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.grey[500],
          tabs: [
            Tab(text: 'HOT DRINKS'),
            Tab(text: 'ICED DRINKS'),
            Tab(text: 'PASTRIES AND MORE'),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  // height: 350,
                  ),
              items: <Widget>[
                Container(
                  child: Center(
                    child: Image.asset(
                      'res/toptile1.png',
                      // height: 350,
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Image.asset(
                      'res/toptile2.png',
                      // height: 350,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VisibilityDetector(
                      key: pageKeys[0],
                      child: ListTile(
                        key: pageKeys[0],
                        subtitle: Text('HOT DRINKS'),
                      ),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.85) {
                          setState(() {
                            _tabController.animateTo(0);
                          });
                        }
                      },
                    ),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    VisibilityDetector(
                      key: pageKeys[1],
                      child: ListTile(
                        key: pageKeys[1],
                        subtitle: Text('COLD DRINKS'),
                      ),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.85) {
                          setState(() {
                            _tabController.animateTo(1);
                          });
                        }
                      },
                    ),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    VisibilityDetector(
                      key: pageKeys[2],
                      child: ListTile(
                        key: pageKeys[2],
                        subtitle: Text('PASTRIES AND MORE'),
                      ),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.85) {
                          setState(() {
                            _tabController.animateTo(2);
                          });
                        }
                      },
                    ),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                    _tile(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
