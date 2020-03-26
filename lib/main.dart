import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }
  Widget _buildTop(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(
              Icons.local_taxi,
              size: 40,
            ),
            Text('택시'),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.local_taxi,
              size: 40,
            ),
            Text('블랙'),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.local_taxi,
              size: 40,
            ),
            Text('바이크'),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.local_taxi,
              size: 40,
            ),
            Text('대리'),
          ],
        ),
      ],
    );
  }

  Widget _buildMiddle(){
    return Text('Middle');
  }
  Widget _buildBottom(){
    return Text('Bottom');
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          '이용서비스',
          style: TextStyle(fontSize: 40), //글자색으로 검은색으로
        ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          '내정보',
          style: TextStyle(fontSize: 40), //글자색으로 검은색으로
        ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var _index =0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //배경색을 흰색으로
        title: Text(
          '복잡한UI',
          style: TextStyle(color: Colors.black), //글자색으로 검은색으로
        ),
        centerTitle: true, //제목을 가운데로
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ), 
            onPressed: (){},
            ),
        ],
      ),
      body: _pages[_index],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _index = index;
          });
        }, 
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('홈'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('이용서비스'),
            icon: Icon(Icons.assignment),
          ),
          BottomNavigationBarItem(
            title: Text('내 정보'),
            icon: Icon(Icons.account_circle),
          ),

        ],
      ),
      
    );
  }
}