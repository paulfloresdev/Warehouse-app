import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse_app/src/models/LowerCaseFormater.dart';
import 'package:warehouse_app/src/models/UpperCaseFormater.dart';

class Input{
  late TextEditingController controller;
  late  String label;
  late  int caracters;
  late  RegExp regExp;
  late  double width;
  late  int caseType;

  Input({required this.controller, required this.label, required this.caracters, required this.regExp, required this.width, required this.caseType});

  Widget build(BuildContext context){
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double vw = screenWidth / 100;
    final double h1 = 1.1 * vw;
    final double h2 = 1.4 * vw;
    final double h3 = 0.9*vw;

    return Container(
      width: width * vw,
      height: 5.25 * vw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.5 * vw),
            child: Text(
              label,
              style: TextStyle(
                fontSize: h1,
                color: Color.fromRGBO(40, 40, 55, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: 22 * vw,
            height: 3.3 * vw,
            decoration: BoxDecoration(
                color: Color.fromRGBO(235, 235, 245, 1),
                borderRadius: BorderRadius.circular(0.65 * vw)),
            child: TextFormField(
              controller: controller,
              style: TextStyle(
                color: Color.fromRGBO(40, 40, 55, 1),
                fontSize: h1,
                fontWeight: FontWeight.w400,
              ),
              inputFormatters:
              (
                (caseType == 0) ?  
                  [
                    FilteringTextInputFormatter.allow(regExp),
                    LengthLimitingTextInputFormatter(caracters),
                    LowerCaseTextFormatter(),
                  ]
                : (caseType == 1) ?
                  [
                    FilteringTextInputFormatter.allow(regExp),
                    LengthLimitingTextInputFormatter(caracters),
                    UpperCaseTextFormatter(),
                  ]
                :
                  [
                    FilteringTextInputFormatter.allow(regExp),
                    LengthLimitingTextInputFormatter(caracters),
                  ]
                
              ),
                
            
              decoration: InputDecoration(
                  hintText: label,
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(125, 125, 140, 1),
                    fontSize: h1,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0.65 * vw, horizontal: 1 * vw)),
            ),
          ),
        ],
      ),
    );
  }
    
}