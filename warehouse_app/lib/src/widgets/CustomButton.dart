import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';

class CustomButton {
  late BuildContext context;
  late double vw;

  CustomButton(this.context) {
    vw = Responsive(context).viewportWidth;
  }

  Widget withIcon({
    required Size size,
    required Color backgroundColor,
    required Color textColor,
    required double textSize,
    required Function() onTap,
    required String label,
    required IconData icon,
    required EdgeInsetsGeometry padding,
  }) {
    Color hoveredColor = Color.fromRGBO(
      backgroundColor.red - 20,
      backgroundColor.green - 20,
      backgroundColor.blue - 20,
      1,
    );

    return HoverOver(builder: (hovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width * vw,
          height: size.height * vw,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.65 * vw),
            color: (hovered) ? hoveredColor : backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: textSize,
                color: textColor,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                icon,
                size: textSize,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget regular({
    required Size size,
    required Color backgroundColor,
    required Color textColor,
    required double textSize,
    required Function() onTap,
    required String label,
    required IconData icon,
    required EdgeInsetsGeometry padding,
  }) {
    Color hoveredColor = Color.fromRGBO(
      backgroundColor.red - 20,
      backgroundColor.green - 20,
      backgroundColor.blue - 20,
      1,
    );

    return HoverOver(builder: (hovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width * vw,
          height: size.height * vw,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.65 * vw),
            color: (hovered) ? hoveredColor : backgroundColor,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: textSize,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget onlyIcon({
    required Size size,
    required Color backgroundColor,
    required Function() onTap,
    required IconData icon,
    required double iconSize,
    required Color iconColor,
    required EdgeInsetsGeometry padding,
  }) {
    Color hoveredColor = Color.fromRGBO(
      backgroundColor.red - 20,
      backgroundColor.green - 20,
      backgroundColor.blue - 20,
      1,
    );

    return HoverOver(builder: (hovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width * vw,
          height: size.height * vw,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.65 * vw),
            color: (hovered) ? hoveredColor : backgroundColor,
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      );
    });
  }
}
