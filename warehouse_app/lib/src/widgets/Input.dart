import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Formaters/LowerCaseFormater.dart';
import 'package:warehouse_app/src/models/Formaters/UpperCaseFormater.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';

class Input {
  late TextEditingController controller;
  late String label;
  late int caracters;
  late RegExp regExp;
  late double width;
  late int caseType;
  late TextInputType keyboardType;

  Input({
    required this.controller,
    required this.label,
    required this.caracters,
    required this.regExp,
    required this.width,
    required this.caseType,
    required this.keyboardType,
  });

  Widget build(BuildContext context) {
    double vw = Responsive(context).viewportWidth;

    return Container(
      width: width * vw,
      height: 4.25 * vw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.5 * vw),
            child: Text(
              label,
              style: TextStyle(
                fontSize: MyFont(context).h2(),
                color: Color.fromRGBO(40, 40, 55, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: width * vw,
            height: 2.5 * vw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 235, 245, 1),
              borderRadius: BorderRadius.circular(0.65 * vw),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              style: TextStyle(
                color: Color.fromRGBO(40, 40, 55, 1),
                fontSize: MyFont(context).h2(),
                fontWeight: FontWeight.w400,
              ),
              inputFormatters: ((caseType == 0)
                  ? [
                      FilteringTextInputFormatter.allow(regExp),
                      LengthLimitingTextInputFormatter(caracters),
                      LowerCaseTextFormatter(),
                    ]
                  : (caseType == 1)
                      ? [
                          FilteringTextInputFormatter.allow(regExp),
                          LengthLimitingTextInputFormatter(caracters),
                          UpperCaseTextFormatter(),
                        ]
                      : [
                          FilteringTextInputFormatter.allow(regExp),
                          LengthLimitingTextInputFormatter(caracters),
                        ]),
              cursorColor: Color.fromRGBO(125, 125, 140, 1),
              decoration: InputDecoration(
                  hintText: label,
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(125, 125, 140, 1),
                    fontSize: MyFont(context).h2(),
                    fontWeight: FontWeight.w400,
                    //height: 1.85,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.65 * vw),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.1 * vw,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.65 * vw),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(215, 215, 225, 1),
                        width: 0.1 * vw,
                      )),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0.75 * vw,
                    horizontal: 1 * vw,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
