import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';

class Combobox {
  late double vw;

  late bool open;
  late Future<List<dynamic>> future;
  late Function(dynamic item, bool state) method;
  late dynamic current;

  late double left;
  late double right;
  late double top;
  late double width;
  late double height;
  late bool enabled;

  Combobox({
    required this.method,
    required this.open,
    required this.future,
    required this.current,
    required this.left,
    required this.right,
    required this.top,
    required this.width,
    required this.height,
    required this.enabled,
  });

  Widget build(BuildContext context) {
    vw = Responsive(context).viewportWidth;

    if (!enabled) {
      return Positioned(
        left: left * vw,
        right: right * vw,
        top: top * vw,
        child: Container(
          width: width * vw,
          height: height * vw,
          padding: EdgeInsets.symmetric(horizontal: 1 * vw),
          decoration: BoxDecoration(
            color: Color.fromRGBO(235, 235, 245, 1),
            borderRadius: BorderRadius.circular(0.65 * vw),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                current.getName(),
                style: TextStyle(
                  fontSize: MyFont(context).h2(),
                  color: Color.fromRGBO(185, 185, 200, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                color: Color.fromRGBO(185, 185, 200, 1),
                size: 1.6 * vw,
              )
            ],
          ),
        ),
      );
    } else {
      return FutureBuilder<List<dynamic>>(
          future: future,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return Text('Cargando');
            }

            List<dynamic> roles = snapshot.data!;
            if (roles.isEmpty) {
              return Text('No hay roles');
            }

            return (!open)
                ? Positioned(
                    left: left * vw,
                    right: right * vw,
                    top: top * vw,
                    child: GestureDetector(
                      onTap: () {
                        method(current, !open);
                      },
                      child: Container(
                        width: width * vw,
                        height: height * vw,
                        padding: EdgeInsets.symmetric(horizontal: 1 * vw),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(235, 235, 245, 1),
                          borderRadius: BorderRadius.circular(0.65 * vw),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              current.getName(),
                              style: TextStyle(
                                fontSize: MyFont(context).h2(),
                                color: Color.fromRGBO(40, 40, 55, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Color.fromRGBO(40, 40, 55, 1),
                              size: 1.6 * vw,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    left: left * vw,
                    right: right * vw,
                    top: top * vw,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: width * vw,
                          height: height * vw * roles.length,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 235, 245, 1),
                            borderRadius: BorderRadius.circular(0.65 * vw),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(205, 205, 215, 0.33),
                                spreadRadius: 2.5,
                                blurRadius: 20,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ListView.builder(
                              itemCount: roles.length,
                              itemBuilder: (context, index) {
                                return HoverOver(builder: (hovered) {
                                  return GestureDetector(
                                    onTap: () {
                                      method(roles[index], !open);
                                    },
                                    child: Container(
                                      width: width * vw,
                                      height: height * vw,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1 * vw),
                                      decoration: BoxDecoration(
                                          color: (hovered)
                                              ? Color.fromRGBO(225, 225, 235, 1)
                                              : Color.fromRGBO(
                                                  235, 235, 245, 1),
                                          borderRadius: BorderRadius.only(
                                            topLeft: (index == 0)
                                                ? Radius.circular(0.65 * vw)
                                                : Radius.circular(0),
                                            topRight: (index == 0)
                                                ? Radius.circular(0.65 * vw)
                                                : Radius.circular(0),
                                            bottomLeft:
                                                (index == roles.length - 1)
                                                    ? Radius.circular(0.65 * vw)
                                                    : Radius.circular(0),
                                            bottomRight:
                                                (index == roles.length - 1)
                                                    ? Radius.circular(0.65 * vw)
                                                    : Radius.circular(0),
                                          )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            roles[index].getName(),
                                            style: TextStyle(
                                              fontSize: MyFont(context).h2(),
                                              color:
                                                  Color.fromRGBO(40, 40, 55, 1),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              })),
                    ),
                  );
          });
    }
  }
}
