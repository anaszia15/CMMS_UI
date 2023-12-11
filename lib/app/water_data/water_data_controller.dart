import 'dart:async';

import 'package:cmms/app/checklist_mis_plan/checklist_mis_plan_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/water_data/water_data_presenter.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class WaterDataController extends GetxController {
  WaterDataController(
    this.waterDataPresenter,
  );
  WaterDataPresenter waterDataPresenter;
  final HomeController homecontroller = Get.find();
  RxList<AuditPlanListModel> auditPlanList = <AuditPlanListModel>[].obs;
  RxList<AuditPlanListModel> filteredData = <AuditPlanListModel>[].obs;
  // Rx<int> Plan Id = 0.obs;
  Rx<int> PlanId = 0.obs;
  RxString planIdFilterText = ''.obs;
  RxString planTitleFilterText = ''.obs;
  RxString noOfDaysFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;
  RxString frequencyFilterText = ''.obs;
  RxString startdateFilterText = ''.obs;

  RxString statusFilterText = ''.obs;

  //Start DateTime
  bool openStartDatePicker = false;
  var startDateTimeCtrlr = TextEditingController();

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    'Plan ID': true,
    'SOP Number': true,
    'Checklist': true,
    // 'Site Name': true,
    'Start Date': true,
    'Frequency Name': true,
  });
  final Map<String, double> columnwidth = {
    'Plan ID': 153,
    'SOP Number': 320,
    'Checklist': 220,
    // 'Site Name': 200,
    'Start Date': 250,
    'Frequency Name': 250,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  bool openFromDateToStartDatePicker = false;
  var waterDateTc = TextEditingController();

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  Rx<int> type = 0.obs;

  @override
  void onInit() async {
    //await setType();

    this.filterText = {
      'Plan ID': planIdFilterText,
      'SOP Number': planTitleFilterText,
      'Checklist': noOfDaysFilterText,
      // 'Site Name': createdByFilterText,
      'Start Date': frequencyFilterText,
      'Frequency Name': startdateFilterText,
      "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        getAuditPlanList(
            facilityId, formattedTodate1, formattedFromdate1, true);
      });
    });
    super.onInit();
  }

  Future<void> getAuditPlanList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    auditPlanList.value = <AuditPlanListModel>[];
    // pmPlanList?.clear();
    final _auditPlanList = await waterDataPresenter.getAuditPlanList(
        facilityId: facilityId,
        isLoading: isLoading,
        startDate: startDate,
        endDate: endDate);
    if (_auditPlanList != null) {
      auditPlanList.value = _auditPlanList;
    }

    update(['pmPlan_list']);
  }

  Future<void> setType() async {
    try {
      // Read jobId
      String? _type = await waterDataPresenter.getValue();
      if (_type == null || _type == '' || _type == "null") {
        var dataFromPreviousScreen = Get.arguments;

        type.value = dataFromPreviousScreen['type'];
        waterDataPresenter.saveValue(type: type.value.toString());
      } else {
        type.value = int.tryParse(_type) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'type');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }

  void getAuditListByDate() {
    getAuditPlanList(facilityId, formattedTodate1, formattedFromdate1, true);
  }

  Future<void> clearValue() async {
    waterDataPresenter.clearValue();
  }

  void clearStoreIdData() {
    waterDataPresenter.clearStoreIdData();
  }
}
