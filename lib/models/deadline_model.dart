class DeadlineModel {
  String id;
  String title;
  DateTime dateTime;

  DeadlineModel({
    required this.id,
    required this.title,
    required this.dateTime,
  });

  factory DeadlineModel.fromJson(Map<String, dynamic> json) => DeadlineModel(
    id: json['id'],
    title: json['title'],
    dateTime: DateTime.parse(json['dateTime']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'dateTime': dateTime.toIso8601String(),
  };
}
