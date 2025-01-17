import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/stock_management_add_goods_orders_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';

import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';

class AddGoodsOrdersWeb extends StatefulWidget {
  AddGoodsOrdersWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AddGoodsOrdersWeb> createState() => _AddGoodsOrdersWebState();
}

class _AddGoodsOrdersWebState extends State<AddGoodsOrdersWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockManagementAddGoodsOrdersController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return
            // Obx(
            //   () =>
            Scaffold(
                body: Container(
                  color: Color.fromARGB(255, 234, 236, 238),
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    children: [
                      HeaderWidget(),
                      AppBarGoodsOrder(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Stack(
                            children: [
                              Container(
                                color: Color.fromARGB(255, 245, 248, 250),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Add  Goods Order Details",
                                            style: Styles.blackBold16,
                                          ),
                                          Spacer(),

                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2, horizontal: 5),
                                              margin: EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                color: controller
                                                            .getPurchaseDetailsByIDModel
                                                            .value
                                                            ?.status ==
                                                        302
                                                    ? ColorValues.createsColor
                                                    : controller
                                                                .getPurchaseDetailsByIDModel
                                                                .value
                                                                ?.status ==
                                                            301
                                                        ? ColorValues.draftColor
                                                        : controller
                                                                    .getPurchaseDetailsByIDModel
                                                                    .value
                                                                    ?.status ==
                                                                305
                                                            ? Color.fromARGB(
                                                                255, 181, 129, 179)
                                                            : controller
                                                                        .getPurchaseDetailsByIDModel
                                                                        .value
                                                                        ?.status ==
                                                                    309
                                                                ? Color.fromARGB(
                                                                    255,
                                                                    181,
                                                                    129,
                                                                    179)
                                                                : controller
                                                                            .getPurchaseDetailsByIDModel
                                                                            .value
                                                                            ?.status ==
                                                                        306
                                                                    ? ColorValues
                                                                        .approveColor
                                                                    : controller.getPurchaseDetailsByIDModel.value?.status ==
                                                                            304
                                                                        ? ColorValues.appPurpleColor
                                                                        : ColorValues.lightBlueColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  " ${controller.getPurchaseDetailsByIDModel.value?.status_short ?? ""}",
                                                ),
                                              )),
                                          controller.goId == null
                                              ? Container()
                                              : Obx(
                                                  () => Text(
                                                    " Order ID :${controller.getPurchaseDetailsByIDModel.value?.id ?? ""} ",
                                                    style: Styles.blackBold16,
                                                  ),
                                                )

                                          // ActionButton(
                                          //   icon: Icons.menu,
                                          //   label: "User List",
                                          //   onPressed: () {
                                          //     Get.offNamed(Routes.userList);
                                          //   },
                                          //   color: ColorValues.greenlightColor,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: ColorValues.greyLightColour,
                                    ),
                                    Container(
                                      margin: Dimens.edgeInsets20,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Vendor: '),
                                                  Dimens.boxWidth10,
                                                  SizedBox(
                                                    child: Obx(
                                                      () => DropdownWebStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        dropdownList: controller
                                                            .ownerList,
                                                        isValueSelected: controller
                                                            .isSelectedBusinessType
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedBusinessType
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Delivery Challan: '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController: controller
                                                        .challanNoCtrlr,
                                                    focusnode:
                                                        controller.delchfocus,
                                                    scroll:
                                                        controller.delchscroll,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'P.O No: '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.pOCtrlr,
                                                    focusnode:
                                                        controller.ponofocus,
                                                    scroll:
                                                        controller.ponoscroll,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Frieght:To Pay /Paid : '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController: controller
                                                        .frieghtToPayPaidCtrlr,
                                                    focusnode:
                                                        controller.freightfocus,
                                                    scroll: controller
                                                        .freightscroll,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Materials Received Against PO:'),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    textController: controller
                                                        .noOfPackagesReceivedCtrlr,
                                                    focusnode:
                                                        controller.matpofocus,
                                                    scroll:
                                                        controller.matposcroll,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Condition of Packages Received : '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController: controller
                                                        .conditionOfPackagesReceivedCtrlr,
                                                    focusnode:
                                                        controller.pacrfocus,
                                                    scroll:
                                                        controller.pacrscroll,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Gate Inward Register No. : '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.girNoCtrlr,
                                                    focusnode:
                                                        controller.inregfocus,
                                                    scroll:
                                                        controller.inregscroll,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Amount : '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.amountCtrlr,
                                                    focusnode:
                                                        controller.amntfocus,
                                                    scroll:
                                                        controller.amntscroll,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Purchase Date :'),
                                                  Dimens.boxWidth10,
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openPurchaseDatePicker =
                                                          !controller
                                                              .openPurchaseDatePicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController: controller
                                                        .purchaseDateTc,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Challan Date : '),
                                                  Dimens.boxWidth10,
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openChallanDatePicker =
                                                          !controller
                                                              .openChallanDatePicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController: controller
                                                        .challanDateTc,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'PO Date  : '),
                                                  Dimens.boxWidth10,
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openPODatePicker =
                                                          !controller
                                                              .openPODatePicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController:
                                                        controller.poDateDateTc,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Received Date  : '),
                                                  Dimens.boxWidth10,
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openReceivedPicker =
                                                          !controller
                                                              .openReceivedPicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController: controller
                                                        .receivedDateTc,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'L.R No.  : '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.lrNoCtrlr,
                                                    focusnode:
                                                        controller.lrfocus,
                                                    scroll: controller.lrscroll,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Vehicle  No. : '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController: controller
                                                        .vehicleNoCtrlr,
                                                    focusnode:
                                                        controller.vehfocus,
                                                    scroll:
                                                        controller.vehscroll,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Job Ref. : '),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.jobRefCtrlr,
                                                    focusnode:
                                                        controller.jobrfocus,
                                                    scroll:
                                                        controller.jobrscroll,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  Dimens.boxWidth10,
                                                  CustomRichText(
                                                      title: 'Currency: '),
                                                  Dimens.boxWidth10,
                                                  SizedBox(
                                                    child: DropdownWebStock(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      dropdownList: controller
                                                          .unitCurrencyList,
                                                      isValueSelected: controller
                                                          .isUnitCurrencySelected
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedUnitCurrency
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth30,
                                        ],
                                      ),
                                    ),
                                    AddRowInGoodsOrder(),
                                    Dimens.boxHeight15,
                                    controller.historyList!.isEmpty
                                        ? Dimens.box0
                                        : Container(
                                            margin: Dimens.edgeInsets20,
                                            height: ((controller.historyList
                                                            ?.length ??
                                                        0) *
                                                    50) +
                                                125,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorValues
                                                    .lightGreyColorWithOpacity35,
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: ColorValues
                                                      .appBlueBackgroundColor,
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Goods Order History ",
                                                        style: Styles.blue700,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: ColorValues
                                                      .greyLightColour,
                                                ),
                                                Expanded(
                                                  child: DataTable2(
                                                    border: TableBorder.all(
                                                        color: Color.fromARGB(
                                                            255,
                                                            206,
                                                            229,
                                                            234)),
                                                    columns: [
                                                      DataColumn(
                                                          label: Text(
                                                        "Time Stamp",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn(
                                                          label: Text(
                                                        "Posted By",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn(
                                                          label: Text(
                                                        "Comment",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn(
                                                          label: Text(
                                                        "Location",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn(
                                                          label: Text(
                                                        "Status",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                    ],
                                                    rows:
                                                        List<DataRow>.generate(
                                                      controller.historyList
                                                              ?.length ??
                                                          0,
                                                      (index) =>
                                                          DataRow(cells: [
                                                        DataCell(Text(controller
                                                                .historyList?[
                                                                    index]
                                                                ?.createdAt
                                                                .toString() ??
                                                            '')),
                                                        DataCell(Text(controller
                                                                .historyList?[
                                                                    index]
                                                                ?.createdByName
                                                                .toString() ??
                                                            '')),
                                                        DataCell(Text(controller
                                                                .historyList?[
                                                                    index]
                                                                ?.comment
                                                                .toString() ??
                                                            '')),
                                                        DataCell(Text('--')),
                                                        DataCell(Text(controller
                                                                .historyList?[
                                                                    index]
                                                                ?.status_name
                                                                .toString() ??
                                                            '')),
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              if (controller.openPurchaseDatePicker)
                                Positioned(
                                  right: 65,
                                  top: 130,
                                  child: DatePickerWidget(
                                    minDate: DateTime(DateTime.now().year),
                                    maxDate: DateTime(DateTime.now().year, 13,
                                        0), // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.purchaseDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
                                      controller.openPurchaseDatePicker =
                                          !controller.openPurchaseDatePicker;
                                      controller.update(['stock_Mangement']);
                                    },
                                  ),
                                ),
                              if (controller.openChallanDatePicker)
                                Positioned(
                                  right: 65,
                                  top: 170,
                                  child: DatePickerWidget(
                                    minDate: DateTime(DateTime.now().year),
                                    maxDate: DateTime(DateTime.now().year, 13,
                                        0), // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.challanDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
                                      controller.openChallanDatePicker =
                                          !controller.openChallanDatePicker;
                                      controller.update(['stock_Mangement']);
                                    },
                                  ),
                                ),
                              if (controller.openPODatePicker)
                                Positioned(
                                  right: 65,
                                  top: 200,
                                  child: DatePickerWidget(
                                    minDate: DateTime(DateTime.now().year),
                                    maxDate: DateTime(DateTime.now().year, 13,
                                        0), // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.poDateDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
                                      controller.openPODatePicker =
                                          !controller.openPODatePicker;
                                      controller.update(['stock_Mangement']);
                                    },
                                  ),
                                ),
                              if (controller.openReceivedPicker)
                                Positioned(
                                  right: 65,
                                  top: 230,
                                  child: DatePickerWidget(
                                    // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.receivedDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
                                      controller.openReceivedPicker =
                                          !controller.openReceivedPicker;
                                      controller.update(['stock_Mangement']);
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                floatingActionButton: Obx(() => varUserAccessModel
                            .value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kGoodsFeatureId &&
                                e.add == UserAccessConstants.kHaveAddAccess)
                            .length >
                        0
                    ? Row(
                        children: [
                          Spacer(),
                          Container(
                            height: 40,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.cancelColor,
                              text: 'Cancel',
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          Dimens.boxWidth15,
                          controller.goId == 0
                              ? Container(
                                  height: 40,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.submitColor,
                                    text: 'Submit',
                                    onPressed: () {
                                      controller.createGoodsOrder();
                                    },
                                  ))
                              : Container(
                                  height: 40,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.submitColor,
                                    text: 'Update',
                                    onPressed: () {
                                      controller.updateGoodsOrder();
                                    },
                                  ),
                                ),
                          Spacer()
                        ],
                      )
                    : Dimens.box0));
        // );
      },
    );
  }
}

class AddRowInGoodsOrder extends StatelessWidget {
  final StockManagementAddGoodsOrdersController controller = Get.find();
  AddRowInGoodsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: Dimens.edgeInsets20,
        //  height: 300,
        height: ((controller.rowItem.value.length) * 90) + 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorValues.appBlueBackgroundColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(children: [
          // Column(
          //     children: []..addAll(controller.rowItem.value.map((e) {
          //         return Text(jsonEncode(e));
          //       }))),
          // Text(jsonEncode(controller.dropdownMapperData)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selects Material ",
                  style: Styles.blue700,
                ),
                varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kGoodsFeatureId &&
                                e.add == UserAccessConstants.kHaveAddAccess)
                            .length >
                        0
                    ? GestureDetector(
                        onTap: () {
                          controller.addRowItem();
                        },
                        child: Container(
                          height: 25,
                          width: 70,
                          decoration: BoxDecoration(
                            color: ColorValues.addNewColor,
                            border: Border.all(
                              color: ColorValues.lightGreyColorWithOpacity35,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: Text(
                              " + Add ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : Dimens.box0
              ],
            ),
          ),
          Expanded(
            child: DataTable2(
              // minWidth: 2000,
              dataRowHeight: 105,
              columnSpacing: 10,
              border:
                  TableBorder.all(color: Color.fromARGB(255, 206, 229, 234)),
              columns: [
                DataColumn2(
                    // fixedWidth: 500,
                    label: Row(
                  children: [
                    // Text(
                    //   "  ",
                    //   style:
                    //       TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    // ),
                    // Dimens.boxWidth5,
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Select Material For Req Order:",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          // CustomRichText(title: 'Req Order: '),
                          Dimens.boxWidth10,
                          SizedBox(
                            child: Obx(
                              () => DropdownWebStock(
                                controller: controller,
                                width: MediaQuery.of(context).size.width * .15,
                                dropdownList: controller.goodsOrdersList,
                                isValueSelected:
                                    controller.isReqOrderSelected.value,
                                selectedValue:
                                    controller.selectedReqOrder.value,
                                onValueChanged: controller.onValueChanged,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                DataColumn2(
                    fixedWidth: 250,
                    label: Text(
                      "Paid By",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                DataColumn2(
                    fixedWidth: 180,
                    label: Text(
                      "Requested Qty",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                DataColumn2(
                    fixedWidth: 90,
                    label: Text(
                      "Cost",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                DataColumn2(
                    fixedWidth: 130,
                    label: Text(
                      "Dispatch Qty",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                DataColumn2(
                    fixedWidth: 70,
                    label: Text(
                      "Action",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
              ],
              rows: controller.rowItem.value.map((record) {
                return DataRow(
                  // height: 130,
                  cells: record.map((mapData) {
                    return DataCell(
                      (mapData['key'] == "Drop_down")
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownWebStock(
                                    width: MediaQuery.of(context).size.width,
                                    dropdownList: controller.goDetailsList,
                                    selectedValue: mapData["value"],
                                    onValueChanged: (list, selectedValue) {
                                      // print('paifcghb:${controller.assetList}');
                                      // print({selectedValue: selectedValue});
                                      mapData["value"] = selectedValue;
                                      controller.dropdownMapperData[
                                              selectedValue] =
                                          list.firstWhere(
                                              (element) =>
                                                  element.name == selectedValue,
                                              orElse: null);
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Text("Assets Code :"),
                                      Text(
                                          "${controller.dropdownMapperData[mapData['value']]?.asset_code ?? ''}")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Assets type :"),
                                      Text(
                                          "${controller.dropdownMapperData[mapData['value']]?.asset_type ?? ''}")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Assets Category :"),
                                      Text(
                                          "${controller.dropdownMapperData[mapData['value']]?.asset_cat ?? ''}")
                                    ],
                                  )
                                ],
                              ),
                            )
                          : (mapData['key'] == "Action ")
                              ? Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TableActionButton(
                                        color: ColorValues.appRedColor,
                                        icon: Icons.delete,
                                        label: '',
                                        message: '',
                                        onPress: () {
                                          controller.rowItem.remove(record);
                                        },
                                      )
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Paid_By")
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DropdownWebStock(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            dropdownList: controller.paid,
                                            selectedValue: mapData["value"],
                                            onValueChanged:
                                                (list, selectedValue) {
                                              print(
                                                  'paifcghb:${controller.paid}');
                                              print({
                                                selectedValue: selectedValue
                                              });
                                              mapData["value"] = selectedValue;
                                              controller.paiddropdownMapperData[
                                                      selectedValue] =
                                                  list.firstWhere(
                                                      (element) =>
                                                          element.name ==
                                                          selectedValue,
                                                      orElse: null);
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  : (mapData['key'] == "Order") ||
                                          (mapData['key'] == "Cost")
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black26,
                                                        offset: const Offset(
                                                          5.0,
                                                          5.0,
                                                        ),
                                                        blurRadius: 5.0,
                                                        spreadRadius: 1.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: LoginCustomTextfield(
                                                    width: (Get.width * .4),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    maxLine: 1,
                                                    textController:
                                                        new TextEditingController(
                                                            text: mapData[
                                                                    "value"] ??
                                                                ''),
                                                    onChanged: (txt) {
                                                      mapData["value"] = txt;
                                                    },
                                                  )),
                                            ],
                                          ),
                                        )
                                      : (mapData['key'] == "Requested")
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              5.0,
                                                              5.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child:
                                                          LoginCustomTextfield(
                                                        width: (Get.width * .4),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        maxLine: 1,
                                                        textController:
                                                            new TextEditingController(
                                                                text: mapData[
                                                                        "value"] ??
                                                                    ''),
                                                        onChanged: (txt) {
                                                          mapData["value"] =
                                                              txt;
                                                        },
                                                      )),
                                                ],
                                              ),
                                            )
                                          : Text(mapData['key'] ?? ''),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}

class GoodsOrderTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textController;
  FocusNode? focusnode;
  ScrollController? scroll;
  GoodsOrderTextField(
      {this.keyboardType,
      this.inputFormatters,
      this.textController,
      this.focusnode,
      this.scroll});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 227, 224, 224),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: (MediaQuery.of(context).size.width * .2),
      child: LoginCustomTextfield(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textController: textController,
          scroll: scroll,
          focusNode: focusnode),
    );
  }
}

class AppBarGoodsOrder extends StatelessWidget {
  const AppBarGoodsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 227, 224, 224),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.home,
            color: ColorValues.greyLightColor,
          ),
          InkWell(
            onTap: () {
              Get.offNamed(Routes.home);
            },
            child: Text(
              "DASHBOARD",
              style: Styles.greyLight14,
            ),
          ),
          InkWell(
            onTap: () {
              Get.offNamed(Routes.stockManagementGoodsOrdersScreen);
            },
            child: Text(" / STOCK MANAGEMENT", style: Styles.greyLight14),
          ),
          Text(" / ADD GOODS ORDER DETAILS", style: Styles.greyLight14),
        ],
      ),
    );
  }
}
