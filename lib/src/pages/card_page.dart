import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0) ,
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 20.0,),
         _cardType2() 
        ],
      ),
    );
  }

  Widget _cardType1() {

      return Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
       child: Column(
         children: <Widget>[
           ListTile(
            
             leading: Icon(Icons.photo_album, color: Colors.orangeAccent.shade700) ,
             title: Text('Soy el titulo de esta tarjeta', style: TextStyle(color: Colors.black, fontSize: 20.0),),
             subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. '),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end ,
             children: <Widget>[
               FlatButton(
                 child: Text('Cancelar'),
                 onPressed: () {},
               ),
               FlatButton(
                 child: Text('Okay'),
                 onPressed: () {},
               ),
             ],
           )
         ],
       ), 
      );
  }

  _cardType2() {

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 10.0,
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://spotlight.it-notes.ru/wp-content/uploads/2018/01/97f63d3f3d7a0190b14d109673284ac1.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 600),
            height: 250.0,
            fit: BoxFit.cover,
          ),

         // Image(
         //  image: NetworkImage('https://spotlight.it-notes.ru/wp-content/uploads/2018/01/97f63d3f3d7a0190b14d109673284ac1.jpg'), 
         // ),
          Container(
            padding: EdgeInsets.all(10.0) ,
            child: Text('Landscape in China'),
          ),
        ],
      ),


    );

  }

  
}