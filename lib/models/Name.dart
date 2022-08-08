class Name {
  String? id;
  String? name;

  Name({this.id, this.name});

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      id: map["id"],
      name: map["name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }
}
