import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Area.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Role.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';
import 'package:warehouse_app/src/models/User.dart';
import 'package:warehouse_app/src/widgets/Combobox.dart';
import 'package:warehouse_app/src/widgets/Input.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';

late double vw;
late User user;

class EditUsersView extends StatefulWidget {
  EditUsersView({super.key, required User user_}) {
    user = user_;
  }

  @override
  State<EditUsersView> createState() => _EditUsersViewState();
}

class _EditUsersViewState extends State<EditUsersView> {
  late var nameController;
  late var lastnameController;
  late var curpController;
  late var usernameController;
  late var emailController;
  late var passwordController;
  late var confirmPasswordController;
  late Role role;
  late bool roleOpen;
  late Area area;
  late bool areaOpen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: user.getName());
    lastnameController = TextEditingController(text: user.getLastname());
    curpController = TextEditingController(text: user.getCURP());
    usernameController = TextEditingController(text: user.getUsername());
    emailController = TextEditingController(text: user.getEmail());
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    role = user.getRole();
    roleOpen = false;
    area = user.getArea();
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
    passwordController.dispose();
    confirmPasswordController.dispose();
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
            child: ListView(children: [
              Container(
                width: 80 * vw,
                height: 50 * vw,
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
                              children: [
                                Text(
                                  "System Users",
                                  style: TextStyle(
                                    fontSize: MyFont(context).h3(),
                                    color: Color.fromRGBO(40, 40, 55, 1),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "   |   Edit",
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
                                onTap: () => showMessageBox(context),
                                child: Container(
                                  width: 12.5 * vw,
                                  height: 2.5 * vw,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1.4 * vw,
                                  ),
                                  decoration: BoxDecoration(
                                    color: (hovered)
                                        ? Color.fromRGBO(230, 63, 83, 1)
                                        : Color.fromRGBO(250, 83, 103, 1),
                                    borderRadius:
                                        BorderRadius.circular(0.65 * vw),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.person_remove,
                                        size: MyFont(context).h2(),
                                        color: Color.fromRGBO(245, 245, 255, 1),
                                      ),
                                      Text(
                                        'Delete User',
                                        style: TextStyle(
                                          fontSize: MyFont(context).h2(),
                                          color:
                                              Color.fromRGBO(245, 245, 255, 1),
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
                                      width: 25,
                                      caseType: 1,
                                      keyboardType: TextInputType.name)
                                  .build(context),
                              Input(
                                      controller: lastnameController,
                                      label: 'Lastname',
                                      caracters: 16,
                                      regExp: RegExp(r'[A-Za-z ]'),
                                      width: 25,
                                      caseType: 1,
                                      keyboardType: TextInputType.name)
                                  .build(context),
                              Input(
                                      controller: curpController,
                                      label: 'CURP',
                                      caracters: 18,
                                      regExp: RegExp(r'[A-Za-z0-9 ]'),
                                      width: 25,
                                      caseType: 1,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Input(
                                      controller: usernameController,
                                      label: 'Username',
                                      caracters: 24,
                                      regExp: RegExp(r'[A-Za-z0-9.@_]'),
                                      width: 25,
                                      caseType: 0,
                                      keyboardType: TextInputType.text)
                                  .build(context),
                              SizedBox(width: 2.5 * vw),
                              Input(
                                      controller: emailController,
                                      label: 'Email',
                                      caracters: 48,
                                      regExp: RegExp(r'[A-Za-z0-9@._]'),
                                      width: 25,
                                      caseType: 0,
                                      keyboardType: TextInputType.emailAddress)
                                  .build(context),
                            ],
                          ),
                        ),
                        SizedBox(height: 15 * vw),
                        Input(
                                controller: passwordController,
                                label: 'Password',
                                caracters: 48,
                                regExp:
                                    RegExp(r'[ A-Za-z0-9@._$#!¡?¿%&/+*;:-]'),
                                width: 25,
                                caseType: 0,
                                keyboardType: TextInputType.visiblePassword)
                            .build(context),
                        Input(
                                controller: confirmPasswordController,
                                label: 'Confirm Password',
                                caracters: 48,
                                regExp:
                                    RegExp(r'[ A-Za-z0-9@._$#!¡?¿%&/+*;:-]'),
                                width: 25,
                                caseType: 0,
                                keyboardType: TextInputType.visiblePassword)
                            .build(context),
                      ],
                    ),
                    Positioned(
                      left: 14.25 * vw,
                      right: 41.25 * vw,
                      top: 16 * vw,
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
                      width: 25,
                      height: 2.5,
                      left: 13.75,
                      right: 41.25,
                      top: 17.75,
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
                      top: 16 * vw,
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
                      width: 25,
                      height: 2.5,
                      left: 41.25,
                      right: 13.75,
                      top: 17.75,
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
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void showMessageBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure?',
            style: TextStyle(
              fontSize: MyFont(context).h2(),
              color: Color.fromRGBO(40, 40, 55, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Text(
            'When a user is deleted, all their assignments, exit passes, entry and exit records, among other data, will also be deleted.',
            style: TextStyle(
              fontSize: MyFont(context).h1(),
              color: Color.fromRGBO(125, 125, 140, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Delete',
                style: TextStyle(
                  fontSize: MyFont(context).h1(),
                  color: Color.fromRGBO(230, 63, 83, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: MyFont(context).h1(),
                  color: Color.fromRGBO(125, 125, 140, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
