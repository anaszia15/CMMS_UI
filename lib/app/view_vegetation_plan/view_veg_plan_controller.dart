import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/view_vegetation_plan/view_veg_plan_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/veg_plan_detail_model.dart';
import 'package:cmms/domain/models/vegetation_equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewVegPlanController extends GetxController {
  ViewVegPlanController(
    this.viewVegPlanPresenter,
  );
  ViewVegPlanPresenter viewVegPlanPresenter;
  final HomeController homecontroller = Get.find();
  TextEditingController vegTitleCtrlr = TextEditingController();
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, dynamic> data = {};
  RxList<VegetationEquipmentModel?> vegEquipmentList =
      <VegetationEquipmentModel?>[].obs;

  // RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();

  RxList<VegPlanDetailModel?>? vegPlanDetailsList = <VegPlanDetailModel?>[].obs;
  Rx<VegPlanDetailModel?> vegPlanDetailsModel = VegPlanDetailModel().obs;
  RxList<Schedules?>? listSchedules = <Schedules?>[].obs;
  List<int?> scheduleId = [];
  RxList<Schedules?>? schedules = <Schedules?>[].obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  var durationInDayCtrlr = TextEditingController();

  Rx<int> id = 0.obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;
  var startDateTc = TextEditingController();

  Map<String, TypeModel> typedropdownMapperData = {};

  var days = <TypeModel>[
    TypeModel(name: 'Day 1', id: "1"),
    TypeModel(name: 'Day 2', id: "2"),
    TypeModel(name: 'Day 3', id: "3"),
  ];
  RxList<TypeModel> cleaningType = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "1"),
    TypeModel(name: 'Wet', id: "2"),
  ].obs;

  void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfBlocks", "value": ''},
      {'key': "noOfInverters", "value": ''},
      {'key': "area", "value": ''},
    ]);
  }

  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;
      });
      if (id != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getVegPlanDetail(planId: id.value);
        });
      }
      Future.delayed(Duration(seconds: 1), () {
        getVegEquipmentModelList(facilityId, true);
      });
      // getMcPlanHistory(id: id.value);
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      var dataFromPreviousScreen = Get.arguments;

      id.value = dataFromPreviousScreen['id'];
      // id= Get.arguments;
      print('AddStock:$id');
    } catch (e) {
      print(e.toString() + 'userId');
    }
  }

  Future<void> getVegEquipmentModelList(int facilityId, bool isLoading) async {
    vegEquipmentList.value = <VegetationEquipmentModel>[];

    final list = await viewVegPlanPresenter.getVegEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);

    vegEquipmentList.value = list;

    update(['veg_equipment_list']);
  }

  // Future<void> getMcPlanHistory({required int id}) async {
  //   int moduleType = 81;
  //   historyList?.value = await viewMcPlaningPresenter.getHistory(
  //         // tempModuleType,
  //         // tempJobCardId,
  //         moduleType,
  //         id,
  //         true,
  //       ) ??
  //       [];
  //   update(["historyList"]);
  // }

  Future<void> getVegPlanDetail({required int planId}) async {
    final _vegPlanDetail = await viewVegPlanPresenter.getVegPlanDetail(
        planId: planId, isLoading: true);
    print('Veg plan Detail:$_vegPlanDetail');

    if (_vegPlanDetail != null) {
      vegPlanDetailsModel.value = _vegPlanDetail;
      vegTitleCtrlr.text = vegPlanDetailsModel.value!.title ?? "";
      selectedfrequency.value = vegPlanDetailsModel.value?.frequency ?? "";
      startDateTc.text = vegPlanDetailsModel.value?.startDate ?? '';
      durationInDayCtrlr.text =
          vegPlanDetailsModel.value?.noOfCleaningDays.toString() ?? "";
      rowItem.value = [];
      schedules!.value = _vegPlanDetail.schedules!;
      _vegPlanDetail.schedules?.forEach(
        (element) {
          rowItem.value.add(
            [
              {"key": "day", "value": '${element.cleaningDay}'},
              {'key': "noOfBlocks", "value": '${element.blocks}'},
              {"key": "noOfInverters", "value": '${element.invs}'},
              {'key': "area", "value": '${element.scheduledArea}'},
            ],
          );
        },
      );
    }
  }

  void vegPlanApprovedButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();
      CommentModel commentVegAproveModel =
          CommentModel(id: id, comment: _comment);
      var vegApproveJsonString = commentVegAproveModel.toJson();
      Map<String, dynamic>? response =
          await viewVegPlanPresenter.vegPlanApprovedButton(
        vegApproveJsonString: vegApproveJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void vegPlanRejectButton({int? id}) async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();
      CommentModel commentVegAproveModel =
          CommentModel(id: id, comment: _comment);
      var vegRejectJsonString = commentVegAproveModel.toJson();
      Map<String, dynamic>? response =
          await viewVegPlanPresenter.vegPlanRejectButton(
        vegRejectJsonString: vegRejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      default:
        {}
        break;
    }
  }
}
