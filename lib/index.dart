import 'package:flutter/material.dart';

void main() => runApp(App());

// 首页
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // 应用名称
      title: 'flutter demo',
      // 应用首页路由
      home: BottomTabBar(),
      // 主题
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}

// ----------------------------------------------

// 底部导航栏
class BottomTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomTabBarState();
  }
}

class BottomTabBarState extends State<BottomTabBar> {
  int _tabIndex = 0;
  final _tabsTitle = ['首页', '学习', '会员', '我的'];
  
  @override
  Widget build(BuildContext context) {
    final pages = [
      IndexPage(),
      SecPage(),
      ThirdPage(),
      FourthPage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(_tabsTitle[0]),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text(_tabsTitle[1]),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text(_tabsTitle[2]),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(_tabsTitle[3]),
            backgroundColor: Colors.blue,
          )
        ],
        currentIndex: _tabIndex,
        onTap: (int i) {
          if (i != _tabIndex) {
            setState(() {
              _tabIndex = i;
            });
          }
        },
      ),
      body: pages[_tabIndex],
    );
  }
}

// 子页面1
class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SearchBar()
      ),
    );
  }
}

// 子页面1中的搜索栏
class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchBarState();
  }
}
class SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Text('搜索'),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type something',
            ),
          ),
        ),
        Icon(Icons.search)
      ],
    );
  }

}


// 子页面2
class SecPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecPageState();
  }
}

class SecPageState extends State<SecPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            width: 100,
            height: 100,
            child: Image.asset('assets/sp_gift.png'),
          ),
      ),
    );
  }
}

// 子页面3
class ThirdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThirdPageState();
  }
}

class ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('会员'),
      ),
    );
  }
}

// 子页面3
class FourthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FourthPageState();
  }
}

class FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('我的'),
      ),
    );
  }
}
