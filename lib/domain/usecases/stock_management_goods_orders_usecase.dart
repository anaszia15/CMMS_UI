import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/stock_management_update_goods_orders_model.dart';
import 'package:cmms/domain/models/user_list_model.dart';

class StockManagementGoodsOrdersUsecase {
  Repository repository;

  StockManagementGoodsOrdersUsecase(this.repository);

  Future<List<UserListModel?>?> getUserList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getUserList(
        facilityId,
        isLoading,
      );
  deleteGoodsOrders({required Object id, required bool isLoading}) async =>
      await repository.deleteGoodsOrders(
        id,
        isLoading,
      );
  Future<List<GoodsOrdersListModel>> getGoodsOrdersList({
    required bool isLoading,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getGoodsOrdersList(
      isLoading: isLoading,
      facility_id: facility_id,
      start_date: start_date,
      end_date: end_date,
    );
  }

  void clearValue() async => repository.clearData(LocalKeys.goId);
  void clearTypeValue() async => repository.clearData(LocalKeys.goType);
}
