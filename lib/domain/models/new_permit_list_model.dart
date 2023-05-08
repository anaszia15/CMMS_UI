import 'dart:convert';

List<NewPermitModel> newPermitListFromJson(String str) =>
    List<NewPermitModel>.from(json.decode(str).map(NewPermitModel.fromJson));

String newPermitListToJson(List<NewPermitModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewPermitModel {
  int? permitId;
  int? ptwStatus;
  int? permitSiteNo;
  int? permitType;
  String? permitTypeName;
  int? equipmentCategoryId;
  String? equipment_categories;
  int? workingAreaId;
  String? workingAreaName;
  String? description;
  String? requestByName;
  DateTime? requestDatetime;
  String? approvedByName;
  DateTime? approvedDatetime;
  String? currentStatus;

  NewPermitModel(
      {this.permitId,
      this.ptwStatus,
      this.permitSiteNo,
      this.permitType,
      this.permitTypeName,
      this.equipmentCategoryId,
      this.equipment_categories,
      this.workingAreaId,
      this.workingAreaName,
      this.description,
      this.requestByName,
      this.requestDatetime,
      this.approvedByName,
      this.approvedDatetime,
      this.currentStatus});

  NewPermitModel.fromJson(Map<String, dynamic> json) {
    permitId = json['permitId'];
    ptwStatus = json['ptwStatus'];
    permitSiteNo = json['permit_site_no'];
    permitType = json['permit_type'];
    permitTypeName = json['permitTypeName'];
    equipmentCategoryId = json['equipment_category_id'];
    equipment_categories = json['equipment_categories'];
    workingAreaId = json['workingAreaId'];
    workingAreaName = json['workingAreaName'];
    description = json['description'];
    requestByName = json['request_by_name'];
    requestDatetime = json['request_datetime'] == null
        ? null
        : DateTime.parse(json['request_datetime'] as String);
    approvedByName = json['approved_by_name'];
    approvedDatetime = json['approved_datetime'] == null
        ? null
        : DateTime.parse(json['approved_datetime'] as String);
    currentStatus = json['current_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['permitId'] = this.permitId;
    data['ptwStatus'] = this.ptwStatus;
    data['permit_site_no'] = this.permitSiteNo;
    data['permit_type'] = this.permitType;
    data['permitTypeName'] = this.permitTypeName;
    data['equipment_category_id'] = this.equipmentCategoryId;
    data['equipment_categories'] = this.equipment_categories;
    data['workingAreaId'] = this.workingAreaId;
    data['workingAreaName'] = this.workingAreaName;
    data['description'] = this.description;
    data['request_by_name'] = this.requestByName;
    data['request_datetime'] = this.requestDatetime;
    data['approved_by_name'] = this.approvedByName;
    data['approved_datetime'] = this.approvedDatetime;
    data['current_status'] = this.currentStatus;
    return data;
  }
}
