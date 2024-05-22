import 'package:flutter/material.dart';
import 'package:warehouse_app/src/models/Role.dart';
import 'package:warehouse_app/src/models/User.dart';
import 'package:warehouse_app/src/widgets/Combobox.dart';
import 'package:warehouse_app/src/widgets/Input.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';

late double vw;
late double h1;
late double h2;
late double h3;
int area = 0;
List<String> roles = ['All', 'Admin', 'Editor', 'Receptionist'];
String role = 'Choose Role';
late User user;
late int counter;
late String tester;

class EditUsersView extends StatefulWidget {
  EditUsersView({super.key, required User user_}) {
    user = user_;
    counter = 0;
    tester = 'TEST';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    lastnameController = TextEditingController();
    curpController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtén el tamaño de la pantalla usando MediaQuery
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    vw = screenWidth / 100;
    h1 = 1.1 * vw;
    h2 = 1.4 * vw;
    h3 = 0.9 * vw;

    return Scaffold(
      body: Row(
        children: [
          SideBar(pageIndex: 9),
          Container(
            width: 80 * vw,
            height: double.infinity,
            child: ListView(children: [
              Container(
                width: 73 * vw,
                height: 50 * vw,
                margin: EdgeInsets.symmetric(
                    horizontal: 3.5 * vw, vertical: 2.5 * vw),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "System Users",
                              style: TextStyle(
                                fontSize: h2,
                                color: Color.fromRGBO(40, 40, 55, 1),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "   |   Edit",
                              style: TextStyle(
                                fontSize: h1,
                                color: Color.fromRGBO(125, 125, 140, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: 16.5 * vw,
                              height: 3.3 * vw,
                            )
                          ],
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
                                width: 22,
                                caseType: 1,
                              ).build(context),
                              Input(
                                controller: nameController,
                                label: 'Name',
                                caracters: 24,
                                regExp: RegExp(r'[A-Za-z ]'),
                                width: 22,
                                caseType: 1,
                              ).build(context),
                              Input(
                                controller: nameController,
                                label: 'Name',
                                caracters: 24,
                                regExp: RegExp(r'[A-Za-z ]'),
                                width: 22,
                                caseType: 1,
                              ).build(context),
                            ],
                          ),
                        ),
                        SizedBox(height: 2 * vw),
                      ],
                    ),
                    Combobox(
                      width: 19.8,
                      height: 3.3,
                      left: 46.2,
                      right: 6.6,
                      top: 14.25,
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
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
