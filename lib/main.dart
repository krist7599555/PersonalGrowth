import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fluttersshjk Demojmkssjkj',
        theme: ThemeData(
            primaryColor: Colors.blueAccent, backgroundColor: Colors.teal),
        routes: {
          "/": (BuildContext context) => new AllPage(),
          "/m": (BuildContext context) => new HomePage(),
          "/profile": (BuildContext context) => new ProfilePage(),
        });
  }
}

class AllPage extends StatefulWidget {
  createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  final pc = PageController(initialPage: 0);
  Widget build(BuildContext bctx) {
    return PageView(
      controller: pc,
      onPageChanged: (int page) {
        print(['go to page', page]);
      },
      children: <Widget>[
        HomePage(),
        ProfilePage(),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int level;
  double experiance;
  TextEditingController txt;
  _HomePageState({this.level = 1, this.experiance = 0.2}) {
    txt = TextEditingController();
  }

  void increaseExp(int len) {
    setState(() {
      experiance += len / (10 * (level + 5));
      if (experiance >= 1) {
        experiance -= 1;
        level += 1;
      }
    });
  }

  @override
  Widget build(BuildContext bctx) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(bctx).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0AE1A3), Color(0xff000675)],
                  // stops: [0.2, 0.2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
                // image: DecorationImage(
                //     image: new AssetImage("assets/bg1.jpg"),
                //     fit: BoxFit.cover,
                //     alignment: Alignment.topCenter),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(bctx, "/profile");
                    },
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          child: CustomPaint(
                            size: Size(1000, 1000),
                            painter: OvalPainter(color: Color(0xEEFFFFFF)),
                          ),
                          left: -60,
                          right: -60,
                          top: -60 - 15.0,
                          bottom: -60 + 15.0,
                        ),
                        Positioned(
                          child: CustomPaint(
                            size: Size(1000, 1000),
                            painter: OvalPainter(
                                color: Colors.pink,
                                border: true,
                                complete: experiance),
                          ),
                          left: -55,
                          right: -55,
                          top: -55 - 15.0,
                          bottom: -55 + 15.0,
                        ),
                        Positioned(
                          bottom: -12,
                          left: 0,
                          right: 0,
                          child: CustomPaint(
                              size: Size(320, 50),
                              painter: OvalPainter(color: Color(0xEE202020))),
                        ),
                        Positioned(
                          top: -50,
                          left: 0,
                          right: 0,
                          child: Text(
                            "LV. $level",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Image.asset("assets/pet4.png", width: 150, height: 150),
                      ],
                    ),
                  ),
                  SizedBox(height: 90),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xEEFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      padding: EdgeInsets.fromLTRB(20, 7, 20, 20),
                      child: TextField(
                          controller: txt,
                          style: TextStyle(color: Colors.black, height: 2),
                          maxLines: 5,
                          minLines: 3,
                          scrollPadding: EdgeInsets.all(10),
                          decoration: InputDecoration(
                              hintText: "good story for today")),
                    ),
                  ),
                  SizedBox(height: 15),
                  FlatButton.icon(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    label: Text('Send Happiness !'),
                    icon: Icon(Icons.thumb_up),
                    color: Colors.pink,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    onPressed: () {
                      increaseExp(txt.text.length);
                      txt.text = "";
                    },
                    // backgroundColor: Colors.pink,
                  ),
                  // FlatButton(
                  //   color: Colors.blue,
                  //   textColor: Colors.white,
                  //   padding: EdgeInsets.all(5),
                  //   // child: Text('Reflec Now!'),
                  //   child: Icon(Icons.add_circle, size: 50),
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(100)),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     // Add your onPressed code here!
        //   },
        //   label: Text('Send Happiness !'),
        //   icon: Icon(Icons.thumb_up),
        //   backgroundColor: Colors.pink,
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // bottomNavigationBar: BottomAppBar(
        //   child: Container(height: 90),
        //   color: Colors.white,
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.home), title: Text('home')),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.people), title: Text('chat')),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.settings), title: Text('setting')),
        //   ],
        // ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  Widget getItem(int idx) {
    if (1 <= idx && idx <= 8) {
      return Container(
        child: Image.asset("assets/pet$idx.png"),
        padding: EdgeInsets.all(15),
      );
    } else {
      return Icon(
        idx != 0 ? Icons.block : Icons.add,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext bctx) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text("Collections"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              padding: EdgeInsets.all(5),
              children: List.generate(18, (idx) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.orange,
                      Colors.pink,
                      Colors.purple,
                    ][idx % 6][500],
                    padding: EdgeInsets.all(5),
                    child: Center(child: getItem(idx)),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class OvalPainter extends CustomPainter {
  Color color;
  bool border;
  double complete;
  OvalPainter({
    this.color = Colors.blue,
    this.border = false,
    this.complete = 0.34,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = this.color;

    if (this.border) {
      paint.strokeWidth = 6;
      paint.strokeCap = StrokeCap.round;
      paint.style = PaintingStyle.stroke;
      canvas.drawArc(
        Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
        pi * 1.5,
        pi * 2 * (this.complete),
        false,
        paint,
      );
    } else {
      canvas.drawOval(
        Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
