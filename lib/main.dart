import 'package:flutter/material.dart';
import './movie/list.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHome()
    );
  }
}

class MyHome extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return DefaultTabController(length: 3,child: Scaffold(
       
        appBar: AppBar(
          title: Text('电影列表'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon:Icon(Icons.search),onPressed: (){},)
          ],
        ),
        drawer: Drawer(child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('sadas@123.com'),
            accountName: Text('xiaoming'),
            currentAccountPicture: CircleAvatar(backgroundImage:NetworkImage('https://images.gitee.com/uploads/91/465191_vsdeveloper.png?1530762316'),),
            decoration:BoxDecoration(
              image: DecorationImage(image:NetworkImage('http://www.liulongbin.top:3005/images/bg1.jpg'))
            )
          ),
          ListTile(title:Text('用户反馈'),trailing: Icon(Icons.feedback)),
          ListTile(title:Text('系统设置'),trailing: Icon(Icons.settings)),
          ListTile(title:Text('我要发布'),trailing: Icon(Icons.send)),
          Divider(color: Colors.grey),
          ListTile(title:Text('注册'),trailing: Icon(Icons.exit_to_app)),
         
          
        ],),),
        bottomNavigationBar:Container(
          decoration: BoxDecoration(color: Colors.black),
          height: 50,
          child: TabBar(
            labelStyle: TextStyle(height: 0,fontSize: 10),
            tabs: <Widget>[
            Tab(icon: Icon(Icons.movie_filter),text:'问答'),
            Tab(icon: Icon(Icons.movie_creation),text:'分享'),
            Tab(icon: Icon(Icons.local_movies),text:'工作')
        ],),),
        body:TabBarView(children: <Widget>[
           Movielist(mt:'ask'),
           Movielist(mt:'share'),
           Movielist(mt:'job')
        ],)
      ),);
      
    }
}



