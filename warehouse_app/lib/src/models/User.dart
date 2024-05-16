class User{
  late int id;
  late String name;
  late String lastname;
  late String curp;
  late String email;
  late String username;
  late int role_id;

  User({
    int? id,
    String? name,
    String? lastname,
    String? curp,
    String? email,
    String? username,
    int? role_id
  }){
    this.id = id ?? 0;
    this.name = name ?? '';
    this.lastname = lastname ?? '';
    this.curp = curp ?? '';
    this.email = email ?? '';
    this.username = username ?? '';
    this.role_id = role_id ?? 0;
  }

  //Getters and Setters
  int getId(){
    return this.id;
  }

  String getName(){
    return this.name;
  }

  String getLastname(){
    return this.lastname;
  }

  String getCURP(){
    return this.curp;
  }

  String getEmail(){
    return this.email;
  }

  String getUsername(){
    return this.username;
  }

  int getRole_id(){
    return this.role_id;
  }

  String getRole(){
    List<String> roles = ['None', 'Local Admin', 'Editor', 'Receptionist'];

    return roles[this.role_id];
  }


  Future<List<User>> getAllUsers() async {
    List<User> users = [];
    for(int i = 0; i < 10; i++){
      users.add(
        User(
          id: i+1,
          name: 'JOHN',
          lastname: 'DOE',
          curp: 'DOCJ011014HBSLSL01',
          email: 'john.doe@gmail.com',
          username: 'john.doe',
          role_id: 1
        )
      );
    }

    return users;
  }

  
}