import 'DatabaseHelper.dart';

class LocalModel{
  String? title;
  String? date;


  LocalModel(
      {required this.title, required this.date});
  LocalModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[DatabaseHelper.columnName] = title;
    data[DatabaseHelper.columnDate] = date;

    return data;
  }
}