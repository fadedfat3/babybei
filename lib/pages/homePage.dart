import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
    HomePage({Key key}) : super(key:key);

    @override
    State createState() {
        return HomePageState();
    }

}

class HomePageState extends State<HomePage>{

    @override
    Widget build(BuildContext context) {
        return Center(
          child: Text("BBB"),
        );
    }
}


class NotePage extends StatefulWidget{
    NotePage({Key key}) : super(key:key);

    @override
    State createState() {
        return NotePageState();
    }

}

class NotePageState extends State<NotePage>{

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text("小本本"),
        );
    }
}

class FindingPage extends StatefulWidget{
    FindingPage({Key key}) : super(key:key);

    @override
    State createState() {
        return FindingPageState();
    }

}

class FindingPageState extends State<FindingPage>{

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text("发现"),
        );
    }
}

class MyPage extends StatefulWidget{
    MyPage({Key key}) : super(key:key);

    @override
    State createState() {
        return MyPageState();
    }

}

class MyPageState extends State<MyPage>{

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text("我的"),
        );
    }
}