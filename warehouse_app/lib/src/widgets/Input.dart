import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Formaters/LowerCaseFormater.dart';
import 'package:warehouse_app/src/models/Formaters/UpperCaseFormater.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';

class Input {
  late BuildContext context;
  late double vw;

  Input(this.context) {
    vw = Responsive(context).viewportWidth;
  }

  Widget text({
    required TextEditingController controller,
    required String label,
    required int caracters,
    required RegExp regExp,
    required double width,
    required int caseType,
    required TextInputType keyboardType,
  }) {
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

  Widget password({
    required Function(TextEditingController) onChanged,
    required TextEditingController controller,
    required Function(bool) changeObscure,
    required bool obscureText,
    required String label,
    required int caracters,
    required RegExp regExp,
    required double width,
    required int caseType,
  }) {
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
              onChanged: (p) {
                print(p);
                onChanged(controller);
              },
              controller: controller,
              keyboardType: TextInputType.visiblePassword,
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
              obscureText: obscureText,
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 0.5 * vw),
                    child: GestureDetector(
                      onTap: () {
                        changeObscure(!obscureText);
                      },
                      child: (obscureText)
                          ? Icon(
                              Icons.remove_red_eye,
                              color: Color.fromRGBO(125, 125, 140, 1),
                            )
                          : Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color.fromRGBO(125, 125, 140, 1),
                            ),
                    ),
                  ),
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
