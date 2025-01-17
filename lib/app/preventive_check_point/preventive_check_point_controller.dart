import 'dart:async';

import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/checkpoint_list_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/create_checkpoint_model.dart';
import '../home/home_controller.dart';
import '../theme/color_values.dart';
import '../theme/styles.dart';
import 'preventive_check_point_presenter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PreventiveCheckPointController extends GetxController {
  PreventiveCheckPointController(
    this.preventiveCheckPointPresenter,
  );
  PreventiveCheckPointPresenter preventiveCheckPointPresenter;
  final HomeController homecontroller = Get.find();
  FocusNode chckFocus = FocusNode();
  ScrollController chckScroll = ScrollController();
  FocusNode reqFocus = FocusNode();
  ScrollController reqScroll = ScrollController();
  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  Rx<String> selectedchecklist = 'Please Select'.obs;
  Rx<bool> isSelectedchecklist = true.obs;
  int facilityId = 0;
  Rx<int> type = 0.obs;
  var checkPointCtrlr = TextEditingController();
  var minRangeCtrlr = TextEditingController();
  var maxRangeCtrlr = TextEditingController();
  RxBool isContainerVisible = false.obs;

  var requirementCtrlr = TextEditingController();
  var failurewtgCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  Rx<String> selectedchecklistId = "".obs;
  RxList<CheckPointModel?>? preventiveCheckpoint = <CheckPointModel?>[].obs;
  RxList<CheckPointModel?>? BufferPreventiveCheckPoint =
      <CheckPointModel?>[].obs;
  CheckPointModel? preventiveCheckpointmodel;
  CheckPointModel? selectedItem;

  RxList<String> preventiveCheckPointTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // var preventiveCheckPointModelListDetails;
  StreamSubscription<int>? facilityIdStreamSubscription;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Sr No": true,
    "Check Point Id": true,
    "Check List No.": true,
    "Check Point": true,
    "Requirement": true,
    "Upload Image?": true,
    "Failure Weightage": true,
    "Type": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Sr No": 50,
    "Check Point Id": 100,
    "Check List No.": 250,
    "Check Point": 250,
    "Requirement": 300,
    "Upload Image?": 200,
    "Failure Weightage": 170,
    "Type": 200,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    // print({"updated columnVisibility": columnVisibility});
  }

  RxString srFilterText = ''.obs;
  RxString idFilterText = ''.obs;
  RxString checkListFilterText = ''.obs;
  RxString checkpointFilterText = ''.obs;
  RxString reqFilterText = ''.obs;
  RxString failerFilterText = ''.obs;
  RxString imageFilterText = ''.obs;
  RxString typeFilterText = ''.obs;
  @override
  void onInit() async {
    try {
      await setType();
      this.filterText = {
        "Sr No": srFilterText,
        "Check Point Id": idFilterText,
        "Check List No.": checkListFilterText,
        "Check Point": checkpointFilterText,
        "Requirement": reqFilterText,
        "Upload Image?": imageFilterText,
        "Failure Weightage": failerFilterText,
        "Type": typeFilterText,
      };
      if (type.value != 0) {
        facilityIdStreamSubscription =
            homecontroller.facilityId$.listen((event) {
          facilityId = event;
          Future.delayed(Duration(seconds: 2), () {
            getPreventiveCheckList(facilityId, type.value);
            getCheckPointlist(
                selectedchecklistId: 0.toString(), facilityId: facilityId);
          });
        });
      }
      chckFocus.addListener(() {
        if (!chckFocus.hasFocus) {
          chckScroll.jumpTo(0.0);
        }
      });
      reqFocus.addListener(() {
        if (!reqFocus.hasFocus) {
          reqScroll.jumpTo(0.0);
        }
      });

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  void toggleContainer() {
    isContainerVisible.toggle();
  }

  Future<void> setType() async {
    try {
      // Read jobId
      String? _type = await preventiveCheckPointPresenter.getValue();
      if (_type == null || _type == '' || _type == "null") {
        var dataFromPreviousScreen = Get.arguments;

        type.value = dataFromPreviousScreen['type'];
        preventiveCheckPointPresenter.saveValue(type: type.value.toString());
      } else {
        type.value = int.tryParse(_type) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'type');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }

  var checkpointType = ''.obs;

  void updatecheCkpointType(String value) {
    checkpointType.value = value;
  }

  var isToggleOn = false.obs;
  final isSuccess = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      preventiveCheckpoint!.value = BufferPreventiveCheckPoint!.value;
      return;
    }
    List<CheckPointModel?> filteredList = BufferPreventiveCheckPoint!
        .where((item) =>
            (item!.id
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.checklist_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.check_point
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.requirement
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.checkpoint_type
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.failure_weightage
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    preventiveCheckpoint!.value = filteredList;
  }

  Future<void> getPreventiveCheckList(
    facilityId,
    type,
  ) async {
    checkList.value = <PreventiveCheckListModel>[];
    cleardata();

    final list = await preventiveCheckPointPresenter.getPreventiveCheckList(
        facilityId: facilityId, type: type, isLoading: true);

    if (list != null) {
      // checkList.clear();

      for (var _checkList in list) {
        checkList.add(_checkList);
      }
    }
    // selectedchecklist.value = checkList[0]?.name.toString() ?? '';
    // selectedchecklistId.value = checkList[0]?.id.toString() ?? "";
    // getCheckPointlist(
    //     selectedchecklistId: selectedchecklistId.value, facilityId: facilityId);
  }

  Future<bool> createCheckpoint() async {
    int _failurewtg = int.tryParse(failurewtgCtrlr.text.trim()) ?? 0;
    String _checkPoint = checkPointCtrlr.text.trim();
    String _requirement = requirementCtrlr.text.trim();
    dynamic _max = double.tryParse(maxRangeCtrlr.text.trim());
    dynamic _min = double.tryParse(minRangeCtrlr.text.trim());

    int _checklistId = int.tryParse(selectedchecklistId.value) ?? 0;
    if (checkPointCtrlr.text.trim() == '' ||
        requirementCtrlr.text.trim() == '' ||
        failurewtgCtrlr.text.trim() == '' ||
        _failurewtg > 100 ||
        _failurewtg == 0 ||
        checkpointType.value == '') {
      Fluttertoast.showToast(
          msg:
              "Please enter required field and Failure waightage must be number beetween 1-100",
          fontSize: 16.0);
    } else {
      CheckpointType checkpoint_type = CheckpointType(
          id: checkpointType.value == "Text"
              ? 0
              : checkpointType.value == "Bool"
                  ? 1
                  : 2,
          max: _max,
          min: _min);

      CreateCheckpoint createCheckpoint = CreateCheckpoint(
          check_point: _checkPoint,
          requirement: _requirement,
          checklist_id: _checklistId,
          failure_weightage: _failurewtg,
          checkpoint_type: checkpoint_type,
          is_document_required: isToggleOn.value ? 1 : 0,
          id: 0,
          status: 1);
      var checkpointJsonString = [
        createCheckpoint.toJson()
      ]; //createCheckPointToJson([createCheckpoint]);

      print({"checkpointJsonString", checkpointJsonString});
      var rsponse = preventiveCheckPointPresenter.createCheckPoint(
        checkpointJsonString: checkpointJsonString,
        isLoading: true,
      );
      return true;
    }
    return false;
  }

  Future<void> getCheckPointlist(
      {required String selectedchecklistId, required int facilityId}) async {
    preventiveCheckpoint?.value = <CheckPointModel>[];
    BufferPreventiveCheckPoint?.value = <CheckPointModel>[];

    final _preventiveCheckpoint =
        await preventiveCheckPointPresenter.getCheckPointlist(
            selectedchecklistId: int.tryParse(
              selectedchecklistId,
            ),
            isLoading: true,
            facilityId: facilityId);

    if (_preventiveCheckpoint != null) {
      preventiveCheckpoint!.value = _preventiveCheckpoint;
      BufferPreventiveCheckPoint!.value = preventiveCheckpoint!.value;

      // paginationController = PaginationController(
      //   rowCount: preventiveCheckpoint!.length,
      //   rowsPerPage: 10,
      // );

      // if (preventiveCheckpoint != null && preventiveCheckpoint!.isNotEmpty) {
      //   preventiveCheckpointmodel = preventiveCheckpoint![0];
      //   var preventiveCheckListJson = preventiveCheckpointmodel?.toJson();
      //   preventiveCheckPointTableColumns.value = <String>[];
      //   for (var key in preventiveCheckListJson?.keys.toList() ?? []) {
      //     preventiveCheckPointTableColumns.add(key);
      //   }
      // }
    }
  }

  cleardata() {
    checkPointCtrlr.text = '';
    requirementCtrlr.text = '';
    isToggleOn.value = false;
    selectedItem = null;
    failurewtgCtrlr.text = '';
    maxRangeCtrlr.text = '';
    minRangeCtrlr.text = '';
    checkpointType.value = '';
    selectedchecklist.value = 'Please Select';
    isSelectedchecklist.value = true;
  }

  void issuccessCreatecheckpont() {
    isSuccess.toggle();
    checkPointCtrlr.text = '';
    requirementCtrlr.text = '';
    isToggleOn.value = false;
    selectedItem = null;
    failurewtgCtrlr.text = '';
    maxRangeCtrlr.text = '';
    minRangeCtrlr.text = '';
    checkpointType.value = '';
    Future.delayed(Duration(seconds: 1), () {
      getCheckPointlist(
          selectedchecklistId: 0.toString(), facilityId: facilityId);
    });
    Future.delayed(Duration(seconds: 4), () {
      isSuccess.value = false;
    });
  }

  void isDeleteDialog({String? check_point_id, String? check_point}) {
    Get.dialog(
      AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${check_point}", style: Styles.blackBold16),
              Divider(
                color: ColorValues.appLightGreyColor,
              ),
              Dimens.boxHeight5,
              RichText(
                text: TextSpan(
                    text: 'Are you sure you want to delete the checkpoint ',
                    style: Styles.blackBold16,
                    children: [
                      TextSpan(
                        text: check_point,
                        style: TextStyle(
                          color: ColorValues.orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                  backgroundColor: ColorValues.appRedColor,
                  onPressed: () {
                    Get.back();
                  },
                  text: 'No'),
              CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  onPressed: () {
                    deleteCkeckpoint(check_point_id).then((value) {
                      Get.back();
                      getCheckPointlist(
                          selectedchecklistId: 0.toString(),
                          facilityId: facilityId);
                    });
                  },
                  text: 'Yes'),
            ],
          )
        ],
      ),
    );
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<PreventiveCheckListModel>:
        {
          int checklistIndex = checkList.indexWhere((x) => x?.name == value);
          selectedchecklistId.value =
              checkList[checklistIndex]?.id.toString() ?? "";
          cleardata();
          getCheckPointlist(
              selectedchecklistId: selectedchecklistId.value,
              facilityId: facilityId);
        }

        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> deleteCkeckpoint(String? check_point_id) async {
    {
      await preventiveCheckPointPresenter.deleteCkeckpoint(
        check_point_id,
        isLoading: true,
      );
    }
  }

  Future<bool> updateCheckPoint(checkPontId) async {
    String _checkPoint = checkPointCtrlr.text.trim();
    String _requirement = requirementCtrlr.text.trim();
    int _checklistId = int.tryParse(selectedchecklist.value) ?? 0;
    int _failurewtg = int.tryParse(failurewtgCtrlr.text.trim()) ?? 0;
    int _max = int.tryParse(maxRangeCtrlr.text.trim()) ?? 0;
    int _min = int.tryParse(minRangeCtrlr.text.trim()) ?? 0;

    CheckpointType checkpoint_type = CheckpointType(
        id: checkpointType.value == "Text"
            ? 0
            : checkpointType.value == "Bool"
                ? 1
                : 2,
        max: _max,
        min: _min);

    CreateCheckpoint createCheckpoint = CreateCheckpoint(
        check_point: _checkPoint,
        requirement: _requirement,
        checklist_id: _checklistId,
        id: checkPontId,
        is_document_required: isToggleOn.value ? 1 : 0,
        failure_weightage: _failurewtg,
        checkpoint_type: checkpoint_type,
        status: 1);
    var checkpointJsonString =
        createCheckpoint.toJson(); //createCheckPointToJson([createCheckpoint]);

    print({"checkpointJsonString", checkpointJsonString});
    await preventiveCheckPointPresenter.updateCheckPoint(
      checkpointJsonString: checkpointJsonString,
      isLoading: true,
    );
    return true;
  }
}
