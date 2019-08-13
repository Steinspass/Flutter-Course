import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:components/src/pages/alert_page.dart';




class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
        backgroundColor: Colors.deepPurple,
      ),
      body: _list() ,
          );
        }
      
  Widget _list() {
    //print( menuProvider.options );
    //menuProvider.addData()
    return FutureBuilder(
      future: menuProvider.addData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

        return ListView(
          children: _listItems(snapshot.data, context),
        );  
      } ,
    );




    
  }

  List<Widget> _listItems(List<dynamic> list, BuildContext ctx) {

    final List<Widget> option = [];

    list.forEach( (opt) {

      final widgetTemp = ListTile(
        title: Text(opt['texto']) ,
        leading: getIconString(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.deepPurpleAccent),
        onTap: (){

          Navigator.pushNamed(ctx, opt['ruta']);

          //final route = MaterialPageRoute(
          //  builder: (ctx) => AlertPage() 
          //);
          //Navigator.push(ctx, route);
        },
      );

      option..add(widgetTemp)
            ..add( Divider() );

    });
    return option;
  }
}