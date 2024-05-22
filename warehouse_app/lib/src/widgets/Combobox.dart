import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:warehouse_app/src/models/Role.dart';

class Combobox{
  late double vw;
  late double h1;
  late double h2;
  late double h3;

  late bool open;
  late Future<List<Role>> future;
  late Function(Role role, bool state) method;
  late Role current_role;

  late double left;
  late double right;
  late double top;
  late double width;
  late double height;

  Combobox({
    required  this.method,
    required this.open,
    required this.future,
    required this.current_role,
    required this.left,
    required this.right,
    required this.top,
    required this.width,
    required this.height,
  });

  Widget build(BuildContext context){
    // Obtén el tamaño de la pantalla usando MediaQuery
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    vw = screenWidth / 100;
    h1 = 1.1 * vw;
    h2 = 1.4 * vw;
    h3 = 0.9*vw;

    return FutureBuilder<List<Role>>(future: future, builder: (context, AsyncSnapshot<List<Role>> snapshot){
      if(!snapshot.hasData){
        return Text('Cargando');
      }

      List<Role> roles = snapshot.data!;
      if(roles.isEmpty){
        return Text('No hay roles');
      }

      return (!open) ? 
        Positioned(
          left: left * vw,
          right: right * vw,
          top: top * vw,
          child: GestureDetector(
            onTap: () {
              method(current_role, !open);
            },
            child: Container(
              width: 19.8 * vw,
              height: 3.3 * vw,
              padding:
                  EdgeInsets.symmetric(horizontal: 1 * vw),
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 235, 245, 1),
                borderRadius:
                    BorderRadius.circular(0.65 * vw),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    current_role.getName(),
                    style: TextStyle(
                      fontSize: h1,
                      color: Color.fromRGBO(40, 40, 55, 1),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Color.fromRGBO(40, 40, 55, 1),
                  )
                ],
              ),
            ),
          ),
        ):
        Positioned(
          left: left * vw,
          right: right * vw,
          top: top * vw,
          child: GestureDetector(
            onTap: () {
              
            },
            child: Container(
              width: width * vw,
              height: height * vw * roles.length,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 235, 245, 1),
                borderRadius:
                    BorderRadius.circular(0.65 * vw),
              ),
              child: ListView.builder(
                itemCount: roles.length,
                itemBuilder: (context, index){
                return HoverOver(builder: (hovered){
                  return GestureDetector(
                    onTap: () {
                      method(roles[index], !open);
                    },
                    child: Container(
                      width: width * vw,
                      height: height * vw,
                      padding:
                        EdgeInsets.symmetric(horizontal: 1 * vw),
                      decoration: BoxDecoration(
                        color: (hovered) ? Color.fromRGBO(205, 205, 215, 1):
                          Color.fromRGBO(235, 235, 245, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: (index == 0) ? Radius.circular(0.65*vw) : Radius.circular(0),
                          topRight: (index == 0) ? Radius.circular(0.65*vw) : Radius.circular(0),
                          bottomLeft: (index == roles.length - 1) ? Radius.circular(0.65*vw) : Radius.circular(0),
                          bottomRight: (index == roles.length - 1) ? Radius.circular(0.65*vw) : Radius.circular(0),
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            roles[index].getName(),
                            style: TextStyle(
                              fontSize: h1,
                              color: Color.fromRGBO(40, 40, 55, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
                
              })
            ),
          ),
        )
      ;
    });

    
  }
}