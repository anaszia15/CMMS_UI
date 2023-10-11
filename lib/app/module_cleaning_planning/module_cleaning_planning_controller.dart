import 'dart:async';

import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_presenter.dart';
import 'package:cmms/domain/models/create_mc_plan_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/inventory_category_model.dart';
import '../home/home_controller.dart';

class ModuleCleaningPlanningController extends GetxController {
  ///
  ModuleCleaningPlanningController(
    this.moduleCleaningPlanningPresenter,
  );
  ModuleCleaningPlanningPresenter moduleCleaningPlanningPresenter;
  final HomeController homecontroller = Get.find();

  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  RxList<EmployeeModel?> assignedToList = <EmployeeModel>[].obs;
  Rx<bool> isAssignedToSelected = true.obs;
  Rx<String> selectedAssignedTo = ''.obs;
  int selectedAssignedToId = 0;
  bool openStartDatePicker = false;
  var startDateTc = TextEditingController();
  var mcTitelCtrlr = TextEditingController();
  var durationInDayCtrlr = TextEditingController();

  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;

  var selectedOption = ''.obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  RxList<EquipmentListModel?> equipmentList = <EquipmentListModel?>[].obs;
  RxList<SMBS> smblist = <SMBS>[].obs;

  var days = <TypeModel>[
    TypeModel(name: 'Day 1', id: "0"),
    TypeModel(name: 'Day 2', id: "1"),
    TypeModel(name: 'Day 3', id: "2"),
  ];
  Map<String, TypeModel> typedropdownMapperData = {};

  var type = <TypeModel>[
    TypeModel(name: "Please Select", id: "0"),
    TypeModel(name: 'Dry', id: "0"),
    TypeModel(name: 'Wet', id: "1"),
  ];
  // var days = <TypeModel>[
  //   TypeModel(name: "Please Select", id: "0"),
  //   TypeModel(name: 'Day 1', id: "1"),
  //   TypeModel(name: 'Day 2', id: "2"),
  //   TypeModel(name: 'Day 3', id: "3"),
  // ];
  void addRowItem() {
    rowItem.value.add([
      {"key": "day", "value": ''},
      {"key": "noOfInverters", "value": ''},
      {'key': "noOfSMBs", "value": ''},
      {'key': "noOfModules", "value": ''},
      {'key': "type", "value": 'Please Select'},
    ]);
  }

  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
        facilityId = event;

        Future.delayed(Duration(seconds: 1), () {
          getFrequencyList();
        });

        Future.delayed(Duration(seconds: 1), () {
          getEquipmentModelList(facilityId, true);
        });
        Future.delayed(Duration(seconds: 1), () {
          getAssignedToList();
        });
      });
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }

  Future<void> getEquipmentModelList(int facilityId, bool isLoading) async {
    equipmentList.value = <EquipmentListModel>[];

    final list = await moduleCleaningPlanningPresenter.getEquipmentModelList(
        isLoading: isLoading, facilityId: facilityId);
    // print('incidentReportFacilityId$facilityId');
    // print('Incident Report List:$list');
    // for (var equipment_list in list) {
    //   equipmentList.add(equipment_list);
    // }

    if (list != null) {
      equipmentList.value = list;
      // for (var equimentCategory in list) {
      //   smblist.add(equimentCategory.smbs as SMBS);
      // }

      // }
    }

    update(['equipment_list']);
  }

  void createMcPlan() async {
    String _durationInDayCtrlr = durationInDayCtrlr.text.trim();
    String _mcTitelCtrlr = mcTitelCtrlr.text.trim();
    List<Schedules> schedules = [];
    List<EquipmentsList?>? equipments = [];
    equipmentList.forEach((e) {
      e?.smbs.forEach((element) {
        equipments.add(EquipmentsList(id: element.smbId ?? 0));
      });
    });
    equipmentList.forEach((e) {
      schedules.add(
          Schedules(cleaningDay: 1, cleaningType: 1, equipments: equipments));
    });
    CreateMcPalningsModel createMcModel = CreateMcPalningsModel(
        // id: 0,
        facilityId: facilityId,
        frequencyId: selectedfrequencyId,
        noOfCleaningDays: int.tryParse(_durationInDayCtrlr) ?? 0,
        title: _mcTitelCtrlr,
        schedules: schedules);

    var createMcModelJsonString = [createMcModel.toJson()];
    Map<String, dynamic>? responseCreateMcModel =
        await moduleCleaningPlanningPresenter.createMcPlan(
      createMcPlans: createMcModelJsonString,
      isLoading: true,
    );

    if (responseCreateMcModel == null) {}
    print('Create Mc  data: $createMcModelJsonString');
  }

  Future<void> getAssignedToList() async {
    assignedToList.clear();
    final _assignedToList =
        await moduleCleaningPlanningPresenter.getAssignedToList(
      facilityId: facilityId,
    );

    if (_assignedToList != null) {
      for (var assignedTo in _assignedToList) {
        assignedToList.add(assignedTo);
      }
      // selectedAssignedTo.value =
      //     getAssignedToName(jobDetailsModel.value?.assignedId ?? 0) ?? '';
    }
  }

  Future<void> getFrequencyList() async {
    final list =
        await moduleCleaningPlanningPresenter.getFrequencyList(isLoading: true);

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
          selectedfrequency.value = value;
        }
        break;

      default:
        {}
        break;
    }
  }
}
