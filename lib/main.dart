
import "package:flutter/material.dart";
import 'views/Layout.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:english_words/english_words.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "titl1e",
      home: new BottomNavigationWidget(),
      // routes: <String, WidgetBuilder>{
      //   "/detail": (BuildContext context) => new WebviewScaffold(
      //         url: "https://baidu.com",
      //         appBar: new AppBar(
      //           title: new Text("web"),
      //         ),
      //       )
      // },
    );
  }
}

// class RandomWords extends StatefulWidget {
//   @override
//   createState() => new RandomWordsState();
// }

// class RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _biggerFont = const TextStyle(fontSize: 18.0);
//   final _saved = new Set<WordPair>();
//   @override
//   Widget build(BuildContext context) {
//     // final wordPair = new WordPair.random();
//     // return new Text(wordPair.asCamelCase);
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('文章列表'),
//         actions: <Widget>[
//           new IconButton(
//             icon: new Icon(Icons.list),
//             onPressed: _pushSaved,
//           )
//         ],
//       ),
//       body: _buildSuggestions(),
//     );
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//       final tiles = _saved.map((pair) {
//         return new ListTile(
//           title: new Text(
//             pair.asCamelCase,
//             style: _biggerFont,
//           ),
//         );
//       });
//       final divided = ListTile.divideTiles(
//         context: context,
//         tiles: tiles,
//       ).toList();
//       return new Scaffold(
//           appBar: new AppBar(title: new Text('Saved Suggestions')),
//           body: new ListView(children: divided));
//     }));
//   }

//   Widget _buildSuggestions() {
//     return new ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: (context, i) {
//           if (i.isOdd) {
//             return new Divider();
//           }
//           final index = i ~/ 2;
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }

//   Widget _buildRow(WordPair pair) {
//     final alreadSaved = _saved.contains(pair);
//     return new ListTile(
//       title: new Text(pair.asCamelCase, style: _biggerFont),
//       trailing: new Icon(
//         alreadSaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadSaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadSaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }
// }
