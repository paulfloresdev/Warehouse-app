import 'package:flutter/material.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';
import 'package:warehouse_app/src/widgets/CustomButton.dart';
import 'package:warehouse_app/src/widgets/Input.dart';

late double vw;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late var usernameController;
  late var passwordController;
  late bool passObscure;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    passObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    vw = Responsive(context).viewportWidth;

    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 225, 245, 1),
      body: Center(
        child: Container(
          width: 41.5 * vw,
          height: 30 * vw,
          decoration: BoxDecoration(
            color: Color.fromRGBO(253, 253, 255, 1),
            borderRadius: BorderRadius.circular(0.65 * vw),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(185, 185, 205, 0.33),
                spreadRadius: 2.5,
                blurRadius: 20,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 18 * vw,
                height: 30 * vw,
                
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(0.65 * vw)),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 18 * vw,
                      height: 30 * vw,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(0.65 * vw)),
                      ),
                      child: Image.asset(
                        'assets/img/banner.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 18 * vw,
                      height: 30 * vw,
                      padding: EdgeInsets.only(top: 4.5*vw, bottom: 1.5*vw),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(0.65 * vw)),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(52, 155, 112, 0.9),
                            Color.fromRGBO(52, 112, 155, 0.9),
                            Color.fromRGBO(52, 112, 155, 0.9),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 7.5*vw,
                                height: 7.5*vw,
                                child: Image.asset(
                                  'assets/img/WHITE.png',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(height: 0.25*vw),
                              Text(
                                "Warehouse Manager",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 1.6*vw,
                                  color: Color.fromRGBO(253, 253, 255, 1),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Designed by",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: MyFont(context).h1(),
                                  color: Color.fromRGBO(253, 253, 255, 1),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: 0.25*vw),
                              Text(
                                "Paul Flores",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: MyFont(context).h1(),
                                  color: Color.fromRGBO(253, 253, 255, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
              Container(
                width: 23.5 * vw,
                height: 30 * vw,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2719306979.
                padding: EdgeInsets.symmetric(vertical: 2*vw, horizontal: 2.5*vw),
                child: Column(
                  children: [
                    Text(
                      "Sign in to Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MyFont(context).h3(),
                        color: Color.fromRGBO(40, 40, 55, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2*vw),
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
                    SizedBox(height: 2*vw),
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
                    SizedBox(height: 0.5*vw),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            width: 7*vw,
                            height: 1.2*vw,
                            margin: EdgeInsets.only(left: 0.5*vw),
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                fontSize: MyFont(context).h1(),
                                color: Color.fromRGBO(40, 40, 55, 1),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3*vw),
                    CustomButton(context).regular(
                      size: Size(9.25, 2.5),
                      padding: EdgeInsets.zero,
                      backgroundColor: Color.fromRGBO(50, 50, 70, 1),
                      textColor: Color.fromRGBO(
                          245, 245, 255, 1),
                      textSize: MyFont(context).h1(),
                      onTap: () {},
                      label: 'Sing In',
                      icon: Icons.save,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
