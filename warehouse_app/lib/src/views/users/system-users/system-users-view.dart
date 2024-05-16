import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse_app/src/models/UpperCaseFormater.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';

late double vw;
late double h1;
late double h2;
int area = 0;
bool areaOpen = false;

class SystemUsersView extends StatefulWidget {
  SystemUsersView({Key? key}) : super(key: key);

  @override
  _SystemUsersViewState createState() => _SystemUsersViewState();
}

class _SystemUsersViewState extends State<SystemUsersView> {
  late var nameController;
  late var lastnameController;
  late var curpController;
  late var usernameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    lastnameController = TextEditingController();
    curpController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    lastnameController.dispose();
    curpController.dispose();
    usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtén el tamaño de la pantalla usando MediaQuery
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    vw = screenWidth / 100;
    h1 = 1.1 * vw;
    h2 = 1.4 * vw;

    return Scaffold(
      body: Row(
        children: [
          SideBar(pageIndex: 9),
          Container(
            width: 80 * vw,
            height: double.infinity,
            padding:
                EdgeInsets.symmetric(horizontal: 3.5 * vw, vertical: 2.5 * vw),
            child: ListView(
              children: [
                Stack(),
                Container(
                  width: 73 * vw,
                  height: 19.475 * vw + 37.4 * vw,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Text(
                            "System Users",
                            style: TextStyle(
                              fontSize: h2,
                              color: Color.fromRGBO(40, 40, 55, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 2 * vw),
                          Container(
                            width: 73 * vw,
                            height: 5.25 * vw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Input(
                                  controller: nameController,
                                  label: 'Name',
                                  caracters: 24,
                                  regExp: RegExp(r'[A-Za-z ]'),
                                ),
                                Input(
                                  controller: lastnameController,
                                  label: 'Lastname',
                                  caracters: 16,
                                  regExp: RegExp(r'[A-Za-z ]'),
                                ),
                                Input(
                                  controller: curpController,
                                  label: 'CURP',
                                  caracters: 18,
                                  regExp: RegExp(r'[A-Za-z0-9 ]'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.75 * vw),
                          Container(
                            width: 73 * vw,
                            height: 5.25 * vw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Input(
                                  controller: usernameController,
                                  label: 'Username',
                                  caracters: 24,
                                  regExp: RegExp(r'[A-Za-z0-9.@_ ]'),
                                ),
                                Container(
                                  width: 22 * vw,
                                  height: 5.25 * vw,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 0.5 * vw),
                                        child: Text(
                                          'Area',
                                          style: TextStyle(
                                            fontSize: h1,
                                            color:
                                                Color.fromRGBO(40, 40, 55, 1),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 22 * vw,
                                        height: 3.3 * vw,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1 * vw),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(245, 245, 255, 1),
                                          borderRadius:
                                              BorderRadius.circular(0.65 * vw),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'WAREHOUSE DEPARTMENT',
                                              style: TextStyle(
                                                fontSize: h1,
                                                color: Color.fromRGBO(
                                                    185, 185, 200, 1),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down_rounded,
                                              color: Color.fromRGBO(
                                                  185, 185, 200, 1),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 22 * vw,
                                  height: 5.25 * vw,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 0.5 * vw),
                                        child: Text(
                                          'Role',
                                          style: TextStyle(
                                            fontSize: h1,
                                            color:
                                                Color.fromRGBO(40, 40, 55, 1),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.75 * vw),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 19.475 * vw,
                        child: Container(
                          width: 73 * vw,
                          height: 37.4 * vw,
                          color: Color.fromRGBO(40, 40, 55, 1),
                        ),
                      ),
                      !areaOpen
                          ? Positioned(
                              left: 51 * vw,
                              right: 0 * vw,
                              top: 12.875 * vw,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    areaOpen = !areaOpen;
                                  });
                                },
                                child: Container(
                                  width: 22 * vw,
                                  height: 3.3 * vw,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1 * vw),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(235, 235, 245, 1),
                                    borderRadius:
                                        BorderRadius.circular(0.65 * vw),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Choose Role',
                                        style: TextStyle(
                                          fontSize: h1,
                                          color: Color.fromRGBO(40, 40, 55, 1),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: Color.fromRGBO(40, 40, 55, 1),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Positioned(
                              left: 51 * vw,
                              right: 0 * vw,
                              top: 12.875 * vw,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    areaOpen = !areaOpen;
                                  });
                                },
                                child: Container(
                                  width: 22 * vw,
                                  height: 3.3 * vw * 4,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1 * vw),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(235, 235, 245, 1),
                                    borderRadius:
                                        BorderRadius.circular(0.65 * vw),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Choose Area',
                                        style: TextStyle(
                                          fontSize: h1,
                                          color: Color.fromRGBO(40, 40, 55, 1),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: Color.fromRGBO(40, 40, 55, 1),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Input({
    required TextEditingController controller,
    required String label,
    required int caracters,
    required RegExp regExp,
  }) {
    return Container(
      width: 22 * vw,
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(regExp),
                LengthLimitingTextInputFormatter(caracters),
                UpperCaseTextFormatter(),
              ],
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
