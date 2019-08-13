import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final option = ['Uno', 'Dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: ListView(
        children: _createItemEasy()
      ) ,
    );
  }

  List<Widget> _createItem() {

    List<Widget> list = new List<Widget>();

    for (String opt in option) {
      
      final tempWidget = ListTile(
        title: Text(opt),
      );

      list..add(tempWidget)
          ..add(Divider(color: Colors.black ,));
    }

    return list;
  }

  List<Widget> _createItemEasy() {

      return option.map( ( item ){

          return Column(
            children: <Widget>[
              ListTile(
               title: Text( item + '!'), 
               subtitle: Text('is number'),
               leading: Icon(Icons.account_balance_wallet),
               trailing: Icon(Icons.arrow_forward_ios),
               onTap: () {  },
              ),
              Divider()
            ],
          );
      }).toList();
  }

}