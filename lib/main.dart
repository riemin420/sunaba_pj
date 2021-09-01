import 'dart:html';

import 'dart:io';
//import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var timelineItem = ["test", "test2"];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Twitter clone APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MenuPain(),
            TimelinePain(),
          ],
        ),
      ),
    );
  }
}

//動作はしないが見た目だけボタン群を置いておく
class MenuPain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new ElevatedButton.icon(
          icon: new Icon(FontAwesomeIcons.home),
          label: new Text('ホーム'),
          onPressed: null,
        ),
        new ElevatedButton.icon(
          onPressed: null,
          icon: new Icon(FontAwesomeIcons.hashtag),
          label: new Text('話題を検索'),
        ),
        new ElevatedButton.icon(
          onPressed: null,
          icon: new Icon(FontAwesomeIcons.bell),
          label: new Text('通知'),
        ),
      ],
    );
  }
}

class TimelinePain extends StatefulWidget {
  @override
  _TimelinePainState createState() => _TimelinePainState();
}

//ツイートとタイムライン表示はこっちから行う
class _TimelinePainState extends State<TimelinePain> {
  var _tweetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 90,
          width: 400,
          child: TextFormField(
            controller: _tweetController,
            maxLines: 3,
            minLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              hintText: 'いまなにしてる？',
              labelText: 'tweet',
              alignLabelWithHint: true,
              suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
            ),
          ),
        ),
        // new ElevatedButton.icon(
        //   onPressed: () {},
        //   icon: new Icon(FontAwesomeIcons.camera),
        //   label: new Text('画像'),
        // ),
        new ElevatedButton.icon(
          onPressed: () => setState(() {
            addTweet(_tweetController.text);
          }),
          icon: new Icon(FontAwesomeIcons.pen),
          label: new Text('ツイートする'),
        ),
        LimitedBox(
          maxHeight: 300,
          maxWidth: 400,
          child: TimelineList(),
        ),
      ],
    );
  }

  void addTweet(tweettext) {
    timelineItem.add(tweettext);
  }
}

class TimelineList extends StatefulWidget {
  @override
  _TimelineListState createState() => _TimelineListState();
}

class _TimelineListState extends State<TimelineList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          // return Text(timelineItem[index]);
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),
            ),
            child: ListTile(
              title: Text(timelineItem[index]),
            ),
          );
        },
        itemCount: timelineItem.length,
      ),
    );
  }
}
