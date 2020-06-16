// 导入包
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 应用入口
void main() => runApp(MyApp());

// 应用结构
// 继承自一个无状态组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final word = WordPair.random();
    // TODO: implement build
    return MaterialApp(
      // 应用名称
      title: 'flutter demo',
      // 应用首页路由
      home: RandomWords(),
      // 主题
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}

// 继承自一个有状态组件
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  void _pushSaved() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );

      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }
}
