import 'package:flutter/material.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';

class PassValidator {
  late BuildContext context;
  late double vw;
  late bool param;
  late String description;

  PassValidator({
    required this.context,
    bool? param,
    String? description,
  }) {
    vw = Responsive(context).viewportWidth;

    this.param = param ?? false;
    this.description = description ?? 'Validation';
  }

  bool get getParam => param;
  String get getDescription => description;

  void setParam(bool p) {
    param = p;
  }

  List<PassValidator> getParams() {
    List<PassValidator> items = [
      PassValidator(
        context: context,
        param: false,
        description: 'The password must be at least 8 characters long.',
      ),
      PassValidator(
        context: context,
        param: false,
        description: 'The password must not exceed 128 characters.',
      ),
      PassValidator(
        context: context,
        param: false,
        description:
            'The password must contain at least one uppercase letter (A-Z).',
      ),
      PassValidator(
        context: context,
        param: false,
        description:
            'The password must contain at least one lowercase letter (a-z).',
      ),
      PassValidator(
        context: context,
        param: false,
        description: 'The password must contain at least one digit (0-9).',
      ),
      PassValidator(
        context: context,
        param: false,
        description:
            'The password must contain at least one special character (e.g., !, @, #, \$, %, ^, &, *).',
      ),
      PassValidator(
        context: context,
        param: false,
        description: 'The password must not contain spaces.',
      ),
      PassValidator(
        context: context,
        param: false,
        description: 'The password and confirm password fields must match.',
      ),
    ];

    return items;
  }

  Widget widget({
    required Size size,
    required double textSize,
  }) {
    return Container(
      width: size.width * vw,
      height: size.height * vw,
      child: Row(
        children: [
          Container(
            width: size.height * vw,
            height: size.height * vw,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (this.param)
                  ? Color.fromRGBO(92, 195, 152, 1)
                  : Color.fromRGBO(210, 210, 220, 1),
            ),
            child: Center(
              child: Icon(
                Icons.check_rounded,
                size: size.height * vw * 0.75,
                color: Color.fromRGBO(245, 245, 255, 1),
              ),
            ),
          ),
          SizedBox(width: size.height * vw * 0.5),
          Text(
            this.description,
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}
