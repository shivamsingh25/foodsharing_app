import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Data
  List<String> images = [
    "assets/images/burger.jpg",
    "assets/images/pancake.jpg",
  ];

  List<String> users = ["Pawel", "Shivam"];
  List<String> status = ["unlike", "like"];
  List<String> uppertitles = ["9 April, 11:30 AM", "10 April, 1:00 PM"];
  List<String> titles = ["Homemade Burgers", "Blueberry Pancakes"];
  List<String> subtitles = ["1", "4"]; // spot left at the table

  List<Widget> menu() {
    List<Widget> menuList = new List();

    for(int i = 0; i < 2; i++){
      var menuItem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Container(
          height: 350.0,
          width: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.transparent
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)
                ),
                child: Image.asset(
                  images[i],
                  fit: BoxFit.cover
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)
                ),
                child: new DecoratedBox(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.transparent
                      ]
                    ),
                  )
                ),
              ),
              Positioned(
                top: 30.0, left: 30.0,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://i.pravatar.cc/400"),
                      radius: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        users[i],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30.0, right: 30.0,
                child: Icon(
                  status[i] == "like" ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 245.0, left: 30.0,
                child: Text(
                  uppertitles[i],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
              Positioned(
                top: 270.0, left: 30.0,
                child: Text(
                  titles[i],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 305.0, left: 30.0,
                child: Text(
                  subtitles[i] + "spots left at the table",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ],
            overflow: Overflow.clip,
          ),
        ),
      );
      menuList.add(menuItem);
    }
    return menuList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.only(top: 100.0, left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "Upcoming meals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 36
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Color(0xffe86c42),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: 25.0, right: 0.0),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 25.0, left: 25.0),
                      child: Container(
                        height: 500.0,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: menu(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffe86c42),
        child: Icon(Icons.add_photo_alternate, color: Colors.white),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: 25.0,
            ),
            // Resource Limitation, Using Material Icons instead of Custom Icons
            IconButton(icon: Icon(Icons.fastfood), color: Color(0xffe86c42), onPressed: null),
            SizedBox(width: 65.0),
            IconButton(icon: Icon(Icons.book), color: Color(0xffe86c42), onPressed: null),
            SizedBox(width: 65.0),
            IconButton(icon: Icon(Icons.favorite_border), color: Color(0xffe86c42), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}