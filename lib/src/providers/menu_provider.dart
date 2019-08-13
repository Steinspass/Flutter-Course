import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

  List<dynamic> options = [];

  _MenuProvider(){
      //addData();
  }

// future =  resolver en segundos despues y va retornar la informacion requerida  
  Future<List<dynamic>> addData() async {

    final resp =  await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
      //print(dataMap['rutas']);
      options = dataMap['rutas'];

    return options;
  }


}

final menuProvider = new _MenuProvider();