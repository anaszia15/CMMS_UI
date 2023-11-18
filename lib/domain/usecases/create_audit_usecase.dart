import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateAuditUsecase {
  CreateAuditUsecase(this.repository);
  Repository repository;
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPreventiveCheckList(
        type: type,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<bool> createAuditNumber({
    checkAuditJsonString,
    bool? isLoading,
  }) async =>
      await repository.createAuditNumber(
          isLoading: isLoading, checkAuditJsonString: checkAuditJsonString);
  void saveValue({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.type);
}
