import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'FluterFlex.dart';
import 'package:myapp/utils/netutils.dart';
import 'package:myapp/api/Api.dart' as urls;
import 'dart:convert';
// import 'datetiem';

class PostListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PostListScreenState();
}

class PostListScreenState extends State<PostListScreen> {
  final _suggestions = new List();
  num _page = 1;

  PostListScreenState() {
    var page = this._page;
    _getOnePagePosts(page);
  }

  // 获取一页的数据
  _getOnePagePosts(num page) async {
    var url = urls.API.topics;
    var params = {"page": page.toString()};
    NetUtils.get(url, params: params).then((data) {
      Map<String, dynamic> obj = json.decode(data);
      setState(() {
        _suggestions.addAll(obj["data"]);
        _page = page;
      });
    });
  }

  //  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("文章列表")),
      body: _buildPost(),
    );
  }

  Widget _buildPost() {
    var currentPost = null;
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        if (index.isOdd) return Divider();
        final i = index ~/ 2;
        if (i >= _suggestions.length) {
          _getOnePagePosts(this._page++);
        }
        print(_suggestions);
        // currentPost = _suggestions[i];
        if (_suggestions.length > 0) {
          currentPost = _suggestions[i];

          return new FluterFlex(
            time: new TimeOfDay.now().format(context),
            title: currentPost["title"],
            comment: currentPost["reply_count"].toString() + " 评",
            pic: currentPost["author"]["avatar_url"],
          );
        }
      },
    );
  }
}

