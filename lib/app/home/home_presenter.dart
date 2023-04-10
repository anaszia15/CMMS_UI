import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';

import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class HomePresenter {
  HomePresenter(this.homeUsecase);
  HomeUsecase homeUsecase;

  Future<void> generateToken() async {
    return await homeUsecase.generateToken();
  }

  Future<List<InventoryModel>> getInventoryList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return homeUsecase.getInventoryList(
      isLoading: isLoading,
      facilityId: facilityId,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

   Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int? businessType,
    int? blockId,
    required String categoryIds,
  }) async {
    return homeUsecase.getBusinessList(
      isLoading: isLoading,
      businessType: 5,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

   Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await homeUsecase.getInventoryCategoryList(
      );

  Future<List<WarrantyClaimModel>>getWarrantyClaimList({
    required bool isLoading,
    required int? facilityId,
    int? blockId,
    required String categoryIds,
  }) async {
    return homeUsecase.getWarrantyClaimList(
      isLoading: isLoading,
      facilityId: 45,
      blockId: blockId,
      categoryIds: categoryIds,
    );
  }

  Future<List<BlockModel>> getBlockList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return homeUsecase.getBlockList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<EquipmentModel>> getEquipmentList({
    required bool isLoading,
    required String facilityId,
  }) async {
    return homeUsecase.getEquipmentList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await homeUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await homeUsecase.getUserAccessList();

  ///
}
