import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/job_card_details_model.dart';
import '../models/permit_details_model.dart';

class JobCardDetailsUsecase {
  JobCardDetailsUsecase(this.repository);
  Repository repository;

  ///
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToList(
        auth,
        facilityId,
        isLoading,
      );

  ///
  Future<Map<String, dynamic>?> createJobCard({
    String? auth,
    int? jobId,
    bool? isLoading,
  }) async =>
      await repository.createJobCard(
        auth,
        jobId,
        isLoading,
      );
  Future<Map<String, dynamic>?> startJobCard({
    String? auth,
    int? jcCard,
    bool? isLoading,
  }) async =>
      await repository.startJobCard(
        auth,
        jcCard,
        isLoading,
      );

  ///
  Future<List<JobCardDetailsModel?>?> getJobCardDetails({
    int? jobCardId,
    bool? isLoading,
  }) async =>
      await repository.getJobCardDetails(
        jobCardId,
        isLoading,
      );

  ///
  Future<PermitDetailsModel?> getPermitDetails({
    int? permitId,
    bool? isLoading,
  }) async =>
      await repository.getPermitDetails(
        permitId,
        isLoading,
      );

  ///
  Future<Map<String, dynamic>?> updateJobCard({
    jobCard,
    bool? isLoading,
  }) async =>
      await repository.updateJobCard(
        jobCard,
        isLoading,
      );
  Future<Map<String, dynamic>?> carryForwardJob({
    jobCard,
    bool? isLoading,
  }) async =>
      await repository.carryForwardJob(
        jobCard,
        isLoading,
      );
  Future<Map<String, dynamic>?> closeJob({
    jobCard,
    bool? isLoading,
  }) async =>
      await repository.closeJob(
        jobCard,
        isLoading,
      );

  ///
  Future<List<HistoryModel>?> getJobCardHistory({
    moduleType,
    jobCardId,
    bool? isLoading,
  }) async =>
      await repository.getJobCardHistory(
        moduleType,
        jobCardId,
        isLoading,
      );

  Future<bool> approveJobCards({
    approveJsonString,
    bool? isLoading,
  }) async =>
      await repository.approveJobCards(
          approveJsonString: approveJsonString, isLoading: isLoading);

  ///
  Future<bool> rejectJobCard({
    rejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectJobCard(
          rejectJsonString: rejectJsonString, isLoading: isLoading);
  Future<bool> approvecloseJob({
    approveJsonString,
    bool? isLoading,
  }) async =>
      await repository.approvecloseJob(
          approveJsonString: approveJsonString, isLoading: isLoading);

  ///
  Future<bool> rejectcloseJob({
    rejectJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectcloseJob(
          rejectJsonString: rejectJsonString, isLoading: isLoading);

  void saveValue({String? jobCardId}) async =>
      repository.saveValue(LocalKeys.jobCardId, jobCardId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.jobCardId);
}
