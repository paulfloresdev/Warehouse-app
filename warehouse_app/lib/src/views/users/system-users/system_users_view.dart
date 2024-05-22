import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Role.dart';
import 'package:warehouse_app/src/models/Auxiliars/Router.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';
import 'package:warehouse_app/src/models/User.dart';
import 'package:warehouse_app/src/views/users/system-users/edit_users_view.dart';
import 'package:warehouse_app/src/widgets/Combobox.dart';
import 'package:warehouse_app/src/widgets/Input.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';

late double vw;

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
  late Role role;
  late bool roleOpen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    lastnameController = TextEditingController();
    curpController = TextEditingController();
    usernameController = TextEditingController();
    role = Role(id: 0, name: 'Choose Role');
    roleOpen = false;
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

    return Scaffold(
      body: Row(
        children: [
          SideBar(pageIndex: 9),
          Container(
            width: 85 * vw,
            height: double.infinity,
            color: Color.fromRGBO(253, 253, 255, 1),
            child: ListView(
              children: [
                Container(
                  width: 80 * vw,
                  height: 53.45 * vw,
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
                              Text(
                                "System Users",
                                style: TextStyle(
                                  fontSize: MyFont(context).h3(),
                                  color: Color.fromRGBO(40, 40, 55, 1),
                                  fontWeight: FontWeight.w600,
                                ),
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
                                Input(
                                  controller: nameController,
                                  label: 'Name',
                                  caracters: 24,
                                  regExp: RegExp(r'[A-Za-z ]'),
                                  width: 18.5,
                                  caseType: 1,
                                ).build(context),
                                Input(
                                  controller: lastnameController,
                                  label: 'Lastname',
                                  caracters: 16,
                                  regExp: RegExp(r'[A-Za-z ]'),
                                  width: 18.5,
                                  caseType: 1,
                                ).build(context),
                                Input(
                                  controller: curpController,
                                  label: 'CURP',
                                  caracters: 18,
                                  regExp: RegExp(r'[A-Za-z0-9 ]'),
                                  width: 18.5,
                                  caseType: 1,
                                ).build(context),
                                Input(
                                  controller: usernameController,
                                  label: 'Username',
                                  caracters: 24,
                                  regExp: RegExp(r'[A-Za-z0-9.@_ ]'),
                                  width: 18.5,
                                  caseType: 0,
                                ).build(context),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5 * vw),
                          Container(
                            width: 80 * vw,
                            height: 4.25 * vw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 18.5 * vw,
                                  height: 4.25 * vw,
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
                                            fontSize: MyFont(context).h2(),
                                            color:
                                                Color.fromRGBO(40, 40, 55, 1),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 18.5 * vw,
                                        height: 2.5 * vw,
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
                                                fontSize: MyFont(context).h2(),
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
                              ],
                            ),
                          ),
                          SizedBox(height: 1.75 * vw),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 16.5 * vw,
                        child: Container(
                          width: 80 * vw,
                          height: 57.1 * vw,
                          child: Column(
                            children: [
                              FutureBuilder<List<User>>(
                                  future: User().getAllUsers(),
                                  builder: (context,
                                      AsyncSnapshot<List<User>> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }
                                    if (!snapshot.hasData) {
                                      return CircularProgressIndicator();
                                    }
                                    List<User> users = snapshot.data!;
                                    return Column(
                                      children: [
                                        Container(
                                          width: 80 * vw,
                                          height: 2.7 * vw,
                                          padding: EdgeInsets.all(0.1 * vw),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                230, 230, 245, 1),
                                            borderRadius: BorderRadius.vertical(
                                                top:
                                                    Radius.circular(0.65 * vw)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //79.3
                                              Container(
                                                width: 18 * vw,
                                                height: 2.5 * vw,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      235, 235, 245, 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.65 * vw)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Name',
                                                    style: TextStyle(
                                                      fontSize:
                                                          MyFont(context).h2(),
                                                      color: Color.fromRGBO(
                                                          40, 40, 55, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //61.3
                                              Container(
                                                width: 14.3 * vw,
                                                height: 2.5 * vw,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      235, 235, 245, 1),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Lastname',
                                                    style: TextStyle(
                                                      fontSize:
                                                          MyFont(context).h2(),
                                                      color: Color.fromRGBO(
                                                          40, 40, 55, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //47
                                              Container(
                                                width: 9 * vw,
                                                height: 2.5 * vw,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      235, 235, 245, 1),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Role',
                                                    style: TextStyle(
                                                      fontSize:
                                                          MyFont(context).h2(),
                                                      color: Color.fromRGBO(
                                                          40, 40, 55, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //38
                                              Container(
                                                width: 16 * vw,
                                                height: 2.5 * vw,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      235, 235, 245, 1),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'CURP',
                                                    style: TextStyle(
                                                      fontSize:
                                                          MyFont(context).h2(),
                                                      color: Color.fromRGBO(
                                                          40, 40, 55, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //22
                                              Container(
                                                width: 14 * vw,
                                                height: 2.5 * vw,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      235, 235, 245, 1),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Username',
                                                    style: TextStyle(
                                                      fontSize:
                                                          MyFont(context).h2(),
                                                      color: Color.fromRGBO(
                                                          40, 40, 55, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //8
                                              Container(
                                                width: 8 * vw,
                                                height: 2.5 * vw,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      235, 235, 245, 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  0.65 * vw)),
                                                ),
                                              ),
                                              //0
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 80 * vw,
                                          height: 2.1 * vw * users.length,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                230, 230, 245, 1),
                                            borderRadius: BorderRadius.vertical(
                                                bottom:
                                                    Radius.circular(0.5 * vw)),
                                          ),
                                          child: ListView.builder(
                                              itemCount: users.length,
                                              itemBuilder: (context, index) {
                                                return TableRow(
                                                    index: index,
                                                    length: users.length,
                                                    user: users[index]);
                                              }),
                                        ),
                                        SizedBox(height: 0.5 * vw),
                                        Container(
                                          width: 80 * vw,
                                          height: 1.75 * vw,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              HoverOver(builder: (hovered) {
                                                return GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                      width: 1.75 * vw,
                                                      height: 1.75 * vw,
                                                      decoration: BoxDecoration(
                                                        color: (hovered)
                                                            ? Color.fromRGBO(
                                                                52, 155, 112, 1)
                                                            : Color.fromRGBO(92,
                                                                195, 152, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    0.65 * vw),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_back_ios_new_rounded,
                                                        size: MyFont(context)
                                                            .h1(),
                                                        color: Color.fromRGBO(
                                                            245, 245, 255, 1),
                                                      )),
                                                );
                                              }),
                                              SizedBox(width: 1.5 * vw),
                                              Text(
                                                '2 / 3',
                                                style: TextStyle(
                                                  fontSize:
                                                      MyFont(context).h1(),
                                                  color: Color.fromRGBO(
                                                      40, 40, 55, 1),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(width: 1.5 * vw),
                                              HoverOver(builder: (hovered) {
                                                return GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                      width: 1.75 * vw,
                                                      height: 1.75 * vw,
                                                      decoration: BoxDecoration(
                                                        color: (hovered)
                                                            ? Color.fromRGBO(
                                                                52, 155, 112, 1)
                                                            : Color.fromRGBO(92,
                                                                195, 152, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    0.65 * vw),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        size: MyFont(context)
                                                            .h1(),
                                                        color: Color.fromRGBO(
                                                            245, 245, 255, 1),
                                                      )),
                                                );
                                              }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21 * vw,
                        right: 6.6 * vw,
                        top: 10.25 * vw,
                        child: Text(
                          'Role',
                          style: TextStyle(
                            fontSize: MyFont(context).h2(),
                            color: Color.fromRGBO(40, 40, 55, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Combobox(
                        width: 18.5,
                        height: 2.5,
                        left: 20.5,
                        right: 41,
                        top: 12.0,
                        method: (role_value, open_value) {
                          setState(() {
                            role = role_value;
                            roleOpen = open_value;
                          });
                        },
                        open: roleOpen,
                        future: Role().getAllRoles(),
                        current_role: role,
                      ).build(context),
                      Positioned(
                        left: 41 * vw,
                        right: 36.5 * vw,
                        top: 12.0 * vw,
                        child: HoverOver(builder: (hovered) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: 2.5 * vw,
                                height: 2.5 * vw,
                                decoration: BoxDecoration(
                                  color: (hovered)
                                      ? Color.fromRGBO(52, 155, 112, 1)
                                      : Color.fromRGBO(92, 195, 152, 1),
                                  borderRadius:
                                      BorderRadius.circular(0.65 * vw),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.search_rounded,
                                    size: MyFont(context).h3(),
                                    color: Color.fromRGBO(245, 245, 255, 1),
                                  ),
                                )),
                          );
                        }),
                      )
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

  Widget TableRow(
      {required int index, required int length, required User user}) {
    return Container(
      width: 80 * vw,
      height: 2.1 * vw,
      padding: EdgeInsets.only(
        left: 0.1 * vw,
        right: 0.1 * vw,
        bottom: 0.1 * vw,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(230, 230, 245, 1),
        borderRadius: (index == length - 1)
            ? BorderRadius.vertical(bottom: Radius.circular(0.65 * vw))
            : BorderRadius.vertical(bottom: Radius.circular(0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //72.3
          //64.6
          Container(
            width: 18 * vw,
            height: 2 * vw,
            padding: EdgeInsets.all(0.15 * vw),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: (index == length - 1)
                  ? BorderRadius.only(bottomLeft: Radius.circular(0.65 * vw))
                  : BorderRadius.circular(0),
            ),
            child: Center(
              child: Text(
                user.getName(),
                style: TextStyle(
                  fontSize: MyFont(context).h2(),
                  color: Color.fromRGBO(40, 40, 55, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          //51.6
          Container(
            width: 14.3 * vw,
            height: 2 * vw,
            padding: EdgeInsets.all(0.15 * vw),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Center(
              child: Text(
                user.getLastname(),
                style: TextStyle(
                  fontSize: MyFont(context).h2(),
                  color: Color.fromRGBO(40, 40, 55, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          //38.6
          Container(
            width: 9 * vw,
            height: 2 * vw,
            padding: EdgeInsets.all(0.15 * vw),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Center(
              child: Text(
                user.getRole(),
                style: TextStyle(
                  fontSize: MyFont(context).h2(),
                  color: Color.fromRGBO(40, 40, 55, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          //29
          Container(
            width: 16 * vw,
            height: 2 * vw,
            padding: EdgeInsets.all(0.15 * vw),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Center(
              child: Text(
                user.getCURP(),
                style: TextStyle(
                  fontSize: MyFont(context).h2(),
                  color: Color.fromRGBO(40, 40, 55, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          //13
          Container(
            width: 14 * vw,
            height: 2 * vw,
            padding: EdgeInsets.all(0.15 * vw),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Center(
              child: Text(
                user.getUsername(),
                style: TextStyle(
                  fontSize: MyFont(context).h2(),
                  color: Color.fromRGBO(40, 40, 55, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            width: 8 * vw,
            height: 2 * vw,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: (index == length - 1)
                  ? BorderRadius.only(bottomRight: Radius.circular(0.65 * vw))
                  : BorderRadius.circular(0),
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
                        child: Icon(
                          Icons.edit_rounded,
                          size: 0.875 * vw,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          //0
        ],
      ),
    );
  }
}
