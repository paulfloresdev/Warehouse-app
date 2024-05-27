import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';

late double vw;

class FindAssetView extends StatefulWidget {
  const FindAssetView({super.key});

  @override
  State<FindAssetView> createState() => _FindAssetViewState();
}

class _FindAssetViewState extends State<FindAssetView> {
  @override
  Widget build(BuildContext context) {
    vw = Responsive(context).viewportWidth;

    return Scaffold(
      body: Row(
        children: [
          SideBar(pageIndex: 1),
          Container(
            width: 85 * vw,
            height: double.infinity,
            color: Color.fromRGBO(253, 253, 255, 1),
            child: ListView(
              children: [
                Container(
                    width: 80 * vw,
                  height: 53.95 * vw,
                  margin: EdgeInsets.only(
                    left: 2.5 * vw,
                    right: 2.5 * vw,
                    top: 2.5 * vw,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Warehouse",
                                    style: TextStyle(
                                      fontSize: MyFont(context).h3(),
                                      color: Color.fromRGBO(40, 40, 55, 1),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "   |   Find Asset",
                                    style: TextStyle(
                                      fontSize: MyFont(context).h2(),
                                      color: Color.fromRGBO(125, 125, 140, 1),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              
                              HoverOver(builder: (hovered) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 12.5 * vw,
                                    height: 2.5 * vw,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.4 * vw,
                                    ),
                                    decoration: BoxDecoration(
                                      color: (hovered)
                                          ? Color.fromRGBO(52, 155, 112, 1)
                                          : Color.fromRGBO(92, 195, 152, 1),
                                      borderRadius:
                                          BorderRadius.circular(0.65 * vw),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: MyFont(context).h2(),
                                          color:
                                              Color.fromRGBO(245, 245, 255, 1),
                                        ),
                                        Text(
                                          'Add User',
                                          style: TextStyle(
                                            fontSize: MyFont(context).h2(),
                                            color: Color.fromRGBO(
                                                245, 245, 255, 1),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add,
                                          size: MyFont(context).h2(),
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}