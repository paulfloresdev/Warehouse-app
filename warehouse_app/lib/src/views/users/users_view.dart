import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Area.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Role.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';
import 'package:warehouse_app/src/models/User.dart';
import 'package:warehouse_app/src/widgets/Combobox.dart';
import 'package:warehouse_app/src/widgets/Input.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';
import 'package:warehouse_app/src/widgets/tables/RowAlignment.dart';
import 'package:warehouse_app/src/widgets/tables/UserTable.dart';

late double vw;

class UsersView extends StatefulWidget {
  UsersView({Key? key}) : super(key: key);

  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late var nameController;
  late var lastnameController;
  late var curpController;
  late var usernameController;
  late var emailController;
  late Role role;
  late bool roleOpen;
  late Area area;
  late bool areaOpen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    lastnameController = TextEditingController();
    curpController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    role = Role(id: 0, name: 'Choose role');
    roleOpen = false;
    area = Area(id: 0, name: 'Choose area');
    areaOpen = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    lastnameController.dispose();
    curpController.dispose();
    usernameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    vw = Responsive(context).viewportWidth;

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
                                        keyboardType: TextInputType.name)
                                    .build(context),
                                Input(
                                        controller: lastnameController,
                                        label: 'Lastname',
                                        caracters: 16,
                                        regExp: RegExp(r'[A-Za-z ]'),
                                        width: 18.5,
                                        caseType: 1,
                                        keyboardType: TextInputType.name)
                                    .build(context),
                                Input(
                                        controller: curpController,
                                        label: 'CURP',
                                        caracters: 18,
                                        regExp: RegExp(r'[A-Za-z0-9 ]'),
                                        width: 18.5,
                                        caseType: 1,
                                        keyboardType: TextInputType.text)
                                    .build(context),
                                Input(
                                        controller: usernameController,
                                        label: 'Username',
                                        caracters: 24,
                                        regExp: RegExp(r'[A-Za-z0-9.@_ ]'),
                                        width: 18.5,
                                        caseType: 0,
                                        keyboardType: TextInputType.text)
                                    .build(context),
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
                                Input(
                                        controller: emailController,
                                        label: 'Email',
                                        caracters: 48,
                                        regExp: RegExp(r'[A-Za-z0-9@._]'),
                                        width: 18.5,
                                        caseType: 0,
                                        keyboardType:
                                            TextInputType.emailAddress)
                                    .build(context),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 17 * vw,
                        child: Container(
                          width: 80 * vw,
                          height: 57.1 * vw,
                          child: FutureBuilder<List<User>>(
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
                                return Container(
                                  width: 80 * vw,
                                  height: 57.1 * vw,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 80 * vw,
                                        height:
                                            (2.7 + (2.1 * users.length)) * vw,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          physics: ScrollPhysics(),
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  width: 108.2 * vw,
                                                  height: 2.7 * vw,
                                                  padding:
                                                      EdgeInsets.all(0.1 * vw),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        230, 230, 245, 1),
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    0.65 * vw)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      //79.3
                                                      UserTable(context)
                                                          .textRow(
                                                        size: Size(8, 2.5),
                                                        rowAlignment:
                                                            RowAlignment(
                                                                    context)
                                                                .topLeft,
                                                        color: Color.fromRGBO(
                                                            235, 235, 245, 1),
                                                        textStyle:
                                                            UserTable(context)
                                                                .header,
                                                        label: '',
                                                      ),
                                                      UserTable(context)
                                                          .textRow(
                                                        size: Size(18, 2.5),
                                                        rowAlignment:
                                                            RowAlignment(
                                                                    context)
                                                                .center,
                                                        color: Color.fromRGBO(
                                                            235, 235, 245, 1),
                                                        textStyle:
                                                            UserTable(context)
                                                                .header,
                                                        label: 'Name',
                                                      ),
                                                      //61.3
                                                      UserTable(context)
                                                          .textRow(
                                                        size: Size(14.3, 2.5),
                                                        rowAlignment:
                                                            RowAlignment(
                                                                    context)
                                                                .center,
                                                        color: Color.fromRGBO(
                                                            235, 235, 245, 1),
                                                        textStyle:
                                                            UserTable(context)
                                                                .header,
                                                        label: 'Lastname',
                                                      ),
                                                      //47
                                                      UserTable(context)
                                                          .textRow(
                                                        size: Size(14, 2.5),
                                                        rowAlignment:
                                                            RowAlignment(
                                                                    context)
                                                                .center,
                                                        color: Color.fromRGBO(
                                                            235, 235, 245, 1),
                                                        textStyle:
                                                            UserTable(context)
                                                                .header,
                                                        label: 'Area',
                                                      ),
                                                      UserTable(context)
                                                          .textRow(
                                                        size: Size(9, 2.5),
                                                        rowAlignment:
                                                            RowAlignment(
                                                                    context)
                                                                .center,
                                                        color: Color.fromRGBO(
                                                            235, 235, 245, 1),
                                                        textStyle:
                                                            UserTable(context)
                                                                .header,
                                                        label: 'Role',
                                                      ),
                                                      //38
                                                      UserTable(context)
                                                          .textRow(
                                                        size: Size(16, 2.5),
                                                        rowAlignment:
                                                            RowAlignment(
                                                                    context)
                                                                .center,
                                                        color: Color.fromRGBO(
                                                            235, 235, 245, 1),
                                                        textStyle:
                                                            UserTable(context)
                                                                .header,
                                                        label: 'CURP',
                                                      ),
                                                      //22
                                                      UserTable(context)
                                                          .textRow(
                                                        size: Size(14, 2.5),
                                                        rowAlignment:
                                                            RowAlignment(
                                                                    context)
                                                                .topRight,
                                                        color: Color.fromRGBO(
                                                            235, 235, 245, 1),
                                                        textStyle:
                                                            UserTable(context)
                                                                .header,
                                                        label: 'Email',
                                                      ),
                                                      UserTable(context)
                                                          .textRow(
                                                        size: Size(14, 2.5),
                                                        rowAlignment:
                                                            RowAlignment(
                                                                    context)
                                                                .topRight,
                                                        color: Color.fromRGBO(
                                                            235, 235, 245, 1),
                                                        textStyle:
                                                            UserTable(context)
                                                                .header,
                                                        label: 'Username',
                                                      ),
                                                      //8

                                                      //0
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 108.2 * vw,
                                                  height:
                                                      2.1 * vw * users.length,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        230, 230, 245, 1),
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            bottom:
                                                                Radius.circular(
                                                                    0.5 * vw)),
                                                  ),
                                                  child: ListView.builder(
                                                      itemCount: users.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return TableRow(
                                                            index: index,
                                                            length:
                                                                users.length,
                                                            user: users[index]);
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
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
                                                          : Color.fromRGBO(
                                                              92, 195, 152, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.65 * vw),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_back_ios_new_rounded,
                                                      size:
                                                          MyFont(context).h1(),
                                                      color: Color.fromRGBO(
                                                          245, 245, 255, 1),
                                                    )),
                                              );
                                            }),
                                            SizedBox(width: 1.5 * vw),
                                            Text(
                                              '2 / 3',
                                              style: TextStyle(
                                                fontSize: MyFont(context).h1(),
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
                                                          : Color.fromRGBO(
                                                              92, 195, 152, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.65 * vw),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      size:
                                                          MyFont(context).h1(),
                                                      color: Color.fromRGBO(
                                                          245, 245, 255, 1),
                                                    )),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
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
                      Combobox(
                        enabled: true,
                        width: 18.5,
                        height: 2.5,
                        left: 20.5,
                        right: 41,
                        top: 12,
                        method: (area_value, open_value) {
                          setState(() {
                            if (area.getId() == 9 && area_value.getId() != 9) {
                              role = Role(id: 4, name: 'Employee');
                            }
                            if (area.getId() != 9 && area_value.getId() == 9) {
                              role = Role(id: 0, name: 'Choose role');
                            }

                            area = area_value;
                            areaOpen = open_value;
                          });
                        },
                        open: areaOpen,
                        future: Area().getAllAreas(),
                        current: area,
                      ).build(context),
                      Positioned(
                        left: 41.75 * vw,
                        right: 13.75 * vw,
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
                        enabled: (area.getId() == 9 || area.getId() == 0),
                        width: 18.5,
                        height: 2.5,
                        left: 41,
                        right: 20.5,
                        top: 12,
                        method: (role_value, open_value) {
                          setState(() {
                            role = role_value;
                            roleOpen = open_value;
                          });
                        },
                        open: roleOpen,
                        future: Role().getAllRoles(),
                        current: role,
                      ).build(context),
                      Positioned(
                        left: 61.5 * vw,
                        right: 16 * vw,
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
      width: 108.2 * vw,
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
          UserTable(context).buttonRow(
            size: Size(8, 2),
            rowAlignment: (index == length - 1)
                ? RowAlignment(context).bottomLeft
                : RowAlignment(context).center,
            color: Color.fromRGBO(255, 255, 255, 1),
            textStyle: UserTable(context).row,
            user: user,
          ),
          UserTable(context).textRow(
            size: Size(18, 2),
            rowAlignment: RowAlignment(context).center,
            color: Color.fromRGBO(255, 255, 255, 1),
            textStyle: UserTable(context).row,
            label: user.getName(),
          ),
          UserTable(context).textRow(
            size: Size(14.3, 2),
            rowAlignment: RowAlignment(context).center,
            color: Color.fromRGBO(255, 255, 255, 1),
            textStyle: UserTable(context).row,
            label: user.getLastname(),
          ),
          UserTable(context).textRow(
            size: Size(14, 2),
            rowAlignment: RowAlignment(context).center,
            color: Color.fromRGBO(255, 255, 255, 1),
            textStyle: UserTable(context).row,
            label: user.getArea().getName(),
          ),
          UserTable(context).textRow(
            size: Size(9, 2),
            rowAlignment: RowAlignment(context).center,
            color: Color.fromRGBO(255, 255, 255, 1),
            textStyle: UserTable(context).row,
            label: user.getRole().getName(),
          ),
          UserTable(context).textRow(
            size: Size(16, 2),
            rowAlignment: RowAlignment(context).center,
            color: Color.fromRGBO(255, 255, 255, 1),
            textStyle: UserTable(context).row,
            label: user.getCURP(),
          ),
          UserTable(context).textRow(
            size: Size(14, 2),
            rowAlignment: (index == length - 1)
                ? RowAlignment(context).bottomRight
                : RowAlignment(context).center,
            color: Color.fromRGBO(255, 255, 255, 1),
            textStyle: UserTable(context).row,
            label: user.email,
          ),
          UserTable(context).textRow(
            size: Size(14, 2),
            rowAlignment: (index == length - 1)
                ? RowAlignment(context).bottomRight
                : RowAlignment(context).center,
            color: Color.fromRGBO(255, 255, 255, 1),
            textStyle: UserTable(context).row,
            label: user.getUsername(),
          ),
        ],
      ),
    );
  }
}
