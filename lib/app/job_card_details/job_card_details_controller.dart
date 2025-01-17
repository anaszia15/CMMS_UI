import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/permit_details_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import '../../domain/models/comment_model.dart';
import '../../domain/models/history_model.dart';
import '../../domain/models/job_card_details_model.dart';
import '../controllers/file_upload_controller.dart';
import '../controllers/history_controller.dart';
import '../job_details/job_details_presenter.dart';
import '../navigators/app_pages.dart';
import '../utils/utility.dart';
import 'job_card_details_presenter.dart';

class JobCardDetailsController extends GetxController {
  ///
  JobCardDetailsController(
    this.jobCardDetailsPresenter,
  );
  JobCardDetailsPresenter jobCardDetailsPresenter;

  ///
  late JobDetailsPresenter jobDetailsPresenter;

  /// History
  var historyController = Get.put(HistoryController());
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;

  /// Employee Table
  Rx<String> selectedEmployeeName = ''.obs;
  Rx<bool> isEmployeeSelected = true.obs;

  RxList<DataRow2> employeeTableRows = <DataRow2>[].obs;
  final responsibilityCtrlr = TextEditingController();
  List<TextEditingController> responsibilityCtrlrs = [];
  RxList<EmployeeModel?> employeeList = <EmployeeModel>[].obs;
  RxList<EmployeeModel>? selectedEmployeeList = <EmployeeModel>[].obs;
  Rx<EmployeeModel> selectedEmployee = EmployeeModel().obs;
  RxList<int> selectedEmployeeIdList = <int>[].obs;
  RxList<String> responsibilityList = <String>[].obs;

  /// Isolation and Loto Assets
  Rx<bool> isNormalized = false.obs;

  RxList<LotoAsset> lotoAppliedAssets = RxList<LotoAsset>([]);
  RxList<IsolationAssetsCategory> isolationAssetsCategoryList =
      RxList<IsolationAssetsCategory>([]);

  /// Permit Details
  int? permitId = 0;
  RxMap permitDetails = {}.obs;
  RxList<LstPermitDetailList>? permitList = <LstPermitDetailList>[].obs;

  /// Job Details
  Rx<int?> jobId = 0.obs;
  RxMap jobDetails = {}.obs;
  RxString strWorkTypes = ''.obs;
  RxString strWorkAreasOrEquipments = ''.obs;
  RxString strToolsRequired = ''.obs;
  RxString strEquipmentCategories = ''.obs;
  List<String> workTypeNames = [];
  List<String> assignNames = [];
  RxString strAssignName = ''.obs;

  List<String> toolsRequiredNames = [];
  List<String> equipmentCategoryNames = [];
  RxList<JobCardDetailsModel?> jobCardList = <JobCardDetailsModel?>[].obs;
  Rx<JobCardDetailsModel?> jobCardDetailsModel = JobCardDetailsModel().obs;

  TextEditingController approveCommentTextFieldCtrlr = TextEditingController();
  TextEditingController rejectCommentTextFieldCtrlr = TextEditingController();

  /// Plant Details
  int userId = 35;
  int facilityId = 46;
  RxMap plantDetails = {}.obs;

  /// Job Card
  Rx<int> jobCardId = 0.obs;
  Rx<bool> isJobCardStarted = false.obs;
  var comment = '';

  /// Other
  Rx<int> currentIndex = 0.obs;
  final unescape = HtmlUnescape();
  var descriptionOfWorkDoneCtrlr = TextEditingController();

  ///
  @override
  void onInit() async {
    // print({"madfhuiwef", jobCardId});
    try {
      Get.put(FileUploadController());

      // final _flutterSecureStorage = const FlutterSecureStorage();

      // await _flutterSecureStorage.delete(key: "JcId");

      // jobCardId.value = Get.arguments["JcId"];

      await setJcId();
      if (jobCardId.value != 0) {
        jobCardList.value = await jobCardDetailsPresenter.getJobCardDetails(
              jobCardId: jobCardId.value,
              isLoading: true,
            ) ??
            [];
      }
      getHistory();
      createPlantDetailsTableData();

      createJobDetailsTableData();
      createPermitDetailsTableData();
      //  createJcDetailsTableData();
      getEmployeeList();
      //  getPermitDetails();

      responsibilityCtrlrs.add(TextEditingController());
      currentIndex.value = -1;
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setJcId() async {
    try {
      final _jobCardId = await jobCardDetailsPresenter.getValue();

      if (_jobCardId == null || _jobCardId == '' || _jobCardId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        jobCardId.value = dataFromPreviousScreen['JcId'];
        jobCardDetailsPresenter.saveValue(
            jobCardId: jobCardId.value.toString());
      } else {
        jobCardId.value = int.tryParse(_jobCardId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString() + 'JcId');
    }
    // return jobId.value;
  }

  @override
  void onClose() {
    for (var i = 0; i < responsibilityCtrlrs.length; i++) {
      responsibilityCtrlrs[i].dispose();
    }
    super.onClose();
  }

  Future<void> getEmployeeList() async {
    final _employeeList =
        await jobCardDetailsPresenter.getAssignedToList(facilityId: facilityId);
    if (_employeeList != null) {
      for (var employee in _employeeList) {
        employeeList.add(employee);
      }
      // update(["employeeList"]);
    }
  }

  Future<void> getHistory() async {
    /// TODO: CHANGE THESE VALUES
    int moduleType = 4;
    // int tempModuleType = 21;
    // int tempJobCardId = 5326;
    //
    historyList?.value = await jobCardDetailsPresenter.getJobCardHistory(
          // tempModuleType,
          // tempJobCardId,
          moduleType,
          jobCardId.value,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  void createPlantDetailsTableData() {
    if (jobCardList.isNotEmpty) {
      jobCardDetailsModel.value = jobCardList[0];
      equipmentCategoryNames = <String>[];
      for (var eC in jobCardDetailsModel.value?.lstPermitDetailList ?? []) {
        //  equipmentCategoryNames.add(eC);
      }
      strEquipmentCategories.value = equipmentCategoryNames.join(', ');
      plantDetails.value = {
        "Plant Details": jobCardDetailsModel.value?.plantName,
        "Block": jobCardDetailsModel.value?.plantName,
        // "Equipment Categories": jobCardDetailsModel.value?.assetCategoryName,
      };
    }
  }

  void createJobDetailsTableData() {
    print({'status to start job', jobCardList[0]!.status});

    try {
      if (jobCardList.isNotEmpty) {
        //   // jobCardDetailsModel.value = jobCardList[0];

        //   // Convert tools required to comma separated list
        //   toolsRequiredNames = <String>[];
        //   // for (var toolRequired
        //   //     in jobCardDetailsModel.value?.lstToolsRequired ?? []) {
        //   //   toolsRequiredNames.add(toolRequired.name);
        //   //  }
        //   strToolsRequired.value = toolsRequiredNames.join(', ');
        //   //remove extra comma at the end
        //   if (strToolsRequired.value.length > 0) {
        //     strToolsRequired.value = strToolsRequired.substring(
        //       0,
        //       strToolsRequired.value.length - 1,
        //     );
        //   }
        //   // Convert work type(s) to comma separated list
        workTypeNames = <String>[];
        for (var workType
            in jobCardDetailsModel.value?.lstCmjcJobDetailList ?? []) {
          workTypeNames.add(workType.workType);
        }
        strWorkTypes.value = workTypeNames.join(', ');
        //remove extra comma at the end
        if (strWorkTypes.value.length > 0) {
          strWorkTypes.value = strWorkTypes.substring(
            0,
            strWorkTypes.value.length - 1,
          );
        }
        assignNames = <String>[];
        for (var assignName
            in jobCardDetailsModel.value?.lstCmjcJobDetailList ?? []) {
          assignNames.add(assignName.jobAssignedEmployeeName);
        }
        strAssignName.value = assignNames.join(', ');
        //remove extra comma at the end
        if (strAssignName.value.length > 0) {
          strAssignName.value = strAssignName.substring(
            0,
            strAssignName.value.length - 1,
          );
        }
        // Convert work area(s)/equipment(s) to comma separated list
        //   var workAreaNames = <String>[];
        // // for (var workArea in jobCardDetailsModel.value?.workingAreaList ?? []) {
        // //   workAreaNames.add(workArea.workingAreaName);
        // // }
        // strWorkAreasOrEquipments.value = workAreaNames.join(', ');
        // //remove extra comma at the end
        // if (strWorkAreasOrEquipments.value.length > 0) {
        //   strWorkAreasOrEquipments.value = strWorkAreasOrEquipments.substring(
        //     0,
        //     strWorkAreasOrEquipments.value.length - 1,
        //   );
        // }

        jobDetails.value = {
          "Job ID": jobCardDetailsModel.value?.jobId.toString(),
          "Job Title": jobCardDetailsModel.value?.title,
          "Job Description": jobCardDetailsModel.value?.description,
          "Job Assigned To": strAssignName.value, //jobCardDetailsModel.value?.,
          // "Work Area / Equipments": strWorkAreasOrEquipments.value,
          "Work Type": strWorkTypes.value,
          "Linked Tool To  Work Type": strToolsRequired.value,
          "Job Created By": jobCardDetailsModel.value?.created_by,
          "Job Status": jobCardDetailsModel.value?.status_short,
        };
      }
    } //
    catch (e) {
      print(e);
    }
  }

  void createPermitDetailsTableData() {
    try {
      if (jobCardList.isNotEmpty) {
        jobCardDetailsModel.value = jobCardList[0];

        permitList?.value =
            jobCardDetailsModel.value!.lstPermitDetailList ?? [];
        //  jobCardDetailsModel.value?.associatedPermitList ?? [];
//
        LstPermitDetailList? permit = permitList?[0];

        if (permit != null) {
          permitId = permit.permitId;
          // getPermitDetails();
        }

        permitDetails.value = {
          "Permit ID": permit?.permitId.toString(),
          "Site Permit No.": permit?.sitePermitNo.toString(),
          "Permit Type": permit?.permitType,
          "Permit Description": permit?.permitDescription,
          "Permit Issued By": permit?.permitIssuedByName ?? "",
          "Permit Status": permit?.status_short ?? ""
        };
        //var x = jobDetails.value;
      }
    } //
    catch (e) {
      print(e);
    }
  }

  void updateJobCard() async {
    // isolation asset categories
    try {
      var _isolatedAssetCatList = [];
      for (IsolationAssetsCategory isolationAssetsCategory
          in isolationAssetsCategoryList) {
        _isolatedAssetCatList.add({
          "isolation_id": isolationAssetsCategory.isolationAssetsCatId,
          "normalisedStatus": isolationAssetsCategory.isNormalized ?? 0,
        });
      }
      // lots assets
      var _lotoAssetList = [];
      for (LotoAsset lotoAsset in lotoAppliedAssets) {
        _lotoAssetList.add({
          "loto_id": lotoAsset.lotoId,
          "lotoRemovedStatus": lotoAsset.removedStatus,
        });
      }
      // selected employees
      var _employeeList = [];

      for (EmployeeModel employee in selectedEmployeeList ?? []) {
        int _index = selectedEmployeeList?.indexOf(employee) ?? 0;
        final _responsibility = getResponsibility(_index);
        _employeeList.add({
          "empId": employee.id,
          "employeeId": employee.id,
          "responsibility": _responsibility,
        });
      }
      var _comment = descriptionOfWorkDoneCtrlr.text.trim();
      // create jobcard object
      var jobCard = {
        "id": jobCardId.value,
        "comment": _comment,
        "status": 1,
        "is_isolation_required": true,
        "isolated_list": _isolatedAssetCatList,
        "loto_list": _lotoAssetList,
        "employee_list": _employeeList
      };

      Map<String, dynamic>? responseMapJobCardUpdated =
          await jobCardDetailsPresenter.updateJobCard(
        jobCard,
        true,
      );

      if (responseMapJobCardUpdated != null) {
        var _jobId = 0;
        var _message = '';
        if (responseMapJobCardUpdated["id"] != null &&
            responseMapJobCardUpdated["id"].isNotEmpty) {
          _jobId = responseMapJobCardUpdated["id"][0];
        }
        if (responseMapJobCardUpdated["message"] != null) {
          _message = responseMapJobCardUpdated["message"];
        }
        // showAlertDialog(
        //     jobId: _jobId, message: _message, dialog: JobCardUpdatedDialog());
      }
    } //
    catch (e) {
      print(e);
    }
  }

  void onDropdownValueChanged(dropdownList, selectedValue) {
    selectedEmployeeName.value = selectedValue;
  }

  startStopJobCard() {
    isJobCardStarted.value = !isJobCardStarted.value;
  }

  Future<void> createJobCard(int jobId) async {
    await startStopJobCard();

    ///
    if (isJobCardStarted.value == true) {
      Map<String, dynamic>? responseMapJobCardStarted =
          await jobCardDetailsPresenter.createJobCard(
        jobId: jobId,
        isLoading: true,
      );

      if (responseMapJobCardStarted != null &&
          responseMapJobCardStarted.length > 0) {
        final _jobCardId = responseMapJobCardStarted["id"][0];
        jobCardId.value = _jobCardId;
      }
    }

    /// Get History
    getHistory();
  }

  Future<void> startJobCard(int jcCard) async {
    await startStopJobCard();

    ///
    if (isJobCardStarted.value == true) {
      Map<String, dynamic>? responseMapJobCardStarted =
          await jobCardDetailsPresenter.startJobCard(
        jcCard: jcCard,
        isLoading: true,
      );

      if (responseMapJobCardStarted != null &&
          responseMapJobCardStarted.length > 0) {
        jobCardList.value = await jobCardDetailsPresenter.getJobCardDetails(
              jobCardId: jobCardId.value,
              isLoading: true,
            ) ??
            [];
        getHistory();
      }
    }

    /// Get History
    getHistory();
  }

  void toggleIsNormalizedSwitch(bool value, int index) {
    List<IsolationAssetsCategory> isolationList =
        List.from(isolationAssetsCategoryList);
    isolationList[index].isNormalized = (value == true) ? 1 : 0;

    isolationAssetsCategoryList.value = isolationList;
    update(["isolationAssetsCategoryList"]);
  }

  void checkForm() {
    if (selectedEmployeeName.value == '') {
      isEmployeeSelected.value = false;
    }
  }

  void getPermitDetails() async {
    final _permitDetails =
        await jobCardDetailsPresenter.getPermitDetails(permitId: permitId);

    isolationAssetsCategoryList.value = _permitDetails?.lstIsolation ?? [];
    lotoAppliedAssets.value = _permitDetails?.lstLoto ?? [];
  }

  void closeJob() async {
    int isolationId = 0;
    for (IsolationAssetsCategory isolationAssetsCategory
        in isolationAssetsCategoryList) {
      isolationId = isolationAssetsCategory.isolationAssetsCatId ?? 0;
    }
    // lots assets
    int lotoStatus = 0;
    int lotoId = 0;

    for (LotoAsset lotoAsset in lotoAppliedAssets) {
      lotoStatus = lotoAsset.removedStatus ?? 0;
      lotoId = lotoAsset.lotoId ?? 0;
    }
    int _employeeId = 0;

    for (EmployeeModel employee in selectedEmployeeList ?? []) {
      _employeeId = employee.id ?? 0;
    }
    var _comment = descriptionOfWorkDoneCtrlr.text.trim();

    var jobCard = {
      "id": jobCardId.value,
      "isolationId": isolationId,
      "lotoId": lotoId,
      "comment": _comment,
      "employee_id": _employeeId,
      "normalisedStatus": 1,
      "lotoStatus": lotoStatus,
    };
    Map<String, dynamic>? responseCarryForwardJCModel =
        await jobCardDetailsPresenter.closeJob(
      jobCard,
      true,
    );

    if (responseCarryForwardJCModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    // print('update  Create GO  data: $carryForwardJCModelJsonString');
  }

  void carryForwardJob() async {
    int isolationId = 0;
    for (IsolationAssetsCategory isolationAssetsCategory
        in isolationAssetsCategoryList) {
      isolationId = isolationAssetsCategory.isolationAssetsCatId ?? 0;
    }
    // lots assets
    int lotoStatus = 0;
    int lotoId = 0;

    for (LotoAsset lotoAsset in lotoAppliedAssets) {
      lotoStatus = lotoAsset.removedStatus ?? 0;
      lotoId = lotoAsset.lotoId ?? 0;
    }
    int _employeeId = 0;

    for (EmployeeModel employee in selectedEmployeeList ?? []) {
      _employeeId = employee.id ?? 0;
    }
    var _comment = descriptionOfWorkDoneCtrlr.text.trim();

    var jobCard = {
      "id": jobCardId.value,
      "isolationId": isolationId,
      "lotoId": lotoId,
      "comment": _comment,
      "employee_id": _employeeId,
      "normalisedStatus": 1,
      "lotoStatus": lotoStatus,
    };
    Map<String, dynamic>? responseCarryForwardJCModel =
        await jobCardDetailsPresenter.carryForwardJob(
      jobCard,
      true,
    );

    if (responseCarryForwardJCModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }
    // print('update  Create GO  data: $carryForwardJCModelJsonString');
  }

  // void approveJobCard() async {
  //   final response = await jobCardDetailsPresenter.approveJobCard(
  //     jobCardId: jobCardId.value,
  //     comment: comment,
  //     isLoading: true,
  //   );
  // }

  // // void rejectJobCard() async {
  // //   try {
  // //     var comment = "comment"; //descriptionOfWorkDoneCtrlr.text.trim();
  // //     Map<String, dynamic>? response =
  // //         await jobCardDetailsPresenter.rejectJobCard(
  // //       id: jobCardId.value,
  // //       comment: comment,
  // //       isLoading: false,
  // //     );
  // //   } //
  // //   catch (e) {
  // //     Utility.showDialog(e.toString() + ' rejectJobCard');
  // //   }
  // // }
  void approveJobCards() async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: jobCardId.value, comment: _comment);

      var approveJsonString = commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      final response = await jobCardDetailsPresenter.approveJobCards(
        approveJsonString: approveJsonString,
        isLoading: true,
      );
      if (response == true) {
        try {
          Get.put(FileUploadController());

          final _flutterSecureStorage = const FlutterSecureStorage();

          // await _flutterSecureStorage.delete(key: "JcId");

          //   await controller.setJcId();

          jobCardList.value = await jobCardDetailsPresenter.getJobCardDetails(
                jobCardId: jobCardId.value,
                isLoading: true,
              ) ??
              [];
          getHistory();
          createPlantDetailsTableData();

          createJobDetailsTableData();
          createPermitDetailsTableData();
          //  createJcDetailsTableData();
          getEmployeeList();
          //  getPermitDetails();

          responsibilityCtrlrs.add(TextEditingController());
          currentIndex.value = -1;
        } catch (e) {
          print(e);
        }
        //
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void rejectJobCard() async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: jobCardId.value, comment: _comment);

      var rejectJsonString = commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      final response = await jobCardDetailsPresenter.rejectJobCard(
        rejectJsonString: rejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void approvecloseJob() async {
    {
      String _comment = approveCommentTextFieldCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: jobCardId.value, comment: _comment);

      var approveJsonString = commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      final response = await jobCardDetailsPresenter.approvecloseJob(
        approveJsonString: approveJsonString,
        isLoading: true,
      );
      if (response == true) {
        try {
          Get.put(FileUploadController());

          // final _flutterSecureStorage = const FlutterSecureStorage();

          // await _flutterSecureStorage.delete(key: "JcId");

          //   await controller.setJcId();

          jobCardList.value = await jobCardDetailsPresenter.getJobCardDetails(
                jobCardId: jobCardId.value,
                isLoading: true,
              ) ??
              [];
          getHistory();
          createPlantDetailsTableData();

          createJobDetailsTableData();
          createPermitDetailsTableData();
          //  createJcDetailsTableData();
          getEmployeeList();
          //  getPermitDetails();

          responsibilityCtrlrs.add(TextEditingController());
          currentIndex.value = -1;
        } catch (e) {
          print(e);
        }
        //
        //getCalibrationList(facilityId, true);
      }
    }
  }

  void rejectcloseJob() async {
    {
      String _comment = rejectCommentTextFieldCtrlr.text.trim();

      CommentModel commentCalibrationModel =
          CommentModel(id: jobCardId.value, comment: _comment);

      var rejectJsonString = commentCalibrationModel.toJson();
      // print({"rejectCalibrationJsonString", approveCalibrationtoJsonString});
      final response = await jobCardDetailsPresenter.rejectcloseJob(
        rejectJsonString: rejectJsonString,
        isLoading: true,
      );
      if (response == true) {
        //getCalibrationList(facilityId, true);
      }
    }
  }

  String? getResponsibility(index) {
    //return null;

    final responsibitlity = responsibilityCtrlrs[index].text;
    return responsibitlity;
  }

  goToJobCardListScreen() {
    Get.back();
    final _flutterSecureStorage = const FlutterSecureStorage();
    _flutterSecureStorage.delete(key: "jobId");
    Get.offAllNamed(Routes.jobList);
  }

  void goToJobCardScreen() {
    Get.back();

    //  Get.toNamed(Routes.jobCard, arguments: {'jobId': jobId.value});
  }

  goToAddJobScreen() {
    Get.back();
    Get.offAllNamed(Routes.jobDetails);
  }

  void addNewEmployee(EmployeeModel selectedEmployee, String responsibility) {
    ///
    // Create a new index for this row based on the current number of rows
    final uniqueKey = UniqueKey();
    // Create a new DataRow2 with the selected employee and responsibility
    final newRow = DataRow2(
      key: uniqueKey,
      cells: [
        DataCell(Text('${selectedEmployeeName}')),
        DataCell(
          Tooltip(
            message: responsibility,
            child: Container(
              width: double.infinity,
              child: Text(
                responsibility,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        if (kIsWeb)
          DataCell(
            ElevatedButton(onPressed: () {}, child: Text('View Competencies')),
          ),
        DataCell(
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteEmployee(uniqueKey); // Delete based on the index
              }),
        ),
      ],
    );

    // Add the new row to the list of rows
    employeeTableRows.add(newRow);

    // Add the selected employee to the list of selected employees
    selectedEmployeeList?.add(selectedEmployee);

    responsibilityCtrlr.clear();
    selectedEmployeeName.value = '';
  }

  void deleteEmployee(Key key) {
    // Find the index of the row with this key
    final index = employeeTableRows.indexWhere((row) => row.key == key);
    if (index != -1) {
      // If found, remove the row from the table
      employeeTableRows.removeAt(index);
    }
  }

  /// Show alert dialog
  void showAlertDialog({
    int? jobId,
    String? message,
    String? title,
    Function()? onPress,
    Widget? dialog,
  }) async {
    await Get.dialog<void>(dialog ?? SizedBox());
  }

  ///
}

// class DataRow2 {
//   final List<DataCell> cells;
//   final int index;

//   DataRow2({required this.cells, this.index = -1});
// }
