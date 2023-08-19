import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_return_mrs_list.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';

import '../../domain/usecases/purchase_goods_order_view_usecase.dart';
import '../../domain/usecases/return_mrs_usecase.dart';

class PurchaseGoodsorderViewPresenter {
  PurchaseGoodsorderViewPresenter(this.purchaseGoodsorderViewUsecase);
  PurchaseGoodsorderViewUsecase purchaseGoodsorderViewUsecase;
  Future<GetRODetailsByIDModel?> getRoDetailsByID({
    bool? isLoading,
    required int requestID,
  }) async {
    return purchaseGoodsorderViewUsecase.getRoDetailsByID(
      requestID: requestID,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await purchaseGoodsorderViewUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
