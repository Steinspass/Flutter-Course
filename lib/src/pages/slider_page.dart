import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {


  double _valueSlider = 200.0;
  bool _checkedBlock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _crearBox(),
            _crearSwitch(),
            _crearSlider(),
            Expanded(
              child: _createImage()
              ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Image Size',
      //divisions: 20,
      value: _valueSlider,
      min: 40.0,
      max: 400.0,
      onChanged: (_checkedBlock) ? null :(value){
          setState(() {
           _valueSlider = value; 
          });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://foodandtravel.mx/wp-content/uploads/2017/01/shutterstock_559737274-e1484952902344.jpg') ,
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearBox() {

  //  return Checkbox(
  //    value: _checkedBlock,
  //    onChanged: (value){
  //      setState(() {
  //         _checkedBlock = value;
  //      });
  //    },
  //  ); 

   return CheckboxListTile(
     title: Text(' Checkbox Slider Block'),
     value: _checkedBlock,
     onChanged: (value){
       setState(() {
          _checkedBlock = value;
       });
     },
   ); 
  }

  Widget _crearSwitch() {
    
    return SwitchListTile(
     title: Text(' Switch Slider Block'),
     value: _checkedBlock,
     onChanged: (value){
       setState(() {
          _checkedBlock = value;
       });
     },
   );
  }
}