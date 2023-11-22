import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class StatutoryUsecase {
  StatutoryUsecase(this.repository);
  Repository repository;

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
}
