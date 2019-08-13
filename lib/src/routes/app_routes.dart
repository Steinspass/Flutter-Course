import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/animated_container_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:components/src/pages/listview_page.dart';







Map<String, WidgetBuilder> getApplicationRoutes(){

 return <String, WidgetBuilder>{
    '/'      : ( BuildContext ctx ) => HomePage(),
    'alert'  : ( BuildContext ctx ) => AlertPage(),
    'avatar' : ( BuildContext ctx ) => AvatarPage(),
    'card'   : (BuildContext ctx) => CardPage(),
    'AnimatedContainer'   : (BuildContext ctx) => AnimatedContainerPage(),
    'inputs'   : (BuildContext ctx) => InputPage(),
    'slider'   : (BuildContext ctx) => SliderPage(),
    'list'   : (BuildContext ctx) => ListViewPage(),
  }; 

}


