import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/get_mc_task_equipment_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/add_module_cleaning_execution_usecase.dart';

import '../../domain/models/facility_model.dart';

class AddModuleCleaningExecutionPresenter {
  AddModuleCleaningExecutionPresenter(this.addModuleCleaningExecutionUsecase);
  AddModuleCleaningExecutionUsecase addModuleCleaningExecutionUsecase;

  Future<void> startMCExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.startMCExecutionButton(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );

  Future<void> endMcExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.endMcExecutionButton(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>?> abandonAllExecutionButton({
    abandoneJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.abandonAllExecutionButton(
      abandoneJsonString: abandoneJsonString,
      isLoading: isLoading,
    );
  }

  Future<void> startMCExecutionScheduleButton({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.startMCExecutionScheduleButton(
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );

  Future<void> endMCScheduleExecutionButton({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.endMCScheduleExecutionButton(
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );

  Future<List<TypePermitModel?>?> getTypePermitList(
          {required int facility_id}) async =>
      await addModuleCleaningExecutionUsecase.getTypePermitList(
          true, facility_id);

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await addModuleCleaningExecutionUsecase.getInventoryCategoryList();

  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,
    required int executionId,
  }) async {
    return addModuleCleaningExecutionUsecase.getMCExecutionDetail(
      executionId: executionId,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> endMCExecutionButton({
    endJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.endMCExecutionButton(
      endJsonString: endJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<GetMCTaskEquipmentList>> getMCTaskEquipmentList({
    required bool isLoading,
    required int? taskId,
  }) async {
    return addModuleCleaningExecutionUsecase.getMCTaskEquipmentList(
      isLoading: isLoading,
      taskId: taskId,
    );
  }

  Future<Map<String, dynamic>?> abandonScheduleExecutionButton({
    abandoneScheduleJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.abandonScheduleExecutionButton(
      abandoneScheduleJsonString: abandoneScheduleJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateMCScheduleExecution({
    updateMCScheduleExecutionJsonString,
    required bool isLoading,
  }) async {
    return addModuleCleaningExecutionUsecase.updateMCScheduleExecution(
      updateMCScheduleExecutionJsonString: updateMCScheduleExecutionJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await addModuleCleaningExecutionUsecase.getFacilityList();

  ///
}
