class Info {
   final String name;
  late final int age;
  final int ?id;

  Info({ this.id, required this.name, required this.age});

  Info.fromMap(Map<String,dynamic> res) :
        id = res["id"],
        name = res["name"],
        age = res["age"];


  Map<String, Object> toMap() {
    return {'name': name, 'age': age};
  }

}


