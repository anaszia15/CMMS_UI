import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';

class PermitTypeUsecase {
  PermitTypeUsecase(this.repository);
  Repository repository;

  Future<List<TypePermitModel?>?> getTypePermitList(bool? isLoading) async =>
      await repository.getTypePermitList(isLoading);

  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   String? auth,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await repository.getInventoryCategoryList(
  //       auth,
  //       facilityId,
  //       isLoading,
  //     );
  // Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
  //   int? type,
  //   int? facilityId,
  //   bool? isLoading,
  // }) async =>
  //     await repository.getPreventiveCheckList(
  //       type,
  //       facilityId,
  //       isLoading,
  //     );
  // Future<List<FrequencyModel?>?> getFrequencyList({
  //   bool? isLoading,
  // }) async =>
  //     await repository.getFrequencyList(
  //       isLoading,
  //     );
  // Future<bool> createChecklistNumber({
  //   checklistJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await repository.createCheckListNumber(isLoading: isLoading,checklistJsonString:checklistJsonString);
      
}
