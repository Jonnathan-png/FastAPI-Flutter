
class User {
  final String id, name;
  final int empid, age;
  final List teams;

  User({
    required this.id,
    required this.name,
    required this.empid,
    required this.age,
    required this.teams,
  });


  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      empid: json['emp_id'],
      age: json['age'],
      teams: json['teams'],
    );
  }
}
