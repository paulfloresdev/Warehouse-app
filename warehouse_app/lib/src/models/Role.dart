class Role{
  late int id;
  late String name;

  Role({int? id, String? name}){
    this.id = id ?? 0;
    this.name = name ?? '';
  }
  
  //Getters and Setters
  int getId(){
    return this.id;
  }

  String getName(){
    return this.name;
  }

  Future<List<Role>> getAllRoles() async{
    List<Role> roles = [
      Role(id: 1, name: 'Local Admin'),
      Role(id: 2, name: 'Edit'),
      Role(id: 3, name: 'Receptionist'),
    ];

    return roles;
  }


}