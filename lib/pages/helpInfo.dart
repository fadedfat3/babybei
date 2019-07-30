import 'package:flutter/material.dart';
import 'package:flutter_app/bean/helpInfoBean.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class HelpInfo extends StatefulWidget{

    @override
    State createState() {
        return HelpInfoState();
    }
}

class HelpInfoState extends State<HelpInfo>{
    static final infoData = [
        Text("背景图"),
        Text("配对"),
        Text("位置"),
        Text("天气"),
        Text("个人信息"),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("帮助中心"),
            ),
            body: ListView.builder(
                itemBuilder: (context, index){
                    return ListTile(
                        leading: Icon(Icons.help),
                        title: infoData[index],
                        onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context){
                                    if(index == 0) {
                                        return BackgroundImageInfo();
                                    }
                                    return BackgroundImageInfo();
                                }));
                        },
                    );
                },
                itemCount: infoData.length,

            ),
        );
            ListView.builder(
            itemBuilder: (context, index){
                return ListTile(
                    leading: Icon(Icons.help),
                    title: infoData[index],
                    onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){
                                return BackgroundImageInfo();
                            }));
                    },
                );
            },
            itemCount: infoData.length,

        );
    }
}

class BackgroundImageInfo extends StatefulWidget{

    @override
    State createState() {
        return BackgroundImageInfoState();
    }
}

class BackgroundImageInfoState extends State<BackgroundImageInfo>{
    Future<List<BgImageInfo>> backgroundImageInfo;
    List<BgImageInfo> _list;
    int size = 4;
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("背景图"),
            ),
            body: ListView.builder(
                        itemCount: getSize(),
                        itemBuilder: (context, index){
                            return FutureBuilder<List<BgImageInfo>>(
                                future: backgroundImageInfo,
                                builder: (context, snapshot){
                                    if(snapshot.hasData){
                                        return Column(
                                            children: <Widget>[
                                                    Text(snapshot.data.elementAt(index).question),
                                                    Text(snapshot.data.elementAt(index).answer, style: TextStyle(fontSize: 12),)
                                                ]
                                            );
                                        }else if(snapshot.hasError){
                                            return Text("${snapshot.error}");
                                        }
                                        return CircularProgressIndicator();
                                    },
                                );
                            }

            ),
        );
    }

    @override
    void initState() {
        super.initState();
        backgroundImageInfo = getInfo();
    }
    void setSize(int size){
        this.size = size;
    }
    int getSize(){
        return this.size;
    }
    Future<List<BgImageInfo>> getInfo() async{
        final response =
            await http.get('http://localhost:8001/helpInfo/1');
        if(response.statusCode == 200){

            //print(json.decode(response.body));
            final list = json.decode(response.body);

            var infos = new List<BgImageInfo>();
            for(var l in list){
                infos.add(new BgImageInfo.fromJson(l));
            }
            infos.forEach((f){
                print(f.question);
                print(f.answer);
            });
            setSize(infos.length);
            return infos;

        }else{
            throw Exception('请检查网络链接，稍后重试！');
        }
    }
}