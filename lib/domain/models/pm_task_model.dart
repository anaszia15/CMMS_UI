import 'dart:convert';

List<PmTaskListModel> pmTaskListModelFromJson(String str) =>
    List<PmTaskListModel>.from(
        json.decode(str).map((x) => PmTaskListModel.fromJson(x)));

String mTaskListModelToJson(List<PmTaskListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PmTaskListModel {
  int? id;
  int? facility_id;
  String? task_code;
  String? name;
  String? last_done_date;
  String? due_date;
  String? done_date;
  int? frequency_id;
  String? frequency_name;
  int? category_id;
  String? category_name;
  int? assigned_to_id;
  String? assigned_to_name;
  int? permit_id;
  String? permit_code;
  int? status;
  String? status_short;
  PmTaskListModel(
      {this.assigned_to_id,
      this.assigned_to_name,
      this.category_id,
      this.category_name,
      this.done_date,
      this.due_date,
      this.facility_id,
      this.frequency_id,
      this.frequency_name,
      this.id,
      this.last_done_date,
      this.permit_code,
      this.permit_id,
      this.name,
      this.status,
      this.status_short,
      this.task_code});

  factory PmTaskListModel.fromJson(Map<String, dynamic> json) =>
      PmTaskListModel(
        assigned_to_id: json['assigned_to_id'] ?? 0,
        assigned_to_name: json['assigned_to_name'] ?? '',
        category_id: json['category_id'] ?? 0,
        category_name: json['category_name'] ?? '',
        done_date: json['done_date'] ?? '',
        due_date: json['due_date'] ?? '',
        facility_id: json['facility_id'] ?? 0,
        permit_code: json['permit_code'] ?? '',
        permit_id: json['permit_id'] ?? 0,
        status: json['status'] ?? 0,
        status_short: json['status_short'] ?? '',
        frequency_id: json['frequency_id'] ?? 0,
        frequency_name: json['frequency_name'] ?? '',
        id: json['id'] ?? 0,
        last_done_date: json['last_done_date'] ?? '',
        name: json['plan_title'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": category_id,
        "category_name": category_name,
        "frequency_id": frequency_id,
        "frequency_name": frequency_name,
        "assigned_to_name": assigned_to_name,
        "permit_code": permit_code,
        "permit_id": permit_id,
        "status": status,
        "status_short": status_short,
        "last_done_date": last_done_date,
        "plan_title": name,
        "due_date": due_date,
        "done_date": done_date,
        "assigned_to_id": assigned_to_id,
      };
}
