import 'package:flutter/material.dart';

class Combobox{
  late double vw;
  late double h1;
  late double h2;
  late double h3;

  late bool open;
  late Future future;
  late Function(String param) method;
  late int test;

  Combobox({required Function(String param) method}){
    this.method = method;
  }

  Widget build(BuildContext context){
    // Obtén el tamaño de la pantalla usando MediaQuery
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    vw = screenWidth / 100;
    h1 = 1.1 * vw;
    h2 = 1.4 * vw;
    h3 = 0.9*vw;

    return Container(
      width: 10*vw,
      height: 30*vw,
      color: Colors.pink,
      child: Column(
        children: [
          GestureDetector(
            onTap: method('A'),
            child: Container(
              width: 10*vw,
              height: 10*vw,
              color: Colors.blue,
              child: Text('A'),
            ),
          ),
          GestureDetector(
            onTap: method('B'),
            child: Container(
              width: 10*vw,
              height: 10*vw,
              color: Colors.blue,
              child: Text('B'),
            ),
          ),
          GestureDetector(
            onTap: method('C'),
            child: Container(
              width: 10*vw,
              height: 10*vw,
              color: Colors.blue,
              child: Text('C'),
            ),
          ),
        ],
      ),
    );
  }
}