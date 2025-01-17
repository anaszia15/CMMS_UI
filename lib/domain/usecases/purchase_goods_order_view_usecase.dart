import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';

class PurchaseGoodsorderViewUsecase {
  final Repository _repository;

  PurchaseGoodsorderViewUsecase(this._repository);
  Future<GetRODetailsByIDModel?> getRoDetailsByID({
    bool? isLoading,
    required int requestID,
  }) async =>
      await _repository.getRoDetailsByID(
        requestID: requestID,
        isLoading: isLoading ?? false,
      );
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
  Future<Map<String, dynamic>> approveGoodsOrder({
    goodsOrderApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.approveGoodsOrder(
        goodsOrderApproveJsonString,
        isLoading,
      );
  // Future<bool> approveGoodsOrder({
  //   approvetoJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.approveGoodsOrder(
  //         approvetoJsonString: approvetoJsonString, isLoading: isLoading);

  // Future<bool> rejectGoodsOrder({
  //   rejecttoJsonString,
  //   bool? isLoading,
  // }) async =>
  //     await _repository.rejectGoodsOrder(
  //         rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);

  Future<Map<String, dynamic>> rejectGoodsOrder({
    goodsOrderRejectJsonString,
    bool? isLoading,
  }) async =>
      await _repository.rejectGoodsOrder(
        goodsOrderRejectJsonString,
        isLoading,
      );
  Future<List<HistoryModel>?> getRoHistory({
    moduleType,
    id,
    bool? isLoading,
  }) async =>
      await _repository.getRoHistory(
        moduleType,
        id,
        isLoading,
      );
  void saveValue({String? roId}) async =>
      _repository.saveValue(LocalKeys.roId, roId);
  Future<String?> getValue() async =>
      await _repository.getStringValue(LocalKeys.roId);
}
