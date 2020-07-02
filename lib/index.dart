import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './adapt.dart';

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
    final pages = [IndexPage(), SecPage(), ThirdPage(), FourthPage()];
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

// ---------------------------------------

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
    return Column(
      children: <Widget>[
        Container(
          height: Adapt.px(100),
          child: Center(child: SearchBar()),
        ),
        Container(
          height: Adapt.px(300),
          child: Carousel(),
        ),
        Container(
          height: Adapt.px(200),
          child: RecommendList(),
        )
      ],
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

// 子页面1中的轮播图
class Carousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarouselState();
  }
}

class CarouselState extends State<Carousel> {
  List swiperDataList = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723734494&di=864f7b85f900f0b68e8bc08f1c078eed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201511%2F02%2F20151102140204_WUSwE.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723821634&di=e04d14690229411a560ccc6cf0e10f6a&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F01%2F96%2F56N58PICVWw_1024.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return CachedNetworkImage(
          imageUrl: "${swiperDataList[index]}",
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    );
  }
}

// 子页面1中的胶囊导航
class CapSuleNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CapSuleNavState();
  }
}

class CapSuleNavState extends State<CapSuleNav> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

// 子页面1中的推荐列表
class RecommendList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecommendListState();
  }
}

class RecommendListState extends State<RecommendList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 200.0,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 200.0,
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 200.0,
            color: Colors.yellow,
          ),
        )
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
          width: Adapt.px(200),
          height: Adapt.px(200),
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
