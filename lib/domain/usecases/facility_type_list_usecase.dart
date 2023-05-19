import 'package:cmms/domain/models/facility_type_list_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

// class AssetTypeListUsecase {
//   AssetTypeListUsecase(this.repository);
//   Repository repository;

//   ///

//   Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
//       await repository.getFacilityList(isLoading);

//   Future<List<JobModel?>?> getJobList({
//     required String auth,
//     int? facilityId,
//     bool? isLoading,
//   }) async =>
//       await repository.getJobList(
//         auth,
//         facilityId,
//         isLoading,
//       );
// }

class FacilityTypeListUsecase {
  FacilityTypeListUsecase(this.repository);
  Repository repository;

  Future<List<FacilityTypeListModel>> getFacilityTypeList(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getFacilityTypeList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
