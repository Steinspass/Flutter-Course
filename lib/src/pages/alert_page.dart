import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Alert Page'),
     ), 
     body: Center(
       child: RaisedButton(
         child: Text('Mostrar alerta'),
         color: Colors.deepPurple,
         textColor: Colors.white,
         shape: StadiumBorder(),
         onPressed: () => _showAlert(context),
       ),
     ),
    );
  }

  void _showAlert(BuildContext ctx){

      showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx){

         return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),  
           title: Text('Title of Alert'),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
             Text('Content Alert'),
             FlutterLogo(size: 30.0 ,) 
           ],
           ),
           actions: <Widget>[
             FlatButton(
               child: Text('Cancel'),
               onPressed: () => Navigator.of(ctx).pop() ,
             ),
            FlatButton(
               child: Text('Ok'),
               onPressed: (){},
             ),
           ],
         );
        }


      );


  }


}