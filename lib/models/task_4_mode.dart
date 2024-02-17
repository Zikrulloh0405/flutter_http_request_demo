class Task3 {
  late String status;
  late List<Data> data;
  late String message;

  Task3({required this.status, required this.data, required this.message});

  factory Task3.fromJson(Map<String, dynamic> json) => Task3(
      status: json['status'],
      data: List<Data>.from(json['data'].map((e) => e)).toList(),
      message: json['message']);

  Map<String, dynamic> toJson() => {
        "status": status,
        'data': List<Data>.from(data.map((e) => e)),
        'message': message,
      };
}

class Data {
  late String name;
  late String salary;
  late String age;
  late String id;

  Data(
      {required this.name,
      required this.salary,
      required this.age,
      required this.id});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name'],
        salary: json['salary'],
        age: json['age'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        name: 'name',
        salary: 'salary',
        age: 'age',
        id: 'id',
      };
}
