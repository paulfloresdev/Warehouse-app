import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Auxiliars/Router.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';
import 'package:warehouse_app/src/models/User.dart';
import 'package:warehouse_app/src/views/users/edit_users_view.dart';

class CustomTable {
  late BuildContext context;
  late double vw;

  CustomTable(this.context) {
    vw = Responsive(context).viewportWidth;
  }

  TextStyle get header => TextStyle(
        fontSize: MyFont(context).h2(),
        color: Color.fromRGBO(40, 40, 55, 1),
        fontWeight: FontWeight.w600,
      );
  TextStyle get row => TextStyle(
        fontSize: MyFont(context).h2(),
        color: Color.fromRGBO(40, 40, 55, 1),
        fontWeight: FontWeight.w400,
      );

  Widget textRow({
    required Size size,
    required BorderRadiusGeometry rowAlignment,
    required Color color,
    required String label,
    required TextStyle textStyle,
  }) {
    return Container(
      width: size.width * vw,
      height: size.height * vw,
      decoration: BoxDecoration(
        color: color,
        borderRadius: rowAlignment,
      ),
      child: Center(
        child: Text(
          label,
          style: textStyle,
        ),
      ),
    );
  }

  Widget buttonRow({
    required Size size,
    required BorderRadiusGeometry rowAlignment,
    required Color color,
    required TextStyle textStyle,
    required User user,
  }) {
    return Container(
      width: size.width * vw,
      height: size.height * vw,
      decoration: BoxDecoration(
        color: color,
        borderRadius: rowAlignment,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HoverOver(builder: (hovered) {
            return GestureDetector(
              onTap: () => Routes(context).goTo(EditUsersView(
                user_: user,
              )),
              child: Container(
                width: 1.75 * vw,
                height: 1.75 * vw,
                decoration: BoxDecoration(
                  color: (hovered)
                      ? Color.fromRGBO(8, 67, 122, 1)
                      : Color.fromRGBO(38, 97, 152, 1),
                  borderRadius: BorderRadius.circular(0.65 * vw),
                ),
                child: Center(
                  child:
                      Icon(Icons.edit_rounded, size: 0.875 * vw, color: color),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
