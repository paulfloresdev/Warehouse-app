import 'package:flutter/material.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';

class PassValidator {
  late BuildContext context;
  late double vw;
  late String description;

  PassValidator({
    required this.context,
    String? description,
  }) {
    vw = Responsive(context).viewportWidth;

    this.description = description ?? 'Validation';
  }

  String get getDescription => description;

  List<PassValidator> getDescriptions() {
    List<PassValidator> items = [
      PassValidator(
        context: context,
        description: 'The password must be at least 8 characters long.',
      ),
      PassValidator(
        context: context,
        description: 'The password must not exceed 128 characters.',
      ),
      PassValidator(
        context: context,
        description:
            'The password must contain at least one uppercase letter (A-Z).',
      ),
      PassValidator(
        context: context,
        description:
            'The password must contain at least one lowercase letter (a-z).',
      ),
      PassValidator(
        context: context,
        description: 'The password must contain at least one digit (0-9).',
      ),
      PassValidator(
        context: context,
        description:
            'The password must contain at least one special character (e.g., !, @, #, \$, %, ^, &, *).',
      ),
      PassValidator(
        context: context,
        description: 'The password must not contain spaces.',
      ),
      PassValidator(
        context: context,
        description: 'The password and confirm password fields must match.',
      ),
    ];

    return items;
  }

  bool getParams({
    required int index,
    required TextEditingController c1,
    required TextEditingController c2,
  }) {
    List<bool> params = [
      c1.text.length > 7,
      c1.text.length > 7 && c1.text.length < 129,
      c1.text.contains(RegExp(r'[A-Z]')),
      c1.text.contains(RegExp(r'[a-z]')),
      c1.text.contains(RegExp(r'[0-9]')),
      c1.text.contains(RegExp(r'[!@#\$%\^&*]')),
      (!c1.text.contains(RegExp(r'\s'))) && c1.text.isNotEmpty,
      c1.text == c2.text && c1.text.isNotEmpty,
    ];

    return params[index];
  }

  Widget widget({
    required Size size,
    required double textSize,
    required bool condition,
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
              color: (condition)
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
