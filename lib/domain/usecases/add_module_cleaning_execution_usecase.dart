import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';

import '../models/facility_model.dart';

class AddModuleCleaningExecutionUsecase {
  final Repository _repository;

  AddModuleCleaningExecutionUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

   
  Future<void> startMCExecutionButton({
   
    int? planId,
    bool? isLoading,
  }) async {
    await _repository.startMCExecutionButton(
      planId,
      isLoading,
    );
  }

   Future<Map<String, dynamic>> abandonAllExecutionButton({
    abandoneJsonString,
    bool? isLoading,
  }) async =>
      await _repository.abandonExecutionButton(
        abandoneJsonString,
        isLoading,
      );


  Future<void> startMCExecutionScheduleButton({
   
    int? scheduleId,
    bool? isLoading,
  }) async {
    await _repository.startMCExecutionScheduleButton(
      scheduleId,
      isLoading,
    );
  }

   Future<Map<String, dynamic>> endMCExecutionButton({
    endJsonString,
    bool? isLoading,
  }) async =>
      await _repository.endMCExecutionButton(
        endJsonString,
        isLoading,
      );

   Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
    
  }) async {
    return _repository.getEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
      
    );
  }

  Future<Map<String, dynamic>> abandonScheduleExecutionButton({
    abandoneJsonString,
    bool? isLoading,
  }) async =>
      await _repository.abandonScheduleExecutionButton(
        abandoneJsonString,
        isLoading,
      );
   Future<List<TypePermitModel?>?> getTypePermitList(
    bool? isLoading,
    int? facility_id
    ) async =>
      await _repository.getTypePermitList(
        isLoading,
        facility_id
        );

   Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );

   Future<Map<String, dynamic>> updateMCExecution({
    updateMCExecution,
    bool? isLoading,
  }) async =>
      await _repository.updateMCExecution(
        updateMCExecution,
        isLoading,
      );

  Future<EndMCExecutionDetailsModel?> getMCExecutionDetail({
    bool? isLoading,  
    required int executionId,
  }) async =>
      await _repository.getMCExecutionDetail(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );


  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);

   Future<List<FacilityModel?>?> getFacilityPlantList() async =>
      await _repository.getFacilityList(true);

  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
}
