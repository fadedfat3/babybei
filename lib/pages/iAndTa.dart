import 'package:flutter/material.dart';
class Paper extends StatelessWidget{
    Paper({Key key}) : super(key:key);
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("墙纸"),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: null,
                    ),
                ],
            ),
            body: Text("墙纸模块"),
        );
    }
}