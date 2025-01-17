import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/employe_stock_model.dart';

class EditMrsReturnUsecase {
  EditMrsReturnUsecase(this.repository);
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
  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getReturnMrsDetails(
        mrsId,
        isLoading,
      );
}
