class Area {
  late int id;
  late String name;

  Area({int? id, String? name}) {
    this.id = id ?? 0;
    this.name = name ?? '';
  }

  //Getters and Setters
  int getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  Area get one => Area(id: 9, name: 'Warehouse');

  Future<List<Area>> searchAreas() async {
    List<Area> Areas = [
      Area(id: 0, name: 'All'),
      Area(id: 1, name: 'Administration'),
      Area(id: 2, name: 'Customer Service'),
      Area(id: 3, name: 'Finance'),
      Area(id: 4, name: 'Human Resources (HR)'),
      Area(id: 5, name: 'Information Technology (IT)'),
      Area(id: 6, name: 'Marketing'),
      Area(id: 7, name: 'Operations'),
      Area(id: 8, name: 'Sales'),
      Area(id: 9, name: 'Warehouse'),
    ];

    return Areas;
  }

  Future<List<Area>> getAllAreas() async {
    List<Area> Areas = [
      Area(id: 1, name: 'Administration'),
      Area(id: 2, name: 'Customer Service'),
      Area(id: 3, name: 'Finance'),
      Area(id: 4, name: 'Human Resources (HR)'),
      Area(id: 5, name: 'Information Technology (IT)'),
      Area(id: 6, name: 'Marketing'),
      Area(id: 7, name: 'Operations'),
      Area(id: 8, name: 'Sales'),
      Area(id: 9, name: 'Warehouse'),
    ];

    return Areas;
  }
}
