import 'package:flutter/material.dart';
import 'package:warehouse_app/src/models/Auxiliars/Responsive.dart';

class RowAlignment {
  late BuildContext context;
  late double vw;
  RowAlignment(this.context) {
    vw = Responsive(context).viewportWidth;
  }

  BorderRadiusGeometry get topLeft =>
      BorderRadius.only(topLeft: Radius.circular(0.45 * vw));

  BorderRadiusGeometry get topRight =>
      BorderRadius.only(topRight: Radius.circular(0.45 * vw));

  BorderRadiusGeometry get center => BorderRadius.zero;

  BorderRadiusGeometry get bottomLeft =>
      BorderRadius.only(bottomLeft: Radius.circular(0.45 * vw));

  BorderRadiusGeometry get bottomRight =>
      BorderRadius.only(bottomRight: Radius.circular(0.45 * vw));
}
