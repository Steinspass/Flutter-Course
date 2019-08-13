import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Avatar Page'),
       actions: <Widget>[

         Container(
           padding: EdgeInsets.all(6.0),
           child: CircleAvatar(           
             backgroundImage: NetworkImage('https://kabina34radio.com/wp-content/uploads/2019/05/URnaMrya.jpg'),
             radius: 22.0 ,
           ),
         ),

         Container(
           margin: EdgeInsets.only(right: 10.0),
           child: CircleAvatar(
             child: Text('SL') ,
             backgroundColor: Colors.deepPurpleAccent,
           ),
         )
       ],
     ), 
     body: Center(
       child: FadeInImage(
         image: NetworkImage('https://i2.wp.com/codigoespagueti.com/wp-content/uploads/2018/04/stan-lee-spider-man.jpg?resize=1080%2C600&quality=90&ssl=1'),
          placeholder: AssetImage('assets/jar-loading.gif'), 
          fadeInDuration: Duration(milliseconds: 400),
       ) ,
     ),
    );
  }
}