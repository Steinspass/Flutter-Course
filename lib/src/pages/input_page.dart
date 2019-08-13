import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';

  String _selectOpt = 'Complete';

  List<String> _statusList = ['Complete', 'Onpause', 'OnHold', 'Watching'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Fields'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropDown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
      return TextField(
        //autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0) 
          ),
         counter:  Text('letters: ${_name.length}'),
         hintText: 'Name of person',
         labelText: 'Name',
         helperText: 'Only Name',
         suffixIcon: Icon(Icons.person_add),
         icon: Icon(Icons.account_circle)
        ),
        onChanged: (value) {
           setState(() {
             _name = value;
           }); 
        } ,
      );
  }

  Widget _createPerson() {

    return ListTile(
      title: Text('Name is $_name'),
      subtitle: Text('Email is $_email'),
      trailing: Text(_selectOpt),
    );


  }

  _createEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress ,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0) 
          ),
         hintText: 'Your email',
         labelText: 'Email',
         suffixIcon: Icon(Icons.alternate_email),
         icon: Icon(Icons.email)
        ),
        onChanged: (value) {
           setState(() {
             _email = value;
           }); 
        } ,
      );
  }

  Widget _createPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0) 
          ),
          hintText: 'Your Password',
         labelText: 'Password',
         suffixIcon: Icon(Icons.lock_open),
         icon: Icon(Icons.lock)
        ),
        onChanged: (value) {
           setState(() {
             _password = value;
           }); 
        } ,
      );

  }

  Widget _createDate(BuildContext ctx) {
    return TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0) 
          ),
          hintText: 'Birth Date',
         labelText: 'BirthDay',
         suffixIcon: Icon(Icons.perm_contact_calendar),
         icon: Icon(Icons.calendar_today)
        ),
        onTap: (){
          FocusScope.of(ctx).requestFocus(new FocusNode());
          _selectDate(ctx);
        }, 
      );
  }

  _selectDate(BuildContext ctx) async {
    
    DateTime picked = await showDatePicker(
      context: ctx,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1980),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(picked != null){
        setState(() {
          _date = picked.toString();
          _inputFieldDateController.text = _date;
        });
    }


  }


  List<DropdownMenuItem<String>> getOptionsDropdown(){

      List<DropdownMenuItem<String>> list = new List();

      _statusList.forEach( (status){

       list.add(DropdownMenuItem(
         child: Text(status),
         value: status,
       ));

      } );

      return list;
  }

  Widget _createDropDown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
          value: _selectOpt,
          items: getOptionsDropdown(),
          onChanged:(opt){
             setState(() {
              _selectOpt = opt;  
             });
          } ,
    ),
        ),
      ],
    );   
  }

}