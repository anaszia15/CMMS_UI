class CreateReturnMrsModel {
  int? ID;
  int? isEditMode;
  int? facility_ID;
  // int? requested_by_Id;
  // String? requestd_date;
  String? setAsTemplate;
  String? activity;
  int? whereUsedType;
  int? whereUsedTypeId;
  String? remarks;
  // String? approved_date;
  List<Equipments>? equipments;

  CreateReturnMrsModel(
      {
      // this.approved_date,
      this.ID,
      this.activity,
      this.equipments,
      this.isEditMode,
      this.facility_ID,
      // this.requestd_date,
      // this.requested_by_Id,
      this.remarks,
      this.setAsTemplate,
      this.whereUsedType,
      this.whereUsedTypeId});

  factory CreateReturnMrsModel.fromJson(Map<String, dynamic> json) =>
      CreateReturnMrsModel(
        // approved_date: json["approved_date"],
        ID: json["ID"],
        activity: json["activity"],
        isEditMode: json["isEditMode"],
        facility_ID: json["facility_ID"],
        // requestd_date: json["requestd_date"],
        // requested_by_Id: json["requested_by_Id"],
        remarks: json["remarks"],
        setAsTemplate: json["setAsTemplate"],
        whereUsedType: json["whereUsedType"],
        whereUsedTypeId: json["whereUsedTypeId"],
        equipments: List<Equipments>.from(
            json["cmmrsItems"].map((x) => Equipments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": ID,
        // "approved_date": approved_date,
        "activity": activity,
        "facility_ID": facility_ID,
        "isEditMode": isEditMode,
        // "requestd_date": requestd_date,
        // "requested_by_Id": requested_by_Id,
        "remarks": remarks,
        "setAsTemplate": setAsTemplate,
        "whereUsedType": whereUsedType,
        "whereUsedTypeId": whereUsedTypeId,
        "cmmrsItems": List<dynamic>.from(equipments!.map((x) => x.toJson())),
      };
}

class Equipments {
  Equipments(
      {this.approval_required,
      this.asset_code,
      this.asset_type_ID,
      this.equipmentID,
      this.id,
      this.issued_qty,
      this.requested_qty});

  int? id;
  int? equipmentID;
  int? approval_required;
  int? asset_type_ID;
  String? asset_code;
  int? requested_qty;
  int? issued_qty;

  int? returned_qty;
  int? used_qty;
  int? available_qty;
  factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
        id: json["id"],
        equipmentID: json["equipmentID"],
        approval_required: json["approval_required"],
        asset_type_ID: json["asset_type_ID"],
        asset_code: json["asset_code"],
        requested_qty: json["requested_qty"],
        issued_qty: json["issued_qty"],
      );

  Map<String, dynamic> toJson() => {
        "issued_qty": issued_qty,
        "requested_qty": requested_qty,
        "asset_code": asset_code,
        "asset_type_ID": asset_type_ID,
        "approval_required": approval_required,
        "equipmentID": equipmentID,
        "id": id,
      };
}

class Credentials {
  String? user_name;
  String? password;

  Credentials({this.user_name, this.password});

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
        password: json['password'], user_name: json['user_name']);
  }
  Map<String, dynamic> toJson() => {
        "password": password,
        "user_name": user_name,
      };
}