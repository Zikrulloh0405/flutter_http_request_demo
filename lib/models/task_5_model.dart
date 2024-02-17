class Task3 {
  late String status;
  late String data;
  late String message;

  Task3({required this.status, required this.data, required this.message});

  factory Task3.fromJson(Map<String, dynamic> json) => Task3(
      status: json['status'],
      data : json['data'],
      message: json['message']);

  Map<String, dynamic> toJson() => {
        "status": status,
        'data' : data,
        'message': message,
      };
}

