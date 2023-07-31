import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ApproveReturnMrsUsecase {
  ApproveReturnMrsUsecase(this.repository);
  Repository repository;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getMrsDetails(
        mrsId,
        isLoading,
      );
  Future<bool> approveMrs({
    approvetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.approveMrs(
          approvetoJsonString: approvetoJsonString, isLoading: isLoading);
  Future<bool> rejectMrs({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectMrs(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);
}
