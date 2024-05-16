import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hoverover/hoverover.dart';

import 'package:warehouse_app/src/models/Router.dart';
import 'package:warehouse_app/src/views/home/homepage_view.dart';
import 'package:warehouse_app/src/views/users/system-users/system_users_view.dart';

late int page;
late int selected;
late double vw;
late double h1;
int role = 1;

class SideBar extends StatefulWidget {
  SideBar({Key? key, required int pageIndex}) {
    page = pageIndex;
    selected = page;
  }

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    // Obtén el tamaño de la pantalla usando MediaQuery
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    vw = screenWidth / 100;
    h1 = 1.1 * vw;

    return Skeleton(context);
  }

  Widget Skeleton(BuildContext context) {
    return Container(
      width: 20 * vw,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(40, 40, 55, 1),
      ),
      child: Column(
        children: [
          header(),
          (role != 4)
              ? Column(
                  children: [
                    option(a: 0, b: 0, label: 'Home'),
                    option(a: 1, b: 4, label: 'Assets'),
                    suboption(
                        index: 1,
                        a: 1,
                        b: 4,
                        label: 'Find Asset',
                        destination: HomePageView()),
                    suboption(
                        index: 2,
                        a: 1,
                        b: 4,
                        label: 'Racks',
                        destination: HomePageView()),
                    suboption(
                        index: 3,
                        a: 1,
                        b: 4,
                        label: 'Shelfs',
                        destination: HomePageView()),
                    suboption(
                        index: 4,
                        a: 1,
                        b: 4,
                        label: 'Boxes',
                        destination: HomePageView()),
                    option(a: 5, b: 8, label: 'Consumables'),
                    suboption(
                        index: 5,
                        a: 5,
                        b: 8,
                        label: 'Find Consumable',
                        destination: HomePageView()),
                    suboption(
                        index: 6,
                        a: 6,
                        b: 8,
                        label: 'Racks',
                        destination: HomePageView()),
                    suboption(
                        index: 7,
                        a: 7,
                        b: 8,
                        label: 'Shelfs',
                        destination: HomePageView()),
                    suboption(
                        index: 8,
                        a: 8,
                        b: 8,
                        label: 'Boxes',
                        destination: HomePageView()),
                  ],
                )
              : Container(),
          (role == 1)
              ? Column(
                  children: [
                    option(a: 9, b: 10, label: 'Users'),
                    suboption(
                        index: 9,
                        a: 9,
                        b: 10,
                        label: 'System Users',
                        destination: SystemUsersView()),
                    suboption(
                        index: 10,
                        a: 9,
                        b: 10,
                        label: 'Employees',
                        destination: HomePageView()),
                  ],
                )
              : Container(),
          (role != 4)
              ? option(a: 11, b: 11, label: 'Assignations')
              : Container(),
          option(a: 12, b: 12, label: 'Out Passes'),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      width: double.maxFinite,
      height: 7 * vw,
      padding: EdgeInsets.all(1.5 * vw),
      decoration: BoxDecoration(color: Color.fromRGBO(30, 30, 45, 1)),
      child: Row(
        children: [
          Container(
            width: 15 * vw,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paul Flores',
                  style: TextStyle(
                    fontSize: h1,
                    color: Color.fromRGBO(245, 245, 255, 1),
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  "KEI La Paz BCS",
                  style: TextStyle(
                    fontSize: h1,
                    color: Color.fromRGBO(245, 245, 255, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 2 * vw,
            height: 2 * vw,
            decoration: BoxDecoration(
              color: Color.fromRGBO(40, 40, 55, 1),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 0.1 * vw),
              child: Icon(
                Icons.logout_outlined,
                size: 1 * vw,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget option(
      {required int a,
      required int b,
      required String label,
      Function()? action}) {
    return HoverOver(builder: (isHovered) {
      return GestureDetector(
        onTap: () => (a != b) ? changeSelected(a) : action,
        child: Container(
          width: 20 * vw,
          height: 4.25 * vw,
          decoration: BoxDecoration(
            color: (isHovered || (inRange(a, b, page)))
                ? Color.fromRGBO(55, 55, 70, 1)
                : Color.fromRGBO(40, 40, 55, 1),
          ),
          child: Row(
            children: [
              SizedBox(width: 0.125 * vw),
              Container(
                  width: 2.125 * vw,
                  height: 4.25 * vw,
                  child: (a == b)
                      ? null
                      : RotatedBox(
                          quarterTurns: inRange(a, b, selected) ? 1 : 0,
                          child: Container(
                            width: 2.125 * vw,
                            height: 2.125 * vw,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 1.0625 * vw,
                              color: Colors.white,
                            ),
                          ),
                        )),
              Container(
                width: 16.875 * vw,
                height: 4.25 * vw,
                padding: EdgeInsets.only(left: 0.25 * vw),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: h1,
                        color: Color.fromRGBO(245, 245, 255, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 0.875 * vw,
                height: 4.25 * vw,
                color: inRange(a, b, page)
                    ? Color.fromRGBO(92, 195, 152, 1)
                    : null,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget suboption({
    required int index,
    required int a,
    required int b,
    required String label,
    required StatefulWidget destination,
  }) {
    if ((selected >= a && selected <= b)) {
      return HoverOver(
        builder: (isHovered) {
          return GestureDetector(
            onTap: () => Routes(context).goTo(destination),
            child: Container(
              width: double.maxFinite,
              height: 4.25 * vw,
              padding: EdgeInsets.only(left: 3.5 * vw),
              color: (isHovered)
                  ? Color.fromRGBO(55, 55, 70, 1)
                  : Color.fromRGBO(40, 40, 55, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: h1,
                      color: (page == index)
                          ? Color.fromRGBO(92, 195, 152, 1)
                          : Color.fromRGBO(245, 245, 255, 1),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

  bool inRange(int a, int b, int param) {
    return (param >= a && param <= b);
  }

  void changeSelected(int index) {
    setState(() {
      if (selected == index) {
        selected = 100;
      } else {
        selected = index;
      }
    });
  }
}
