import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_presenter.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/create_warranty_claim_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/employee_list_model2.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_category_model2.dart';
import 'package:cmms/domain/models/inventory_details_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WarrantyClaimController extends GetxController {
  WarrantyClaimController(this.warrantyClaimPresenter);
  WarrantyClaimPresenter warrantyClaimPresenter;

  final HomeController homeController = Get.find();
  FocusNode immcoracFocus = FocusNode();
  ScrollController immcoracScroll = ScrollController();
  FocusNode wdescFocus = FocusNode();
  ScrollController wdescScroll = ScrollController();
  FocusNode wtitleFocus = FocusNode();
  ScrollController wtitleScroll = ScrollController();
  var itemCount = 0.obs;

  //Additional Email work
  var rowList = <String>[].obs;
  var rowList2 = <String>[].obs;
  var rowList3 = <String>[].obs;

  void removeRow({required int index}) {
    supplierActions.removeAt(index);
  }

  ///External Emails Part
  var externalEmails = <ExternalEmails>[].obs;
  void updateText(String name, String email, int? mobile) {
    externalEmails
        .add(ExternalEmails(email: email, name: name, mobile: mobile));
  }

  ///Radio
  RxString selectedSeverity = RxString('');
  void setSelectedSeverity(String severity) {
    selectedSeverity.value = severity;
  }

  ///Supplier Action Part
  var supplierActions = <SupplierActions>[].obs;
  void updateSupplierActionText(
    String name,
    String required_by_data,
    String srNumber,
  ) {
    supplierActions.add(SupplierActions(
      name: name,
      required_by_date: required_by_data,
      // is_required: is_required
      srNumber: srNumber,
    ));
  }

  final TextEditingController supplierActionTextFieldController =
      TextEditingController();
  final TextEditingController supplierActionSrNumberTextFieldController =
      TextEditingController();

  ///Checkbox
  ////
  RxBool isCheckedRequire = false.obs;
  RxBool isCheckedDataRequire = false.obs;
  bool openFromDateToStartDatePicker = false;
  void requireToggleCheckbox() {
    isCheckedRequire.value = !isCheckedRequire.value;
    isCheckedDataRequire.value = isCheckedRequire.value;
    print('Checkbox value ${isCheckedRequire.value}');
    print(
        'Checkbox Data value ${isCheckedDataRequire.value}'); // Toggle the checkbox state
    // Toggle the checkbox state
  }

  final TextEditingController serialNoTextFieldController =
      TextEditingController();
  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController emailTextFieldController =
      TextEditingController();
  final TextEditingController mobileTextFieldController =
      TextEditingController();

  ///Failure Date Time For Web
  var failureDateTimeCtrlrWeb = TextEditingController();
  var failureDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedFailureDateTimeWeb = DateTime.now().obs;

  ///WC List Date Time For Web
  var warrantyClaimListDateTimeCtrlrWeb = TextEditingController();
  var warrantyClaimListDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedwarrantyClaimListDateTimeWeb = DateTime.now().obs;

  ///Supplier Action Date Time For Web
  var supplierActionDateTimeCtrlrWeb = TextEditingController();
  var supplierActionDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedSupplierActionDateTimeWeb = DateTime.now().obs;

  ///Warranty Start date Time for web
  var warrantyStartDateTimeCtrlrWeb = TextEditingController();
  var warrantyStartDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedWarrantyStartDateTime = DateTime.now().obs;

  ///Warranty End date time for web
  var warrantyEndDateTimeCtrlrWeb = TextEditingController();
  var warrantyEndDateTimeCtrlrWebBuffer;
  Rx<DateTime> selectedWarrantyEndDateTime = DateTime.now().obs;

  Set<String> supplierNameSet = {};

  WarrantyClaimModel? warrantyClaimListModel;
  RxList<String> warrantyClaimListTableColumns = <String>[].obs;

//Warranty Claim
  // var warrantyClaimList = <WarrantyClaimModel>[];
  RxList<WarrantyClaimModel?> filteredData = <WarrantyClaimModel>[].obs;
  RxList<WarrantyClaimModel?> warrantyClaimList = <WarrantyClaimModel>[].obs;

  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<bool> isEquipmentCategorySelected = true.obs;
  Rx<String> selectedEquipmentCategory = ''.obs;
  int selectedEquipmentCategoryIds = 0;

  RxList<EquipmentModel?> equipmentModelList = <EquipmentModel>[].obs;
  RxList<int> selectedEquipmentList = <int>[].obs;
  Rx<bool> isInventorySelected = true.obs;
  RxList<int> selectedEquipmentIdList = <int>[].obs;
  Rx<String> selectedInventory = ''.obs;

  ///Equipment name List
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedEquipmentName = ''.obs;
  Rx<bool> isEquipmentNameSelected = true.obs;
  int selectedEquipmentnameId = 0;
  // String? selectedEquipmentName = '';

  //Affected Part Equipemnt Name lIst
  RxList<InventoryCategoryModel2?> affectedPartEqipmentNameList =
      <InventoryCategoryModel2>[].obs;
  RxList<String?> selectedAffectedpartEquipmentNameList = <String>[].obs;
  RxList<int?> selectedAffectedPartEquipmentIdList = <int>[].obs;
  Rx<String> selectedAffectedPart = ''.obs;
  Rx<bool> isAffectedPartSelected = true.obs;
  int selectedAffectedPartId = 0;
  String? selectedAffectedPartName = '';

  RxList<BusinessListModel?> supplierNameList = <BusinessListModel>[].obs;
  Rx<bool> isSupplierNameSelected = true.obs;
  Rx<String> selectedSupplier = ''.obs;
  RxList<String?> selectedSupplierNameList = <String>[].obs;
  RxList<int?> selectedSupplierNameIdList = <int>[].obs;
  Rx<bool> isBlockSelected = true.obs;

  //From and To date format
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);

  ///Currency List
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<String> selectedUnitCurrency = ''.obs;
  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  RxList<int?> selectedUnitCurrencyIdList = <int>[].obs;
  int selectedCurrencyId = 0;

  /// Employee List / Approver
  RxList<EmployeeListModel> employeeList = <EmployeeListModel>[].obs;
  Rx<bool> isemployeeListSelected = true.obs;
  Rx<String> selectedEmployeeList = ''.obs;
  RxList<String?> selectedEmployeeDataList = <String>[].obs;
  RxList<int?> selectedEmployeeIdList = <int>[].obs;
  int selectedApproverId = 0;

  /// Employees List / Additional Email
  RxList<EmployeeListModel2> employeesList = <EmployeeListModel2>[].obs;
  Rx<bool> isemployeesListSelected = true.obs;
  Rx<String> selectedEmployeesList = ''.obs;
  RxList<int> selectedEmployeeNameIdList = <int>[].obs;
  RxList<String?> selectedEmployeesDataList = <String>[].obs;
  RxList<int?> selectedEmployeesIdList = <int>[].obs;
  int selectedEmployeesId = 0;
  int facilityId = 0;

  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];
  var equipmentList = <EquipmentModel>[];

  ///Text Editing Controller
  final warrantyClaimTitleTextController = TextEditingController();
  final warrantyClaimBriefDescTextController = TextEditingController();
  final immediateCorrectiveActionTextController = TextEditingController();
  final requestManufactureTextController = TextEditingController();
  final costOfReplacementTextController = TextEditingController();
  final orderReferenceNoTextController = TextEditingController();
  final affectedSerialNoTextController = TextEditingController();
  final manufacturerNameTextController = TextEditingController();

  final blockTextController = TextEditingController();
  final parentEquipmentTextController = TextEditingController();

  //WC Grid

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "WC Id": true,
    "Date Of Claim": true,
    "Warranty Claim Title": true,
    "Equipment Serial No.": true,
    "Equipment Category": true,
    "Equipment Name": true,
    "Estimated Cost": true,
    "Status": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "WC Id": 153,
    "Date Of Claim": 320,
    "Warranty Claim Title": 220,
    "Equipment Serial No.": 200,
    "Equipment Category": 250,
    "Equipment Name": 250,
    "Estimated Cost": 250,
    "Status": 250,
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  RxString warrantyClaimIdFilterText = ''.obs;
  RxString dateOfClaimFilterText = ''.obs;
  RxString wcTitleFilterText = ''.obs;
  RxString equipmentSrNoFilterText = ''.obs;
  RxString equipmentCategoryFilterText = ''.obs;
  RxString equipmentNameFilterText = ''.obs;
  RxString estimatedCostFilterText = ''.obs;
  RxString statusFilterText = ''.obs;
  RxString actionFilterText = ''.obs;

  /// Inventory Details Model
  Rx<InventoryDetailsModel?> inventoryDetailsModel =
      InventoryDetailsModel().obs;
  RxList<InventoryDetailsModel?>? inventoryDetailsList =
      <InventoryDetailsModel?>[].obs;

  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();
  //int facilityId = 45;
  String categoryIds = '';
  Rx<bool> isFormInvalid = false.obs;

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  PaginationController paginationWarrantyController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  PaginationController paginationBusinessListController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<int> wc_id = 0.obs;

  ///
// int? wc_id = 0;
  @override
  void onInit() async {
    this.filterText = {
      "WC Id": warrantyClaimIdFilterText,
      "Date Of Claim": dateOfClaimFilterText,
      "Warranty Claim Title": wcTitleFilterText,
      "Equipment Serial No.": equipmentSrNoFilterText,
      "Equipment Category": equipmentCategoryFilterText,
      "Equipment Name": equipmentNameFilterText,
      "Estimated Cost": estimatedCostFilterText,
      "Status": statusFilterText
    };
    // wc_id = Get.arguments;
    // print('WC_Id:$wc_id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getWarrantyClaimList(
            facilityId, formattedTodate, formattedFromdate, true);
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    // Future.delayed(Duration(seconds: 1), () {
    //   getuserAccessData();
    // });
    Future.delayed(Duration(seconds: 1), () {
      getInventoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getAffectedPartList();
    });

    Future.delayed(Duration(seconds: 1), () {
      getInventoryCategoryList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getBusinessList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getUnitCurrencyList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getEmployeeList();
    });
    Future.delayed(Duration(seconds: 1), () {
      getEmployeesList();
    });
  immcoracFocus.addListener(() {
      if (!immcoracFocus.hasFocus) {
        immcoracScroll.jumpTo(0.0);
      }
    });
    wtitleFocus.addListener(() {
      if (!wtitleFocus.hasFocus) {
        wtitleScroll.jumpTo(0.0);
      }
    });
    wdescFocus.addListener(() {
      if (!wdescFocus.hasFocus) {
        wdescScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await warrantyClaimPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getInventoryDetail() async {
    // newPermitDetails!.value = <NewPermitListModel>[];
    inventoryDetailsList?.value = <InventoryDetailsModel>[];

    final _inventoryDetails = await warrantyClaimPresenter.getInventoryDetail(
        id: selectedEquipmentnameId);
    print('Inventory Detail:$_inventoryDetails');

    if (_inventoryDetails != null) {
      inventoryDetailsModel.value = _inventoryDetails;
      affectedSerialNoTextController.text =
          inventoryDetailsModel.value?.serialNumber ?? '';
      manufacturerNameTextController.text =
          inventoryDetailsModel.value?.manufacturerName ?? '';
      costOfReplacementTextController.text =
          '${int.tryParse('${inventoryDetailsModel.value?.cost ?? ''}')}';
      requestManufactureTextController.text =
          inventoryDetailsModel.value?.supplierName ?? '';
    }
  }

  // Future<void> getuserAccessData() async {
  //   final _userAccessList = await warrantyClaimPresenter.getUserAccessList();

  //   if (_userAccessList != null) {
  //     final userAccessModelList = jsonDecode(_userAccessList);
  //     var userAccess = AccessListModel.fromJson(userAccessModelList);
  //     varUserAccessModel.value = userAccess;
  //     varUserAccessModel.value.access_list = userAccess.access_list;
  //   }
  // }

  void employeesNameSelected(_selectedEmployeesNameIds) {
    selectedEmployeeNameIdList.value = <int>[];
    for (var _selectedEmployeesId in _selectedEmployeesNameIds) {
      selectedEmployeeNameIdList.add(_selectedEmployeesId);
    }
  }

  void affectedPartSelected(_selectedaffectedPartIds) {
    selectedAffectedPartEquipmentIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedaffectedPartIds) {
      selectedAffectedPartEquipmentIdList.add(_selectedCategoryId);
    }
  }

  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await warrantyClaimPresenter.getInventoryCategoryList(
      isLoading: true,
    );

    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  Future<void> getAffectedPartList({String? facilityId}) async {
    affectedPartEqipmentNameList.value = <InventoryCategoryModel2>[];
    final _affectedPartList = await warrantyClaimPresenter.getAffectedPartList(
      isLoading: true,
    );

    if (_affectedPartList != null) {
      for (var affectedPart in _affectedPartList) {
        affectedPartEqipmentNameList.add(affectedPart);
      }
    }
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await warrantyClaimPresenter.getInventoryList(
      isLoading: true,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
    //  print('equipment Name List:$inventoryNameList');
    for (var inventory_list in _inventoryList) {
      eqipmentNameList.add(inventory_list);
    }
    inventoryList = _inventoryList;
    paginationController = PaginationController(
      rowCount: eqipmentNameList.length,
      rowsPerPage: 10,
    );
    update(['inventory_list']);
  }

  void getBusinessList() async {
    supplierNameList.value = <BusinessListModel>[];
    final _supplierNameList = await warrantyClaimPresenter.getBusinessList(
      isLoading: true,
      //  categoryIds: categoryIds,
      businessType: 5,
    );
    //  print('Supplier Name List:$supplierNameList');
    for (var supplier_list in _supplierNameList) {
      supplierNameList.add(supplier_list);
    }
    // supplierNameList = _supplierNameList;
    // paginationBusinessListController = PaginationController(
    //   rowCount: supplierNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['business_list']);
  }

  void getUnitCurrencyList() async {
    unitCurrencyList.value = <CurrencyListModel>[];
    final _unitCUrrencyList = await warrantyClaimPresenter.getUnitCurrencyList(
      isLoading: true,
      // categoryIds: categoryIds,
      facilityId: facilityId,
    );
    print('Unit Currency List:$unitCurrencyList');
    for (var unit_currency_list in _unitCUrrencyList) {
      unitCurrencyList.add(unit_currency_list);
    }
    // supplierNameList = _supplierNameList;
    // paginationBusinessListController = PaginationController(
    //   rowCount: supplierNameList.length,
    //   rowsPerPage: 10,
    // );
    update(['unit_currency_list']);
  }

  void getEmployeeList() async {
    employeeList.value = <EmployeeListModel>[];
    final _employeeList = await warrantyClaimPresenter.getEmployeeList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Employee List:$employeeList');
    for (var employee_list in _employeeList) {
      employeeList.add(employee_list);
    }

    update(['employee_list']);
  }

  void getEmployeesList() async {
    employeesList.value = <EmployeeListModel2>[];
    final _employeesList = await warrantyClaimPresenter.getEmployeesList(
      isLoading: true,
      // categoryIds: categoryIds,
      facility_id: facilityId,
    );
    print('Employees List:$employeesList');
    for (var employees_list in _employeesList) {
      employeesList.add(employees_list);
    }

    update(['employee_list']);
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      warrantyClaimList.value = filteredData;
      return;
    }
    List<WarrantyClaimModel?> filteredList = filteredData
        .where((item) =>
            (item?.wc_id?.toString().toLowerCase().contains(keyword.toLowerCase()) ?? false) ||
            (item?.date_of_claim?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.warranty_claim_title
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipment_sr_no
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipment_category
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.equipment_name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item?.status?.toString().toLowerCase().contains(keyword.toLowerCase()) ??
                false) ||
            (item?.estimated_cost
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    warrantyClaimList.value = filteredList;
    // warrantyClaimList.value = filteredData
    //     .where((item) => item!.warranty_claim_title!
    //         .toLowerCase()
    //         .contains(keyword.toLowerCase()))
    //     .toList();
    // update(['warranty_claim_list']);
  }

  Future<void> getWarrantyClaimList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    // supplierNameList.value = <WarrantyClaimModel>[];

    final list = await warrantyClaimPresenter.getWarrantyClaimList(
      isLoading: isLoading,
      categoryIds: categoryIds,
      facilityId: facilityId,
      start_date: startDate,
      end_date: endDate,
    );
    print('Supplier Name List:$supplierNameList');
    Set<String> supplierNameSet = {};
    for (var _supplierNameList in list) {
      if (_supplierNameList.supplier_name != null) {
        supplierNameSet.add(_supplierNameList.supplier_name ?? "");
      }
    }
    warrantyClaimList.value = list;
    filteredData.value = warrantyClaimList.value;
    paginationWarrantyController = PaginationController(
      rowCount: warrantyClaimList.length,
      rowsPerPage: 10,
    );
    if (filteredData.isNotEmpty) {
      warrantyClaimListModel = filteredData[0];
      var warrantyClaimListJson = warrantyClaimListModel?.toJson();
      warrantyClaimListTableColumns.value = <String>[];
      for (var key in warrantyClaimListJson?.keys.toList() ?? []) {
        warrantyClaimListTableColumns.add(key);
      }
    }
    update(['warranty_claim_list']);
  }

  void getBlockList(String facilityId) async {
    final list = await warrantyClaimPresenter.getBlockList(
        isLoading: false, facilityId: facilityId);
    blockList = list;
    update(['block_list']);
  }

  void getEquipmentList({
    required String facilityId,
  }) async {
    final list = await warrantyClaimPresenter.getEquipmentList(
      isLoading: false,
      facilityId: facilityId,
    );
    equipmentList = list;
    update(['equipment_list']);
  }

  void onSelectEquipment(EquipmentModel equipment) {
    selectedEquipment = equipment;
    parentEquipmentTextController.text = selectedEquipment.name ?? '';

    update(['equipment_list']);
  }

  void onSelectBlock(BlockModel block) {
    selectedBlock = block;
    blockTextController.text = selectedBlock.name ?? '';

    update(['block_field']);
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
      case RxList<InventoryModel>:
        {
          // for (var workAreaName in selectedWorkAreaNameList) {
          int equipmentNameIndex =
              eqipmentNameList.indexWhere((x) => x?.name == value);
          selectedEquipmentnameId =
              eqipmentNameList[equipmentNameIndex]?.id ?? 0;
          getInventoryDetail();

          if (selectedEquipmentnameId > 0) {
            isEquipmentNameSelected.value = true;
          }
          selectedEquipmentName.value = value;

          print('Equipment name Id: $selectedEquipmentnameId');

          // }
        }
        break;
      case RxList<InventoryCategoryModel2>:
        {
          // for (var workAreaName in selectedWorkAreaNameList) {
          int affectedPartIndex =
              affectedPartEqipmentNameList.indexWhere((x) => x?.name == value);
          selectedAffectedPartId =
              affectedPartEqipmentNameList[affectedPartIndex]?.id ?? 0;
          selectedAffectedPartName =
              affectedPartEqipmentNameList[affectedPartIndex]?.name ?? '';

          if (selectedAffectedPartId > 0) {
            isAffectedPartSelected.value = true;
          }
          selectedAffectedPart.value = value;
          print('Affected part Id: $selectedAffectedPartId');
          print('Affected part name : $selectedAffectedPartName');

          // }
        }
        break;
      case RxList<BusinessListModel>:
        {
          for (var supplierName in selectedSupplierNameList) {
            int supplierNameIndex =
                supplierNameList.indexWhere((x) => x?.name == supplierName);
            selectedSupplierNameIdList.add(supplierNameIndex);
          }
        }
        break;
      case RxList<CurrencyListModel>:
        {
          // for (var unitCurrency in selectedUnitCurrencyList) {
          int unitCurrencyIndex =
              unitCurrencyList.indexWhere((x) => x?.name == value);
          selectedCurrencyId = unitCurrencyList[unitCurrencyIndex]?.id ?? 0;

          if (selectedCurrencyId > 0) {
            isUnitCurrencySelected.value = true;
          }
          selectedUnitCurrency.value = value;
          print('Unit Currency Id :$selectedCurrencyId');

          // }
        }
        break;
      case RxList<EmployeeListModel>:
        {
          // for (var employeeDataList in selectedEmployeeDataList) {
          int employeeListIndex =
              employeeList.indexWhere((x) => x.name == value);
          selectedApproverId = employeeList[employeeListIndex].id ?? 0;

          if (selectedApproverId > 0) {
            isemployeeListSelected.value = true;
          }
          selectedEmployeeList.value = value;
          print('Approver Id: $selectedApproverId');

          // }
        }
        break;
      case RxList<EmployeeListModel2>:
        {
          // for (var employeeDataList in selectedEmployeeDataList) {
          int employeesListIndex =
              employeesList.indexWhere((x) => x.name == value);
          selectedEmployeesId = employeesList[employeesListIndex].id ?? 0;

          // if (selectedApproverId > 0) {
          //   isemployeeListSelected.value = true;
          // }
          // selectedEmployeeList.value = value;
          print('Additional Email Employees Id: $selectedEmployeesId');

          // }
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void checkForm() {
    if (selectedEquipmentName.value == '') {
      isEquipmentNameSelected.value = false;
    }
    if (selectedAffectedPart.value == '') {
      isAffectedPartSelected.value = false;
    }
    if (selectedUnitCurrency.value == '') {
      isUnitCurrencySelected.value = false;
    }
    if (selectedEmployeeList.value == '') {
      isemployeeListSelected.value = false;
    }

    if (warrantyClaimTitleTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Title Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (warrantyClaimBriefDescTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Description Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (affectedSerialNoTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Affected Serial No Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (failureDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Failure Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (warrantyStartDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Warranty Start Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (warrantyEndDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Warranty End Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (orderReferenceNoTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Order Reference No Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (costOfReplacementTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Cost of Replacement Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (immediateCorrectiveActionTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Corrective Action Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (requestManufactureTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Request Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (isEquipmentNameSelected.value == false ||
        isAffectedPartSelected.value == false ||
        isUnitCurrencySelected.value == false ||
        isemployeeListSelected.value == false) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  ///Create Warranty Claim
  void createWarrantyClaim() async {
    {
      checkForm();
      if (isFormInvalid.value) {
        return;
      }

      String _warrantyClaimTitle =
          htmlEscape.convert(warrantyClaimTitleTextController.text.trim());
      String _description =
          htmlEscape.convert(warrantyClaimBriefDescTextController.text.trim());
      String _immediateCorrectiveByBuyer = htmlEscape
          .convert(immediateCorrectiveActionTextController.text.trim());
      String _requestToBuyer =
          htmlEscape.convert(requestManufactureTextController.text.trim());
      // String _costOfReplacement =
      //     htmlEscape.convert(costOfReplacementTextController.text.trim());
      String _orderReferenceNo =
          htmlEscape.convert(orderReferenceNoTextController.text.trim());
      String _affectedSerialNo =
          htmlEscape.convert(affectedSerialNoTextController.text.trim());

      int costOfReplacement =
          int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');
      late List<ExternalEmails> external_emails_list = [];

      externalEmails.forEach((e) {
        external_emails_list.add(ExternalEmails(name: e.name, email: e.email));
      });

      late List<SupplierActions> supplier_action_list = [];

      supplierActions.forEach((e) {
        supplier_action_list.add(SupplierActions(
          name: e.name,
          required_by_date: e.required_by_date,
          // is_required: e.is_required
        ));
      });

      CreateWarrantyClaimModel createwarrantyClaimModel =
          CreateWarrantyClaimModel(
              facilityId: facilityId,
              equipmentId: selectedEquipmentnameId,
              goodsOrderId: 14205,
              affectedPart: selectedAffectedPartName,
              orderReference: _orderReferenceNo,
              affectedSrNo: _affectedSerialNo,
              costOfReplacement: costOfReplacement,
              currencyId: selectedCurrencyId,
              severity: selectedSeverity.value,
              warrantyStartAt: warrantyStartDateTimeCtrlrWebBuffer,
              warrantyEndAt: warrantyEndDateTimeCtrlrWebBuffer,
              warrantyClaimTitle: _warrantyClaimTitle,
              warrantyDescription: _description,
              correctiveActionByBuyer: _immediateCorrectiveByBuyer,
              requestToSupplier: _requestToBuyer,
              approverId: selectedApproverId, //
              failureTime: failureDateTimeCtrlrWebBuffer,
              additionalEmailEmployees: selectedEmployeeNameIdList,
              externalEmails: external_emails_list,
              supplierActions: supplier_action_list,
              status: 1

              ///additional data to create WC as 'Submit for Release'

              );

      var warrantyClaimJsonString = [createwarrantyClaimModel.toJson()];
      Map<String, dynamic>? responseCreateWarrantyClaim =
          await warrantyClaimPresenter.createWarrantyClaim(
        createWarrantyClaim: warrantyClaimJsonString,
        isLoading: true,
      );

      if (responseCreateWarrantyClaim == null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Create Warranty Claim data: $warrantyClaimJsonString');
    }
  }

  ///Saving AS Draft
  void checkSaveDraftForm() {
    if (selectedEquipmentName.value == '') {
      isEquipmentNameSelected.value = false;
    }
    if (selectedAffectedPart.value == '') {
      isAffectedPartSelected.value = false;
    }
    if (selectedUnitCurrency.value == '') {
      isUnitCurrencySelected.value = false;
    }
    if (selectedEmployeeList.value == '') {
      isemployeeListSelected.value = false;
    }

    if (warrantyClaimTitleTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Title Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (warrantyClaimBriefDescTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Description Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (affectedSerialNoTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Affected Serial No Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (failureDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Failure Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (warrantyStartDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Warranty Start Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (warrantyEndDateTimeCtrlrWebBuffer == null) {
      Fluttertoast.showToast(
          msg: 'Warranty End Date Time Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (orderReferenceNoTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Order Reference No Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (costOfReplacementTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Cost of Replacement Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (immediateCorrectiveActionTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Corrective Action Field cannot be empty',
          timeInSecForIosWeb: 5);
    }
    if (requestManufactureTextController.text == '') {
      Fluttertoast.showToast(
          msg: 'Request Field cannot be empty', timeInSecForIosWeb: 5);
    }
    if (isEquipmentNameSelected.value == false ||
        isAffectedPartSelected.value == false ||
        isUnitCurrencySelected.value == false ||
        isemployeeListSelected.value == false) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  ///Saving As Draft & Create Warranty Claim
  void saveAsDraft() async {
    {
      checkSaveDraftForm();
      if (isFormInvalid.value) {
        return;
      }

      String _warrantyClaimTitle =
          htmlEscape.convert(warrantyClaimTitleTextController.text.trim());
      String _description =
          htmlEscape.convert(warrantyClaimBriefDescTextController.text.trim());
      String _immediateCorrectiveByBuyer = htmlEscape
          .convert(immediateCorrectiveActionTextController.text.trim());
      String _requestToBuyer =
          htmlEscape.convert(requestManufactureTextController.text.trim());
      // String _costOfReplacement =
      //     htmlEscape.convert(costOfReplacementTextController.text.trim());
      String _orderReferenceNo =
          htmlEscape.convert(orderReferenceNoTextController.text.trim());
      String _affectedSerialNo =
          htmlEscape.convert(affectedSerialNoTextController.text.trim());

      int costOfReplacement =
          int.parse(costOfReplacementTextController.text.trim());

      // int? sopFileId = createSOPModel2.sop_fileId;
      // // int? jsaFileId = data.jsa_fileId;
      // print('SOPFileId:$sopFileId');
      late List<ExternalEmails> external_emails_list = [];

      externalEmails.forEach((e) {
        external_emails_list.add(ExternalEmails(name: e.name, email: e.email));
      });

      late List<SupplierActions> supplier_action_list = [];

      supplierActions.forEach((e) {
        supplier_action_list.add(SupplierActions(
          name: e.name,
          required_by_date: e.required_by_date,
          // is_required: e.is_required
        ));
      });

      CreateWarrantyClaimModel createwarrantyClaimModel =
          CreateWarrantyClaimModel(
              facilityId: facilityId,
              equipmentId: selectedEquipmentnameId,
              goodsOrderId: 14205,
              affectedPart: selectedAffectedPartName,
              orderReference: _orderReferenceNo,
              affectedSrNo: _affectedSerialNo,
              costOfReplacement: costOfReplacement,
              currencyId: selectedCurrencyId,
              severity: selectedSeverity.value,
              warrantyStartAt: warrantyStartDateTimeCtrlrWebBuffer,
              warrantyEndAt: warrantyEndDateTimeCtrlrWebBuffer,
              warrantyClaimTitle: _warrantyClaimTitle,
              warrantyDescription: _description,
              correctiveActionByBuyer: _immediateCorrectiveByBuyer,
              requestToSupplier: _requestToBuyer,
              approverId: selectedApproverId, //
              failureTime: failureDateTimeCtrlrWebBuffer,
              additionalEmailEmployees: selectedEmployeeNameIdList,
              externalEmails: external_emails_list,
              supplierActions: supplier_action_list,
              status: 0 //additional data to save as draft

              );

      var saveAsJsonString = [createwarrantyClaimModel.toJson()];
      Map<String, dynamic>? responseCreateWarrantyClaim =
          await warrantyClaimPresenter.saveAsDraft(
        createWarrantyClaim: saveAsJsonString,
        isLoading: true,
      );

      if (responseCreateWarrantyClaim == null) {
        //  CreateNewPermitDialog();
        // showAlertDialog();
      }
      print('Save As Draft Warranty Claim data: $saveAsJsonString');
    }
  }

  Future<void> viewWarrantyClaim({int? wc_id}) async {
    Get.toNamed(Routes.viewWarrantyClaim, arguments: wc_id);
    print('Argument$wc_id');
  }

  Future<void> editWarrantyClaim({int? wc_id}) async {
    Get.toNamed(Routes.editWarrantyClaimContentWeb, arguments: wc_id);
    print('EditArgument$wc_id');
  }

  void getWarrantyClaimtListByDate() {
    getWarrantyClaimList(facilityId, formattedFromdate, formattedTodate, true);
  }
}
