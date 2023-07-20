import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class EscalationMatrixListController extends GetxController {
  EscalationMatrixListController(this.escalationMatrixPresenter);
  EscalationMatrixListPresenter escalationMatrixPresenter;

  final HomeController homeController = Get.find();

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;



//   ///Escalation Matrix List Date Time For Web
  var escalationMatrixListDateTimeCtrlrWeb = TextEditingController();
  var escalationMatrixListDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedEscalationMatrixListDateTimeWeb = DateTime.now().obs;

//   ///Reject Incident Report Controller

//    final TextEditingController rejectCommentTextFieldCtrlr =
//       TextEditingController();

// //Escalation Matrix List
  var incidentReportList = <IncidentReportListModel>[];


// ///Incident Report List
  RxList<IncidentReportListModel?> incidentReportModelList =
      <IncidentReportListModel>[].obs;



  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;

//   PaginationController paginationController = PaginationController(
//     rowCount: 0,
//     rowsPerPage: 10,
//   );
  PaginationController paginationEscalationMatrixController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
//   // PaginationController paginationBusinessListController = PaginationController(
//   //   rowCount: 0,
//   //   rowsPerPage: 10,
//   // );

  //From and To date format
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  //   ///Incident Report Details
  // Rx<ViewWarrantyClaimModel?> viewWarrantyClaimDetailsModel = ViewWarrantyClaimModel().obs;
  // RxList<ViewWarrantyClaimModel?>? viewWarrantyClaimDetailsList = <ViewWarrantyClaimModel?>[].obs;

  ///
// int? wc_id = 0;
  @override
  void onInit() async {
    // wc_id = Get.arguments;
    // print('WC_Id:$wc_id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getIncidentReportList(facilityId, "2020-01-01", "2023-12-31", false);
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getuserAccessData();
    });

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await escalationMatrixPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList = await escalationMatrixPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

  
  void getIncidentReportList(int facilityId, dynamic startDate, dynamic endDate,
      bool isLoading) async {
    incidentReportModelList.value = <IncidentReportListModel>[];

    final list = await escalationMatrixPresenter.getIncidentReportList(
        isLoading: isLoading,
        start_date: "2020-01-01",

        ///startDate,
        end_date: "2023-12-31", ////endDate,
        facility_id: facilityId);
    print('incidentReportFacilityId$facilityId');
    print('Incident Report List:$list');
    for (var incident_list in list) {
      incidentReportModelList.add(incident_list);
    }
    incidentReportList = list;
    paginationEscalationMatrixController = PaginationController(
      rowCount: incidentReportList.length,
      rowsPerPage: 10,
    );
    update(['incident_report_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  // void checkForm() {

  //   if (warrantyClaimTitleTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Title Field cannot be empty', timeInSecForIosWeb: 5);
  //   }
  //   if (warrantyClaimBriefDescTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Description Field cannot be empty', timeInSecForIosWeb: 5);
  //   }
  //   if (affectedSerialNoTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Affected Serial No Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (failureDateTimeCtrlrWebBuffer == null) {
  //     Fluttertoast.showToast(
  //         msg: 'Failure Date Time Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }

  //   if (orderReferenceNoTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Order Reference No Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (costOfReplacementTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Cost of Replacement Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (immediateCorrectiveActionTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Corrective Action Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (requestManufactureTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Request Field cannot be empty', timeInSecForIosWeb: 5);
  //   }

  // }

  void getEscalationMatrixListByDate() {
    getIncidentReportList(facilityId, formattedFromdate, formattedTodate, false);
  }

  Future<void> viewEscalationMatrix({int? id}) async {
    Get.toNamed(Routes.viewEscalatiomMatrixContentWeb, arguments: id);
    print('Argument$id');
  }

  Future<void> editEscalationMatrix({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }
}