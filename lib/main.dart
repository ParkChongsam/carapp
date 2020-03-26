import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final dummyItems = [
  'https://cdn.pixabay.com/photo/2016/01/18/09/46/yoga-1146277__340.jpg',
  'https://cdn.pixabay.com/photo/2020/02/26/16/31/butterfly-4882221__340.jpg',
  'https://cdn.pixabay.com/photo/2020/03/09/11/58/engineer-4915435__340.jpg',
];

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
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }
  Widget _buildTop(){
    return GestureDetector(
      onTap: (){
        print('클릭');
      },
      
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
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
            ),
            SizedBox(
              height:20,
            ),
            Row(
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
                Opacity(  //opacity 한 아이템 삭제하지 않고  투명하게 하기
                  opacity: 0.0,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.local_taxi,
                        size: 40,
                      ),
                      Text('대리'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiddle(){
    return CarouselSlider(
      height: 150.0,
      autoPlay: true,
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
  Widget _buildBottom(){
    final items = List.generate(10, (i) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[이벤트] 이것은 공지사항 입니다'),
      );
    });
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
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