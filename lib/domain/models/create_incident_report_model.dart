import 'dart:convert';

CreateIncidentReportModel createIncidentReportModelFromJson(String str) =>
    CreateIncidentReportModel.fromJson(json.decode(str));

String createIncidentReportModelToJson(CreateIncidentReportModel data) =>
    json.encode(data.toJson());

class CreateIncidentReportModel {
  int? facility_id;
  int? block_id;
  int? equipment_id;
  int? risk_level;
  String? incident_datetime;
  String? reporting_datetime;
  String? legal_applicability_remark;
  String? esi_applicability_remark;
  int? victim_id;
  String? title;
  int? action_taken_by;
  String? action_taken_datetime;
  int? inverstigated_by;
  // int? verified_by;
  int? risk_type;
  bool? esi_applicability;
  bool? legal_applicability;
  bool? rca_required;
  int? damaged_cost;
  int? generation_loss;
  int? job_id;
  String? description;
  String? type_of_job;
  String? is_person_authorized;
  String? instructions_given;
  String? safety_equipments;
  String? safe_procedure_observed;
  String? unsafe_condition_contributed;
  String? unsafe_act_cause;
  bool? is_insurance_applicable;
  String? insurance;
  int? insurance_status;
  String? insurance_remark;
  int? id;
  String? severity;
  List<WhyWhyAnalysis?>? why_why_analysis;
  List<RootCause?>? root_cause;
  List<ImmediateCorrection?>? immediate_correction;
  List<DetailsOfInjuredPerson?>? injured_person;
  List<ProposedActionPlan?>? proposed_action_plan;
  List<InvestigationTeam?>? investigation_team;

  CreateIncidentReportModel({
    this.facility_id,
    this.block_id,
    this.equipment_id,
    this.risk_level,
    this.incident_datetime,
    this.reporting_datetime,
    this.legal_applicability_remark,
    this.esi_applicability_remark,
    this.victim_id,
    this.title,
    this.action_taken_by,
    this.action_taken_datetime,
    this.inverstigated_by,
    // this.verified_by,
    this.risk_type,
    this.esi_applicability,
    this.legal_applicability,
    this.rca_required,
    this.damaged_cost,
    this.generation_loss,
    this.job_id,
    this.description,
    this.type_of_job,
    this.is_person_authorized,
    this.instructions_given,
    this.safety_equipments,
    this.safe_procedure_observed,
    this.unsafe_condition_contributed,
    this.unsafe_act_cause,
    this.is_insurance_applicable,
    this.insurance,
    this.insurance_status,
    this.insurance_remark,
    this.id,
    this.severity,
    this.why_why_analysis,
    this.root_cause,
    this.immediate_correction,
    this.injured_person,
    this.proposed_action_plan,
    this.investigation_team,
  });

  factory CreateIncidentReportModel.fromJson(Map<String, dynamic> json) =>
      CreateIncidentReportModel(
        facility_id: json["facility_id"],
        block_id: json["block_id"],
        equipment_id: json['equipment_id'],
        risk_level: json['risk_level'],
        incident_datetime: json['incident_datetime'],
        reporting_datetime: json['reporting_datetime'],
        legal_applicability_remark: json['legal_applicability_remark'],
        esi_applicability_remark: json['esi_applicability_remark'],
        victim_id: json['victim_id'],
        title: json['title'],
        action_taken_by: json['action_taken_by'],
        action_taken_datetime: json['action_taken_datetime'],
        inverstigated_by: json['inverstigated_by'],
        // verified_by: json['verified_by'],
        risk_type: json['risk_type'],
        esi_applicability: json['esi_applicability'],
        legal_applicability: json['legal_applicability'],
        rca_required: json['rca_required'],
        damaged_cost: json['damaged_cost'],
        generation_loss: json['generation_loss'],
        job_id: json['job_id'],
        description: json['description'],
        type_of_job: json['type_of_job'],
        is_person_authorized: json['is_person_authorized'],
        instructions_given: json['instructions_given'],
        is_insurance_applicable: json['is_insurance_applicable'],
        safety_equipments: json['safety_equipments'],
        safe_procedure_observed: json['safe_procedure_observed'],
        unsafe_condition_contributed: json['unsafe_condition_contributed'],
        unsafe_act_cause: json['unsafe_act_cause'],
        insurance: json['insurance'],
        insurance_status: json['insurance_status'],
        insurance_remark: json['insurance_remark'],
        id: json['id'],
        severity: json['severity'],
        why_why_analysis: json['why_why_analysis'] != null
            ? List<WhyWhyAnalysis>.from(json["why_why_analysis"]
                ?.map((x) => WhyWhyAnalysis.fromJson(x)))
            : [],
        root_cause: json['root_cause'] != null
            ? List<RootCause>.from(
                json["root_cause"]?.map((x) => RootCause.fromJson(x)))
            : [],
        immediate_correction: json['immediate_correction'] != null
            ? List<ImmediateCorrection>.from(json["immediate_correction"]
                ?.map((x) => ImmediateCorrection.fromJson(x)))
            : [],
        injured_person: json['injured_person'] != null
            ? List<DetailsOfInjuredPerson>.from(json["injured_person"]
                ?.map((x) => DetailsOfInjuredPerson.fromJson(x)))
            : [],
        proposed_action_plan: json['proposed_action_plan'] != null
            ? List<ProposedActionPlan>.from(json["proposed_action_plan"]
                ?.map((x) => ProposedActionPlan.fromJson(x)))
            : [],
        investigation_team: json["investigation_team"] != null
            ? List<InvestigationTeam>.from(json["investigation_team"]
                ?.map((x) => InvestigationTeam.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "facility_id": facility_id,
        "block_id": block_id,
        "equipment_id": equipment_id,
        "risk_level": risk_level,
        "incident_datetime": incident_datetime,
        "reporting_datetime": reporting_datetime,
        "legal_applicability_remark": legal_applicability_remark,
        "esi_applicability_remark": esi_applicability_remark,
        "victim_id": victim_id,
        "title": title,
        "action_taken_by": action_taken_by,
        "action_taken_datetime": action_taken_datetime,
        "inverstigated_by": inverstigated_by,
        // "verified_by": verified_by,
        "risk_type": risk_type,
        "esi_applicability": esi_applicability,
        "legal_applicability": legal_applicability,
        "rca_required": rca_required,
        "damaged_cost": damaged_cost,
        "generation_loss": generation_loss,
        "description": description,
        "type_of_job": type_of_job,
        "is_person_authorized": is_person_authorized,
        "instructions_given": instructions_given,
        "safety_equipments": safety_equipments,
        "safe_procedure_observed": safe_procedure_observed,
        "unsafe_condition_contributed": unsafe_condition_contributed,
        "unsafe_act_cause": unsafe_act_cause,
        "is_insurance_applicable": is_insurance_applicable,
        "insurance": insurance,
        "insurance_status": insurance_status,
        "insurance_remark": insurance_remark,
        "id": id,
        "severity": severity,
        "why_why_analysis": List<dynamic>.from(why_why_analysis!.map((x) => x)),
        "root_cause": List<dynamic>.from(root_cause!.map((x) => x)),
        "immediate_correction":
            List<dynamic>.from(immediate_correction!.map((x) => x)),
        "injured_person": List<dynamic>.from(injured_person!.map((x) => x)),
        "proposed_action_plan":
            List<dynamic>.from(proposed_action_plan!.map((x) => x)),
        "investigation_team":
            List<dynamic>.from(investigation_team!.map((x) => x)),
      };
}

///Details of Injured Person
class DetailsOfInjuredPerson {
  DetailsOfInjuredPerson(
      {this.injured_item_id,
      this.incidents_id,
      this.person_id,
      this.person_type,
      this.other_victim,
      this.age,
      this.sex,
      this.designation,
      this.address,
      this.name_contractor,
      this.body_part_and_nature_of_injury,
      this.work_experience_years,
      this.plant_equipment_involved,
      this.location_of_incident});

  int? injured_item_id;
  int? incidents_id;

  String? person_id;
  int? person_type;
  String? other_victim;
  int? age;
  int? sex;
  String? designation;
  String? address;
  String? name_contractor;
  String? body_part_and_nature_of_injury;
  int? work_experience_years;
  String? plant_equipment_involved;
  String? location_of_incident;

  factory DetailsOfInjuredPerson.fromJson(Map<String, dynamic> json) =>
      DetailsOfInjuredPerson(
        injured_item_id: json['injured_item_id'],
        incidents_id: json['incidents_id'],
        person_id: json['person_id'],
        person_type: json['person_type'],
        other_victim: json['other_victim'],
        age: json['age'],
        sex: json['sex'],
        designation: json['designation'],
        address: json['address'],
        name_contractor: json["name_contractor"],
        body_part_and_nature_of_injury: json['body_part_and_nature_of_injury'],
        work_experience_years: json['work_experience_years'],
        plant_equipment_involved: json['plant_equipment_involved'],
        location_of_incident: json['location_of_incident'],
      );

  Map<String, dynamic> toJson() => {
        "injured_item_id": injured_item_id,
        "incidents_id": incidents_id,
        "person_id": person_id,
        "person_type": person_type,
        "other_victim": other_victim,
        "age": age,
        "sex": sex,
        "designation": designation,
        "address": address,
        "name_contractor": name_contractor,
        "body_part_and_nature_of_injury": body_part_and_nature_of_injury,
        "work_experience_years": work_experience_years,
        "plant_equipment_involved": plant_equipment_involved,
        "location_of_incident": location_of_incident
      };
}

//Proposed Action Plan
class ProposedActionPlan {
  ProposedActionPlan({
    this.incidents_id,
    this.actions_as_per_plan,
    this.responsibility,
    this.target_date,
    this.remarks,
  });

  int? incidents_id;
  String? actions_as_per_plan;
  String? responsibility;
  String? target_date;
  String? remarks;

  factory ProposedActionPlan.fromJson(Map<String, dynamic> json) =>
      ProposedActionPlan(
        incidents_id: json['incidents_id'],
        actions_as_per_plan: json['actions_as_per_plan'],
        responsibility: json['responsibility'],
        target_date: json['target_date'],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "actions_as_per_plan": actions_as_per_plan,
        "responsibility": responsibility,
        "target_date": target_date,
        "remarks": remarks,
      };
}

///why why Analysis
class WhyWhyAnalysis {
  WhyWhyAnalysis({
    this.incidents_id,
    this.why,
    this.cause,
  });

  int? incidents_id;
  String? why;
  String? cause;

  factory WhyWhyAnalysis.fromJson(Map<String, dynamic> json) => WhyWhyAnalysis(
        incidents_id: json['incidents_id'],
        why: json['why'],
        cause: json["cause"],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "why": why,
        "cause": cause,
      };
}

//Root Cause
class RootCause {
  RootCause({
    this.incidents_id,
    this.cause,
  });

  int? incidents_id;
  String? cause;

  factory RootCause.fromJson(Map<String, dynamic> json) => RootCause(
        incidents_id: json['incidents_id'],
        cause: json["cause"],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "cause": cause,
      };
}

///Imeediate Correction
class ImmediateCorrection {
  ImmediateCorrection({
    this.incidents_id,
    this.details,
  });

  int? incidents_id;
  String? details;

  factory ImmediateCorrection.fromJson(Map<String, dynamic> json) =>
      ImmediateCorrection(
        incidents_id: json['incidents_id'],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "incidents_id": incidents_id,
        "details": details,
      };
}

class InvestigationTeam {
  InvestigationTeam({
    this.srNumber,
    this.person_id,
    this.name,
    this.designation,
    this.person_type,
    this.investigation_date,
  });

  String? srNumber;
  String? person_id;
  int? person_type;
  String? name;
  String? designation;
  String? investigation_date;

  factory InvestigationTeam.fromJson(Map<String, dynamic> json) =>
      InvestigationTeam(
          srNumber: json['srNumber'],
          person_id: json['person_id'],
          person_type: json['person_type'],
          name: json["person_name"],
          designation: json['designation'],
          investigation_date: json['investigation_date']);

  Map<String, dynamic> toJson() => {
        "srNumber": srNumber,
        "person_id": person_id,
        "person_type": person_type,
        "name": name,
        "designation": designation,
        "investigation_date": investigation_date
      };
}
