import 'dart:async';

import 'package:flutter/material.dart';



class ListViewPage extends StatefulWidget {

  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastItem = 0;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10photos();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_add10photos();
        fetchData();
      }

    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(

        onRefresh: _addPages,

        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext ctx, int position) {

          final imageInt = _listNumbers[position];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/250?random=$imageInt'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            height: 250.0,
            width: 500.0,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Future<Null> _addPages() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){

      _listNumbers.clear();
      _lastItem++;
      _add10photos();

    });

    return Future.delayed(duration);
  }


  _add10photos(){

    for (var i = 1; i < 10; i++){
      _lastItem++;
      _listNumbers.add(_lastItem);
    }
    setState(() {});

  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() { });

    final duration = new Duration(seconds: 2);

    return new Timer(duration, responseTime);

  }

  void responseTime(){
      _isLoading = false;

      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds:  250)
      );
      _add10photos();
  }

  Widget _createLoading() {

    if( _isLoading ){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator()
              ],
            ),
            SizedBox(height: 15.0)
        ],
      );
    }else{
      return Container();
    }
  }
}