import 'package:cmms/domain/domain.dart';

import '../models/facility_model.dart';

class IncidentReportUsecase {
  final Repository _repository;

  IncidentReportUsecase(this._repository);

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
}