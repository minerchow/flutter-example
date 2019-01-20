import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './detail.dart';
Dio dio = new Dio();
class Movielist extends StatefulWidget {
  //构造函数
  Movielist({Key key,@required this.mt}):super(key:key);

  final mt;
  @override
    _MovielistState createState() {
     
      return new _MovielistState();
    }
}

//管理有状态类
class _MovielistState extends State<Movielist> with AutomaticKeepAliveClientMixin{
  int page = 1;
  int pageSize=10;
  var mlist = [];
  @override
    // TODO: implement wantKeepAlive
    bool get wantKeepAlive => true;
  //创建时候
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getMovieList();
    }
  //build渲染当前结构
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ListView.builder(itemCount: mlist.length,itemBuilder: (BuildContext ctx,int i){
        var mitem = mlist[i];
        return GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
            return new MovieDetail(
              id:mitem['id'],
              title:mitem['title']
            );
          }));
        },child: Container(
          height: 40,
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Image.network(mitem['author']['avatar_url'],width:30,fit: BoxFit.cover,),
          Text("[${mitem['tab']}]"),
          Column(children: <Widget>[
            Text(mitem['title'])
          ],)
        ],),
        ),);
      },);
    }

    getMovieList() async{
     var response = await dio.get('https://cnodejs.org/api/v1/topics?tab=${widget.mt}&limit=$pageSize&page=$page');
     var result = response.data;
     setState(() {
        mlist = result['data'];      
      });
    }
}