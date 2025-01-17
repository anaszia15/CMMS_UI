import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/request_goods_orders_list.dart/request_goods_orders_list_presenter.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/domain/models/request_order_list.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class PurchaseGoodsorderListController extends GetxController {
  PurchaseGoodsorderListController(
    this.purchaseGoodsorderListPresenter,
  );
  PurchaseGoodsorderListPresenter purchaseGoodsorderListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<GetRequestOrderListModel> goodsOrdersList =
      <GetRequestOrderListModel>[].obs;
  RxList<GetRequestOrderListModel> filteredData =
      <GetRequestOrderListModel>[].obs;
  Rx<int> GoodsOrderId = 0.obs;
  RxString orderIdFilterText = ''.obs;
  RxString generatedByFilterText = ''.obs;

  RxString orderDateFilterText = ''.obs;
  RxString statusFilterText = ''.obs;
  RxString goDateFilterText = ''.obs;
  RxString costFilterText = ''.obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 7)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Order ID": true,
    "Generated By": true,
    "Order Date": true,
    "Status": true,
    "Cost": true,

    // "search": true,
  });
  final Map<String, double> columnwidth = {
    "Order ID": 153,
    "Generated By": 320,
    "Order Date": 220,
    "Status": 200,
    "Cost": 250
  };
  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  String get formattedFromdate =>
      DateFormat('dd/MM/yyyy').format(fromDate.value);
  String get formattedTodate => DateFormat('dd/MM/yyyy').format(toDate.value);
  String get formattedTodate1 => DateFormat('yyyy-MM-dd').format(toDate.value);
  String get formattedFromdate1 =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);

  GetRequestOrderListModel? goodsOrdersListModel;
  RxList<String> goodsOrdersListTableColumns = <String>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;

  @override
  void onInit() async {
    this.filterText = {
      "Order ID": orderIdFilterText,
      "Generated By": generatedByFilterText,
      "Order Date": orderDateFilterText,
      "Cost": costFilterText,
      "Status": statusFilterText,
    };
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () async {
        await getRequestOrderList(
          facilityId,
          formattedTodate1,
          formattedFromdate1,
          false,
        );
      });
    });
    super.onInit();
  }

  Future<void> getRequestOrderList(int facilityId, dynamic startDate,
      dynamic endDate, bool isLoading) async {
    goodsOrdersList.value = <GetRequestOrderListModel>[];
    filteredData.value = <GetRequestOrderListModel>[];

    final _goodsordersList =
        await purchaseGoodsorderListPresenter.getRequestOrderList(
      isLoading: true,
      start_date: startDate,
      end_date: endDate,
      facility_id: facilityId,
    );
    goodsOrdersList.value = _goodsordersList;
    paginationController = PaginationController(
      rowCount: goodsOrdersList.length ?? 0,
      rowsPerPage: 10,
    );

    if (goodsOrdersList.isNotEmpty) {
      filteredData.value = goodsOrdersList.value;

      goodsOrdersListModel = goodsOrdersList[0];
      var newPermitListJson = goodsOrdersListModel?.toJson();
      goodsOrdersListTableColumns.value = <String>[];
      for (var key in newPermitListJson?.keys.toList() ?? []) {
        goodsOrdersListTableColumns.add(key);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {}
  }

  void getPmTaskListByDate() {
    getRequestOrderList(
        facilityId, formattedFromdate1, formattedTodate1, false);
  }

  void search(String keyword) {
    print('Keyword: $keyword');
    if (keyword.isEmpty) {
      goodsOrdersList.value = filteredData.value;
      return;
    }
    List<GetRequestOrderListModel> filteredList = filteredData
        .where((item) =>
            (item.name
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.generatedBy
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.generatedAt
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.status
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false) ||
            (item.cost
                    ?.toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ??
                false))
        .toList();
    goodsOrdersList.value = filteredList;
  }

  void isDeleteDialog({String? id, String? generatedBy}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              text: 'Are you sure you want to delete the SPV ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: generatedBy,
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  deleteGoodsOrders(id).then((value) {
                    Get.back();
                    getRequestOrderList(
                      facilityId,
                      formattedTodate,
                      formattedFromdate,
                      false,
                    );
                  });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deleteGoodsOrders(String? id) async {
    await purchaseGoodsorderListPresenter.deleteFacility(
      id,
      isLoading: true,
    );
  }

  void clearStoreData() {
    purchaseGoodsorderListPresenter.clearValue();
  }

  void clearTypeStoreData() {
    purchaseGoodsorderListPresenter.clearTypeValue();
  }
}
