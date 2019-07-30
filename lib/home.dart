import 'package:flutter/material.dart';
import 'pages/iAndTa.dart';
import 'pages/homePage.dart';
import 'pages/helpInfo.dart';
class HomeState extends State<Home>{
    int _curIndex = 0;
    final _pageController = PageController();
    final _barText = <Text>[
        Text("我和TA"),
        Text("小本本"),
        Text("恋爱吧"),
        Text("步行街"),
    ];
    final _barIcon = <Icon>[
        Icon(Icons.home),
        Icon(Icons.view_module),
        Icon(Icons.people),
        Icon(Icons.person)
    ];
    final _activeBarIcon = <Icon>[
        Icon(Icons.home, color: Colors.pink,),
        Icon(Icons.view_module, color: Colors.pink,),
        Icon(Icons.people, color: Colors.pink,),
        Icon(Icons.person, color: Colors.pink,),
    ];
    final _pages = <Widget>[
        HomePage(),
        NotePage(),
        FindingPage(),
        MyPage(),
    ];
    void _pageChanged (int index){
        setState(() {
          _curIndex = index;
        });
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context){
                                        return HelpInfo();


                                },
                            ),
                        );
                    },
                ),
                title: Text("宝贝蓓"),
                actions: <Widget>[
                    //IconButton(icon: Icon(Icons.help),),
                    IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context){
                                    return Paper();
                                }));
                        },),
                ],
            ),
            body: PageView.builder(
                onPageChanged: _pageChanged,
                controller: _pageController,
                itemBuilder: (context, index){
                    return _pages[index];
                    },
                itemCount: _pages.length,
            ),

            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.pink,
                iconSize: 24,
                items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        title: _getBarText(0),
                        icon: _getBarIcon(0),
                        activeIcon: _getBarIcon(0, isActive: true),
                    ),
                    BottomNavigationBarItem(
                        title: _getBarText(1),
                        icon: _getBarIcon(1),
                        activeIcon: _getBarIcon(1, isActive: true),
                    ),
                    BottomNavigationBarItem(
                        title: _getBarText(2),
                        icon: _getBarIcon(2),
                        activeIcon: _getBarIcon(2, isActive: true),
                    ),
                    BottomNavigationBarItem(
                        title: _getBarText(3),
                        icon: _getBarIcon(3),
                        activeIcon: _getBarIcon(3, isActive: true),
                    )
                ],
                currentIndex: _curIndex,
                onTap: (index){
                    _pageController.jumpToPage(index);
                    _pageChanged(index);
                },
            ),

        );
    }

    Text _getBarText(int index){
        return _barText[index];
    }

    Icon _getBarIcon(int index, {bool isActive=false}){
        return isActive ? _activeBarIcon[index] : _barIcon[index];
    }

}

class Home extends StatefulWidget{
    Home({Key key}) : super(key:key);

    @override
    State createState() {
        return HomeState();
    }

}
