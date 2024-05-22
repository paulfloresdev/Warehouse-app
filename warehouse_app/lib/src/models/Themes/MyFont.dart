import 'package:flutter/material.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';

class MyFont{
  late double vw;
  
  MyFont(BuildContext context){
    vw = Responsive(context).viewportWidth;
  }

  double h2(){
    return 1 * vw;
  }

  double h3(){
    return 1.2 * vw;
  }

}