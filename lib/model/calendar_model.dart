import 'package:intl/intl.dart';

class CalendarItem {
  late String id;
  late String name;
  late String url;
  late String startDate;
  late String startTime;
  late String endDate;
  late String endTime;

  CalendarItem({
    required this.id,
    required this.name,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
  });

  CalendarItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['start_date'] as String;
    startTime = json['start_time'] as String;
    endDate = json['end_date'] as String;
    endTime = json['end_time'] as String;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = name;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }

  DateTime getStartDateTime() {
    final f = DateFormat('yyyy-MM-dd hh:mm');
    return f.parse("$startDate $startTime}");
  }
}
