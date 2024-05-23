import 'package:warehouse_app/src/models/Area.dart';
import 'package:warehouse_app/src/models/Role.dart';

class User {
  late int id;
  late String name;
  late String lastname;
  late String curp;
  late String email;
  late String username;
  late Role role;
  late Area area;

  User({
    int? id,
    String? name,
    String? lastname,
    String? curp,
    String? email,
    String? username,
    Role? role,
    Area? area,
  }) {
    this.id = id ?? 0;
    this.name = name ?? '';
    this.lastname = lastname ?? '';
    this.curp = curp ?? '';
    this.email = email ?? '';
    this.username = username ?? '';
    this.role = role ?? Role(id: 0, name: 'Undefined role');
    this.area = area ?? Area(id: 0, name: 'Undefined area');
  }

  //Getters and Setters
  int getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  String getLastname() {
    return this.lastname;
  }

  String getCURP() {
    return this.curp;
  }

  String getEmail() {
    return this.email;
  }

  String getUsername() {
    return this.username;
  }

  Role getRole() {
    return role;
  }

  Area getArea() {
    return area;
  }

  User get one => User(
        id: 1,
        name: 'JOHN',
        lastname: 'DOE',
        curp: 'DOCJ011014HBSLSL01',
        email: 'john.doe@gmail.com',
        username: 'john.doe',
        role: Role(id: 1, name: 'Admin'),
        area: Area(id: 9, name: 'Warehouse'),
      );

  Future<List<User>> getAllUsers() async {
    List<User> users = [];
    for (int i = 0; i < 15; i++) {
      users.add(
        User(
          id: i + 1,
          name: 'JOHN',
          lastname: 'DOE',
          curp: 'DOCJ011014HBSLSL01',
          email: 'john.doe@gmail.com',
          username: 'john.doe',
          role: Role(id: 1, name: 'Admin'),
          area: Area(id: 9, name: 'Warehouse'),
        ),
      );
    }

    return users;
  }
}
