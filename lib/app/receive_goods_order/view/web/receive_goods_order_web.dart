import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/receive_goods_order/receive_goods_order_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReceiveGoodsOrderWeb extends StatefulWidget {
  ReceiveGoodsOrderWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ReceiveGoodsOrderWeb> createState() => _ReceiveGoodsOrderWebState();
}

class _ReceiveGoodsOrderWebState extends State<ReceiveGoodsOrderWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiveGoodsOrdersController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Obx(
          () => Scaffold(
            body: Container(
              color: Color.fromARGB(255, 234, 236, 238),
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 227, 224, 224),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 236, 234, 234)
                              .withOpacity(0.5),
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
                        Text(
                          "DASHBOARD",
                          style: Styles.greyLight14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(" / STOCK MANAGEMENT",
                              style: Styles.greyMediumLight12),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(" /  ADD GOODS ORDER DETAILS",
                                style: Styles.greyMediumLight12)),
                      ],
                    ),
                  ),
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
                                      controller.id == null
                                          ? Container()
                                          : Text(
                                              " Order ID :${controller.getPurchaseDetailsByIDModel.value?.id} ",
                                              style: Styles.blackBold16,
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
                                              CustomRichText(title: 'Vendor: '),
                                              Dimens.boxWidth10,
                                              SizedBox(
                                                child: DropdownWebStock(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  dropdownList:
                                                      controller.ownerList,
                                                  isValueSelected: controller
                                                      .isSelectedBusinessType
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedBusinessType
                                                      .value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Challan No.: '),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController: controller
                                                        .challanNoCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(title: 'P.O: '),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.pOCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'Frieght:To Pay /Paid : '),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController: controller
                                                        .frieghtToPayPaidCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'No. of Packages  received :'),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    textController: controller
                                                        .noOfPackagesReceivedCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'Condition of Packages Received : '),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController: controller
                                                        .conditionOfPackagesReceivedCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'GIR. No. : '),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.girNoCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(children: [
                                            CustomRichText(title: 'Amount : '),
                                            Dimens.boxWidth10,
                                            Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 227, 224, 224),
                                                    width: 1,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(255,
                                                              236, 234, 234)
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2),
                                                    ),
                                                  ],
                                                ),
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2),
                                                child: LoginCustomTextfield(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                      TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  textController:
                                                      controller.amountCtrlr,
                                                )),
                                          ]),
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
                                                width: MediaQuery.of(context)
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
                                                textController:
                                                    controller.purchaseDateTc,
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
                                                width: MediaQuery.of(context)
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
                                                textController:
                                                    controller.challanDateTc,
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                numberTextField: true,
                                                onTap: () {
                                                  controller.openPODatePicker =
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
                                                  title: 'Received Date  : '),
                                              Dimens.boxWidth10,
                                              CustomTextFieldForStock(
                                                width: MediaQuery.of(context)
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
                                                textController:
                                                    controller.receivedDateTc,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'L.R No.  : '),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .20),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.lrNoCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Vehicle  No. : '),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController: controller
                                                        .vehicleNoCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Job Ref. : '),
                                              Dimens.boxWidth10,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    textController:
                                                        controller.jobRefCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Dimens.boxWidth10,
                                              CustomRichText(
                                                  title: 'Currency: '),
                                              Dimens.boxWidth10,
                                              SizedBox(
                                                child: DropdownWebStock(
                                                  width: MediaQuery.of(context)
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
                                                  onValueChanged:
                                                      controller.onValueChanged,
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
                                Container(
                                  height: 350,
                                  // margin: Dimens.edgeInsets20,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Row(
                                          children: [
                                            Text(" Selects Assets"),
                                            Spacer(),
                                            // GestureDetector(
                                            //     onTap: () {
                                            //       controller.addRowItem();
                                            //     },
                                            //     child: Row(
                                            //       children: [
                                            //         Text("Add"),
                                            //         Icon(Icons.exposure_plus_1),
                                            //       ],
                                            //     )),
                                          ],
                                        ),
                                      ),
                                      // Column(
                                      //     children: []..addAll(controller
                                      //           .rowItem.value
                                      //           .map((e) {
                                      //         return Text(jsonEncode(e));
                                      //       }))),
                                      // Text(jsonEncode(
                                      //     controller.dropdownMapperData)),
                                      Obx(
                                        () => Container(
                                          height: 300,
                                          child: ScrollableTableView(
                                            columns: [
                                              "Assets",
                                              "Cost",
                                              "Ordered Qty",
                                              "Received  Qty",
                                              "Accepted Qty",
                                              "Damaged Items",
                                              "Order Pending"
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.14,
                                                height: Get.height / 2,
                                              );
                                            }).toList(),
                                            rows: controller.rowItem.value
                                                .map((record) {
                                              return TableViewRow(
                                                height: 130,
                                                cells: record.map((mapData) {
                                                  return TableViewCell(
                                                    child: (mapData['key'] ==
                                                            "Drop_down")
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 20,
                                                              right: 20,
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                DropdownWebStock(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  dropdownList:
                                                                      controller
                                                                          .assetList
                                                                          .value,
                                                                  selectedValue:
                                                                      mapData[
                                                                          "value"],
                                                                  onValueChanged:
                                                                      (list,
                                                                          selectedValue) {
                                                                    print(
                                                                        'paifcghb:${controller.assetList}');
                                                                    print({
                                                                      selectedValue:
                                                                          selectedValue
                                                                    });
                                                                    mapData["value"] =
                                                                        selectedValue;
                                                                    controller.dropdownMapperData[selectedValue] = list.firstWhere(
                                                                        (element) =>
                                                                            element.name ==
                                                                            selectedValue,
                                                                        orElse:
                                                                            null);
                                                                  },
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Assets Code :"),
                                                                    Text(
                                                                        "${controller.dropdownMapperData[mapData['value']]?.asset_code ?? ''}")
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Assets type :"),
                                                                    Text(
                                                                        "${controller.dropdownMapperData[mapData['value']]?.asset_type ?? ''}")
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Assets Category :"),
                                                                    Text(
                                                                        "${controller.dropdownMapperData[mapData['value']]?.cat_name ?? ''}")
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        : (mapData['key'] ==
                                                                    "Order") ||
                                                                (mapData[
                                                                        'key'] ==
                                                                    "Cost")
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left: 20,
                                                                  right: 20,
                                                                ),
                                                                child: Container(
                                                                    width: (Get.width * .4),
                                                                    // padding: EdgeInsets.all(value),
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
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child: LoginCustomTextfield(
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      inputFormatters: <
                                                                          TextInputFormatter>[
                                                                        FilteringTextInputFormatter
                                                                            .digitsOnly
                                                                      ],
                                                                      maxLine:
                                                                          1,
                                                                      textController:
                                                                          new TextEditingController(
                                                                              text: mapData["value"] ?? ''),
                                                                      onChanged:
                                                                          (txt) {
                                                                        mapData["value"] =
                                                                            txt;
                                                                      },
                                                                    )),
                                                              )
                                                            : (mapData['key'] ==
                                                                        "Received") ||
                                                                    (mapData[
                                                                            'key'] ==
                                                                        "Accepted")
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 20,
                                                                      right: 20,
                                                                    ),
                                                                    child: Container(
                                                                        width: (Get.width * .4),
                                                                        // padding: EdgeInsets.all(value),
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
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child: LoginCustomTextfield(
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          inputFormatters: <
                                                                              TextInputFormatter>[
                                                                            FilteringTextInputFormatter.digitsOnly
                                                                          ],
                                                                          maxLine:
                                                                              1,
                                                                          textController:
                                                                              new TextEditingController(text: mapData["value"] ?? ''),
                                                                          onChanged:
                                                                              (txt) {
                                                                            mapData["value"] =
                                                                                txt;
                                                                          },
                                                                        )),
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "Pending")
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets
                                                                                .only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20,
                                                                        ),
                                                                        child:
                                                                            Checkbox(
                                                                          onChanged:
                                                                              (value) {},
                                                                          value:
                                                                              false,
                                                                        ))
                                                                    : (mapData['key'] ==
                                                                            "Damaged")
                                                                        ? Padding(
                                                                            padding: const EdgeInsets
                                                                                .only(
                                                                              left: 20,
                                                                              right: 20,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                left: 20,
                                                                                right: 20,
                                                                              ),
                                                                              child: Container(
                                                                                  width: (Get.width * .4),
                                                                                  // padding: EdgeInsets.all(value),
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
                                                                                    color: ColorValues.whiteColor,
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                  ),
                                                                                  child: LoginCustomTextfield(
                                                                                    keyboardType: TextInputType.number,
                                                                                    inputFormatters: <TextInputFormatter>[
                                                                                      FilteringTextInputFormatter.digitsOnly
                                                                                    ],
                                                                                    maxLine: 1,
                                                                                    textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                    onChanged: (txt) {
                                                                                      mapData["value"] = txt;
                                                                                    },
                                                                                  )),
                                                                            ))
                                                                        : Text(mapData['key'] ??
                                                                            ''),
                                                  );
                                                }).toList(),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight15,
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
                                      DateFormat('yyyy-MM-dd').format(p0.value);
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
                                      DateFormat('yyyy-MM-dd').format(p0.value);
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
                                      DateFormat('yyyy-MM-dd').format(p0.value);
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
                                minDate: DateTime(DateTime.now().year),
                                maxDate: DateTime(DateTime.now().year, 13,
                                    0), // last date of this year
                                controller: DateRangePickerController(),
                                selectionChanges: (p0) {
                                  print('po valu ${p0.value.toString()}');
                                  controller.receivedDateTc.text =
                                      DateFormat('yyyy-MM-dd').format(p0.value);
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
            floatingActionButton: Row(
              children: [
                Spacer(),
                Container(
                  height: 40,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.cancelColor,
                    text: 'Cancel',
                    onPressed: () {
                      // controller.AddInventory();
                    },
                  ),
                ),
                Dimens.boxWidth15,
                controller.id == null
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
            ),
          ),
        );
      },
    );
  }
}