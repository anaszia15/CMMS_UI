import 'package:cmms/domain/repositories/repository.dart';

import '../models/employe_stock_model.dart';
import '../repositories/local_storage_keys.dart';

class CreateMrsReturnUsecase {
  CreateMrsReturnUsecase(this.repository);
  Repository repository;
  Future<EmployeeStockListModel?> getCmmsItemList(
          {int? facilityId, bool? isLoading, int? userId}) async =>
      await repository.getCmmsItemList(
        facilityId,
        isLoading,
        userId,
      );
  Future<Map<String, dynamic>> createReturnMrs({
    createReturnMrsJsonString,
    bool? isLoading,
  }) async =>
      await repository.createReturnMrs(
        createReturnMrsJsonString,
        isLoading,
      );
  void saveValue({String? whereUsedTypeId}) async =>
      repository.saveValue(LocalKeys.pmTaskId, whereUsedTypeId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.pmTaskId);
  void saveactivityValue({String? activity}) async =>
      repository.saveValue(LocalKeys.activity, activity);
  Future<String?> getactivityValue() async =>
      await repository.getStringValue(LocalKeys.activity);
}
