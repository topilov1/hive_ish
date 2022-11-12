class User {
  late String name;
  late bool isSaved;

  User({required this.name, required this.isSaved});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isSaved = json['isSaved'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'isSaved': isSaved,
      };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  int get hashCode => Object.hash(
        name,
        isSaved,
      );

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return super == other;
  }
}
