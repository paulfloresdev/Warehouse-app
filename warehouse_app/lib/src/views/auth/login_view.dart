import 'package:flutter/material.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';
import 'package:warehouse_app/src/models/Themes/MyFont.dart';

late double vw;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    vw = Responsive(context).viewportWidth;

    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 245, 1),
      body: Center(
        child: Container(
          width: 60 * vw,
          height: 40 * vw,
          decoration: BoxDecoration(
            color: Color.fromRGBO(253, 253, 255, 1),
            borderRadius: BorderRadius.circular(0.65 * vw),
          ),
          child: Row(
            children: [
              Container(
                width: 25 * vw,
                height: 40 * vw,
                padding: EdgeInsets.symmetric(vertical: 2 * vw),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(0.65 * vw)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(92, 195, 152, 1),
                      Color.fromRGBO(52, 155, 112, 1),
                      Color.fromRGBO(52, 112, 155, 1),
                      Color.fromRGBO(52, 112, 155, 1),
                      Color.fromRGBO(92, 152, 195, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(205, 205, 215, 0.33),
                      spreadRadius: 2.5,
                      blurRadius: 20,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 2 * vw),
                        Icon(
                          Icons.warehouse_rounded,
                          size: 5 * vw,
                          color: Color.fromRGBO(253, 253, 255, 1),
                        ),
                        SizedBox(height: 0.5 * vw),
                        Text(
                          "Warehouse System",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 1.8 * vw,
                            color: Color.fromRGBO(253, 253, 255, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 0.1 * vw),
                        Text(
                          "KEI BCS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 1.2 * vw,
                            color: Color.fromRGBO(253, 253, 255, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Developed by",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 1 * vw,
                            color: Color.fromRGBO(253, 253, 255, 1),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "Paul Flores",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 1 * vw,
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
      ),
    );
  }
}
