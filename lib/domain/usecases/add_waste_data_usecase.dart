import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AddWasteDataUsecase {
  Repository repository;

  AddWasteDataUsecase(this.repository);
  // Future<List<AuditPlanListModel>?> getAuditPlanList(
  //         {int? facilityId,
  //         bool? isLoading,
  //         dynamic endDate,
  //         dynamic startDate}) async =>
  //     await repository.getAuditPlanList(
  //         facilityId, isLoading, startDate, endDte);
  void saveValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.type);
  void clearValue() async => repository.clearData(LocalKeys.type);
  void clearStoreIdData() async => repository.clearData(LocalKeys.type);
}
