import 'package:flutter/material.dart';
import 'package:warehouse_app/src/models/Area.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Auxiliars/Router.dart';
import 'package:warehouse_app/src/models/PassValidator.dart';
import 'package:warehouse_app/src/models/Role.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';
import 'package:warehouse_app/src/models/User.dart';
import 'package:warehouse_app/src/views/users/users_view.dart';
import 'package:warehouse_app/src/widgets/Combobox.dart';
import 'package:warehouse_app/src/widgets/CustomButton.dart';
import 'package:warehouse_app/src/widgets/Input.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';

late double vw;
late User user;
late List<PassValidator> validators;
late List<bool> params;

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
  late bool passObscure;
  late bool passConfirmationObscure;

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
    passObscure = true;
    passConfirmationObscure = true;
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
    validators = PassValidator(context: context).getDescriptions();
    params = [false, false, false, false, false, false, false, false];

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
                height: 48.75 * vw,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  Routes(context).goTo(UsersView()),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: MyFont(context).h3(),
                                color: Color.fromRGBO(40, 40, 55, 1),
                              ),
                            ),
                            SizedBox(width: 0.5 * vw),
                            Text(
                              "Users",
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
                        SizedBox(height: 2 * vw),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 39 * vw,
                              height: 40 * vw,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 2.5 * vw,
                                          ),
                                          Text(
                                            "Data",
                                            style: TextStyle(
                                              fontSize: MyFont(context).h2(),
                                              color: Color.fromRGBO(
                                                  125, 125, 140, 1),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Container(
                                            height: 2.5 * vw,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 1.5 * vw),
                                      Container(
                                        width: 39 * vw,
                                        height: 4.25 * vw,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Input(context).text(
                                              controller: nameController,
                                              label: 'Name',
                                              caracters: 24,
                                              regExp: RegExp(r'[A-Za-z ]'),
                                              width: 18.5,
                                              caseType: 1,
                                              keyboardType: TextInputType.name,
                                            ),
                                            Input(context).text(
                                              controller: lastnameController,
                                              label: 'Lastname',
                                              caracters: 16,
                                              regExp: RegExp(r'[A-Za-z ]'),
                                              width: 18.5,
                                              caseType: 1,
                                              keyboardType: TextInputType.name,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 1.5 * vw),
                                      Container(
                                        width: 39 * vw,
                                        height: 4.25 * vw,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Input(context).text(
                                              controller: curpController,
                                              label: 'CURP',
                                              caracters: 18,
                                              regExp: RegExp(r'[A-Za-z0-9 ]'),
                                              width: 18.5,
                                              caseType: 1,
                                              keyboardType: TextInputType.text,
                                            ),
                                            Input(context).text(
                                              controller: usernameController,
                                              label: 'Username',
                                              caracters: 24,
                                              regExp:
                                                  RegExp(r'[A-Za-z0-9.@_ ]'),
                                              width: 18.5,
                                              caseType: 0,
                                              keyboardType: TextInputType.text,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 1.5 * vw),
                                      Container(
                                        width: 39 * vw,
                                        height: 4.25 * vw,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Input(context).text(
                                              controller: emailController,
                                              label: 'Email',
                                              caracters: 48,
                                              regExp: RegExp(r'[A-Za-z0-9@._]'),
                                              width: 18.5,
                                              caseType: 0,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 9 * vw),
                                      Container(
                                        width: 39 * vw,
                                        height: 2.5 * vw,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomButtom(context).regular(
                                              size: Size(7.5, 2.5),
                                              padding: EdgeInsets.zero,
                                              backgroundColor: Color.fromRGBO(
                                                  92, 195, 152, 1),
                                              textColor: Color.fromRGBO(
                                                  245, 245, 255, 1),
                                              textSize: MyFont(context).h1(),
                                              onTap: () {},
                                              label: 'Save',
                                              icon: Icons.save,
                                            ),
                                            SizedBox(width: 0.675 * vw),
                                            CustomButtom(context).onlyIcon(
                                              size: Size(3.175, 2.5),
                                              padding: EdgeInsets.zero,
                                              backgroundColor: Color.fromRGBO(
                                                  250, 83, 103, 1),
                                              iconColor: Color.fromRGBO(
                                                  245, 245, 255, 1),
                                              iconSize: 1.35 * vw,
                                              onTap: () {},
                                              icon: Icons.delete,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    left: 0.5 * vw,
                                    right: 20.5 * vw,
                                    top: 21.25 * vw,
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
                                    left: 0,
                                    right: 20.5,
                                    top: 23,
                                    method: (area_value, open_value) {
                                      setState(() {
                                        if (area.getId() == 9 &&
                                            area_value.getId() != 9) {
                                          role = Role(id: 4, name: 'Employee');
                                        }
                                        if (area.getId() != 9 &&
                                            area_value.getId() == 9) {
                                          role =
                                              Role(id: 0, name: 'Choose role');
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
                                    left: 21 * vw,
                                    right: 0 * vw,
                                    top: 21.25 * vw,
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
                                    enabled: (area.getId() == 9 ||
                                        area.getId() == 0),
                                    width: 18.5,
                                    height: 2.5,
                                    left: 20.5,
                                    right: 0,
                                    top: 23,
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
                            Container(
                              width: 0.25 * vw,
                              height: 40 * vw,
                              color: Color.fromRGBO(235, 235, 245, 1),
                            ),
                            Container(
                                width: 39 * vw,
                                height: 40 * vw,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 2.5 * vw,
                                        ),
                                        Text(
                                          "Security",
                                          style: TextStyle(
                                            fontSize: MyFont(context).h2(),
                                            color: Color.fromRGBO(
                                                125, 125, 140, 1),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          height: 2.5 * vw,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 1.5 * vw),
                                    Container(
                                      width: 39 * vw,
                                      height: 4.25 * vw,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Input(context).password(
                                            onChanged: (c) {
                                              setState(() {
                                                print(c.text);
                                                passwordController = c;
                                              });
                                            },
                                            controller: passwordController,
                                            changeObscure: (ob) {
                                              setState(() {
                                                passObscure = ob;
                                              });
                                            },
                                            obscureText: passObscure,
                                            label: 'Password',
                                            caracters: 48,
                                            regExp: RegExp(
                                                r'[ A-Za-z0-9@._$#!¡?¿%&/+*;:-]'),
                                            width: 18.5,
                                            caseType: 4,
                                          ),
                                          Input(context).password(
                                            onChanged: (c) {
                                              setState(() {
                                                print(c.text);
                                                confirmPasswordController = c;
                                              });
                                            },
                                            controller:
                                                confirmPasswordController,
                                            changeObscure: (ob) {
                                              setState(() {
                                                passConfirmationObscure = ob;
                                              });
                                            },
                                            obscureText:
                                                passConfirmationObscure,
                                            label: 'Confirm Password',
                                            caracters: 48,
                                            regExp: RegExp(
                                                r'[ A-Za-z0-9@._$#!¡?¿%&/+*;:-]'),
                                            width: 18.5,
                                            caseType: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1.5 * vw),
                                    validators[0].widget(
                                      size: Size(39, 1.25),
                                      textSize: MyFont(context).h1(),
                                      condition: PassValidator(context: context)
                                          .getParams(
                                        index: 0,
                                        c1: passwordController,
                                        c2: confirmPasswordController,
                                      ),
                                    ),
                                    SizedBox(height: 1 * vw),
                                    validators[1].widget(
                                      size: Size(39, 1.25),
                                      textSize: MyFont(context).h1(),
                                      condition: PassValidator(context: context)
                                          .getParams(
                                        index: 1,
                                        c1: passwordController,
                                        c2: confirmPasswordController,
                                      ),
                                    ),
                                    SizedBox(height: 1 * vw),
                                    validators[2].widget(
                                      size: Size(39, 1.25),
                                      textSize: MyFont(context).h1(),
                                      condition: PassValidator(context: context)
                                          .getParams(
                                        index: 2,
                                        c1: passwordController,
                                        c2: confirmPasswordController,
                                      ),
                                    ),
                                    SizedBox(height: 1 * vw),
                                    validators[3].widget(
                                      size: Size(39, 1.25),
                                      textSize: MyFont(context).h1(),
                                      condition: PassValidator(context: context)
                                          .getParams(
                                        index: 3,
                                        c1: passwordController,
                                        c2: confirmPasswordController,
                                      ),
                                    ),
                                    SizedBox(height: 1 * vw),
                                    validators[4].widget(
                                      size: Size(39, 1.25),
                                      textSize: MyFont(context).h1(),
                                      condition: PassValidator(context: context)
                                          .getParams(
                                        index: 4,
                                        c1: passwordController,
                                        c2: confirmPasswordController,
                                      ),
                                    ),
                                    SizedBox(height: 1 * vw),
                                    validators[5].widget(
                                      size: Size(39, 1.25),
                                      textSize: MyFont(context).h1(),
                                      condition: PassValidator(context: context)
                                          .getParams(
                                        index: 5,
                                        c1: passwordController,
                                        c2: confirmPasswordController,
                                      ),
                                    ),
                                    SizedBox(height: 1 * vw),
                                    validators[6].widget(
                                      size: Size(39, 1.25),
                                      textSize: MyFont(context).h1(),
                                      condition: PassValidator(context: context)
                                          .getParams(
                                        index: 6,
                                        c1: passwordController,
                                        c2: confirmPasswordController,
                                      ),
                                    ),
                                    SizedBox(height: 1 * vw),
                                    validators[7].widget(
                                      size: Size(39, 1.25),
                                      textSize: MyFont(context).h1(),
                                      condition: PassValidator(context: context)
                                          .getParams(
                                        index: 7,
                                        c1: passwordController,
                                        c2: confirmPasswordController,
                                      ),
                                    ),
                                    SizedBox(height: 2 * vw),
                                    CustomButtom(context).regular(
                                      size: Size(10, 2.5),
                                      padding: EdgeInsets.zero,
                                      backgroundColor:
                                          Color.fromRGBO(92, 195, 152, 1),
                                      textColor:
                                          Color.fromRGBO(245, 245, 255, 1),
                                      textSize: MyFont(context).h1(),
                                      onTap: () {},
                                      label: 'Update password',
                                      icon: Icons.save,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
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
