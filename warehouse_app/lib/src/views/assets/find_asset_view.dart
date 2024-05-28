import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';
import 'package:warehouse_app/src/widgets/Combobox.dart';
import 'package:warehouse_app/src/widgets/Input.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';

late double vw;

class FindAssetView extends StatefulWidget {
  const FindAssetView({super.key});

  @override
  State<FindAssetView> createState() => _FindAssetViewState();
}

class _FindAssetViewState extends State<FindAssetView> {
  late var barcodeController;
  late var nameController;
  late var brandController;
  late var modelController;
  late String category;
  late bool categoryOpen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    barcodeController = TextEditingController();
    nameController = TextEditingController();
    brandController = TextEditingController();
    modelController = TextEditingController();
    category = 'Choose Category';
    categoryOpen = false;
  }

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
                                    "Assets",
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
                          SizedBox(height: 2 * vw),
                          Container(
                            width: 80 * vw,
                            height: 4.25 * vw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Input(context).text(
                                  controller: barcodeController,
                                  label: 'Barcode',
                                  caracters: 20,
                                  regExp: RegExp(r'[0-9]'),
                                  width: 18.5,
                                  caseType: 1,
                                  keyboardType: TextInputType.name,
                                ),
                                Input(context).text(
                                  controller: nameController,
                                  label: 'Name',
                                  caracters: 64,
                                  regExp: RegExp(r'[A-Za-z 12]'),
                                  width: 18.5,
                                  caseType: 1,
                                  keyboardType: TextInputType.name,
                                ),
                                Input(context).text(
                                  controller: brandController,
                                  label: 'Brand',
                                  caracters: 64,
                                  regExp: RegExp(r'[A-Za-z0-9.@_ -#*+/()$%!]'),
                                  width: 18.5,
                                  caseType: 1,
                                  keyboardType: TextInputType.text,
                                ),
                                Input(context).text(
                                  controller: modelController,
                                  label: 'Model',
                                  caracters: 128,
                                  regExp: RegExp(r'[A-Za-z0-9.@_ -#*+/()$%!]'),
                                  width: 18.5,
                                  caseType: 0,
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5 * vw),
                        ],
                      ),
                      Positioned(
                        left: 21 * vw,
                        right: 40.5 * vw,
                        top: 10.25 * vw,
                        child: Text(
                          'Area',
                          style: TextStyle(
                            fontSize: MyFont(context).h2(),
                            color: Color.fromRGBO(40, 40, 55, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      /*Combobox(
                        enabled: true,
                        width: 18.5,
                        height: 2.5,
                        left: 20.5,
                        right: 41,
                        top: 12,
                        method: (area_value, open_value) {},
                        open: categoryOpen,
                        future: Area().getAllAreas(),
                        current: category,
                      ).build(context),*/
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
