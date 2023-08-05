import 'package:clipboard/clipboard.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/block_type_list/block_type_list_controller.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class BlockTypeListContentWeb extends GetView<BlockTypeListController> {
  BlockTypeListContentWeb({Key? key}) : super(key: key);
  final BlockTypeListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
                  Text(
                    "DASHBOARD",
                    style: Styles.greyLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / MASTERS", style: Styles.greyMediumLight12),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / BLOCK LIST", style: Styles.greyMediumLight12),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.add == 0)
                              .length >
                          0
                      ? Container(
                          width: (Get.width * .3),
                          margin: EdgeInsets.only(left: 30, top: 30),
                          height: Get.height / 2.25,
                          child: Card(
                            color: Color.fromARGB(255, 251, 252, 253),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                // Text(
                                //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10, top: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Add Block",
                                          style: Styles.blackBold16,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CustomRichText(
                                                  title: 'Facility '),
                                            ),
                                            Expanded(
                                              child: Container(

                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.040,
                                                margin: Dimens.edgeInsets5,
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
                                                    BoxShadow(
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .2) -
                                                    45,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.040,
                                                  width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .4),
                                                  child: DropdownWidget(
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .facilityTypeList,
                                                    isValueSelected: controller
                                                        .isSelectedfacility
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedfacility.value,
                                                    onValueChanged:
                                                        (selectedValue,
                                                        isValueSelected) {
                                                      controller.onValueChanged(
                                                          selectedValue,
                                                          isValueSelected);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Title ')),
                                            Expanded(
                                              child: Container(
                                                  margin: Dimens.edgeInsets5,
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
                                                      BoxShadow(
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      45,
                                                  child: LoginCustomTextfield(
                                                    textController:
                                                        controller.titleCtrlr,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   children: [
                                        //     Expanded(
                                        //       child: CustomRichText(
                                        //           title: 'Facility'),
                                        //     ),
                                        //     Expanded(
                                        //       child: Container(
                                        //         height: MediaQuery.of(context)
                                        //                 .size
                                        //                 .height *
                                        //             0.040,
                                        //         margin: Dimens.edgeInsets5,
                                        //         decoration: BoxDecoration(
                                        //           boxShadow: [
                                        //             BoxShadow(
                                        //               color: Colors.black26,
                                        //               offset: const Offset(
                                        //                 5.0,
                                        //                 5.0,
                                        //               ),
                                        //               blurRadius: 5.0,
                                        //               spreadRadius: 1.0,
                                        //             ),
                                        //             BoxShadow(
                                        //               color: ColorValues
                                        //                   .whiteColor,
                                        //               offset: const Offset(
                                        //                   0.0, 0.0),
                                        //               blurRadius: 0.0,
                                        //               spreadRadius: 0.0,
                                        //             ),
                                        //           ],
                                        //           color: ColorValues.whiteColor,
                                        //           borderRadius:
                                        //               BorderRadius.circular(5),
                                        //         ),
                                        //         width: (MediaQuery.of(context)
                                        //                     .size
                                        //                     .width *
                                        //                 .2) -
                                        //             45,
                                        //         child: Container(
                                        //           height: MediaQuery.of(context)
                                        //                   .size
                                        //                   .height *
                                        //               0.040,
                                        //           width: (MediaQuery.of(context)
                                        //                   .size
                                        //                   .width *
                                        //               .3),
                                        //           child: DropdownWebWidget(
                                        //             boxShadow: [
                                        //               BoxShadow(
                                        //                 color: Colors.black26,
                                        //                 offset: const Offset(
                                        //                   5.0,
                                        //                   5.0,
                                        //                 ),
                                        //                 blurRadius: 5.0,
                                        //                 spreadRadius: 1.0,
                                        //               ),
                                        //               BoxShadow(
                                        //                 color: ColorValues
                                        //                     .whiteColor,
                                        //                 offset: const Offset(
                                        //                     0.0, 0.0),
                                        //                 blurRadius: 0.0,
                                        //                 spreadRadius: 0.0,
                                        //               ),
                                        //             ],
                                        //             controller: controller,
                                        //             dropdownList: controller
                                        //                 .facilityTypeList,
                                        //             isValueSelected: controller
                                        //                 .isSelectedfacility
                                        //                 .value,
                                        //             selectedValue: controller
                                        //                 .selectedfacility.value,
                                        //             onValueChanged:
                                        //                 (selectedValue,
                                        //                     isValueSelected) {
                                        //               controller.onValueChanged(
                                        //                   selectedValue,
                                        //                   isValueSelected);
                                        //             },
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // Text(
                                            //   "Description ",
                                            //   style: Styles.blackBold16,
                                            // ),
                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Description ')),

                                            Expanded(
                                              child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.040,
                                                  margin: Dimens.edgeInsets5,
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
                                                      BoxShadow(
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      45,
                                                  child: LoginCustomTextfield(
                                                    textController: controller
                                                        .descriptionCtrlr,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        // Row(
                                        //   children: [
                                        //     CustomRichText(
                                        //         title: 'Require SOP/JSA: '),
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Checkbox(
                                        //       value: controller
                                        //           .isCheckedRequire.value,
                                        //       onChanged: (bool? value) {
                                        //         controller.requiretoggleCheckbox();
                                        //       },
                                        //     ),
                                        //   ],
                                        // ),
                                      ]),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 40,
                                        width: (Get.width * .1),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appRedColor,
                                            onPressed: () {},
                                            text: 'Cancel')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: (Get.width * .2) - 70,
                                      child:
                                          // controller.selectedItem == null
                                          //     ?
                                          CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {
                                                controller
                                                    .createBlockList()
                                                    .then((value) {
                                                  print("value,$value");
                                                  if (value == true)
                                                    controller
                                                        .issuccessCreateBlock();
                                                });
                                              },
                                              text: 'Create Block List'),
                                      // : CustomElevatedButton(
                                      // backgroundColor: ColorValues
                                      //     .appDarkBlueColor,
                                      // onPressed: () {
                                      //   controller
                                      //       .updateBusinessType(
                                      //       controller
                                      //           .selectedItem?.id)
                                      //       .then((value) {
                                      //     print("value,$value");
                                      //     if (value == true)
                                      //       controller
                                      //           .issuccessCreatechecklist();
                                      //   });
                                      // },
                                      // text: 'Update')
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.view == 0)
                              .length >
                          0
                      ? Expanded(
                          child: Container(
                            width: Get.width * 7,
                            margin: EdgeInsets.only(left: 10, top: 30),
                            height: Get.height,
                            child: Card(
                              color: Color.fromARGB(255, 251, 252, 253),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "List of Blocks",
                                      style: Styles.blackBold16,
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              FlutterClipboard.copy(controller
                                                      // .preventiveCheckList![0]
                                                      .toString())
                                                  .then((value) {
                                                print("copy data");
                                              });
                                            },
                                            text: 'Copy'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'Excel'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'PDF'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'columnVisibility'.tr,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  controller.blockTypeList!.isEmpty
                                      ? Expanded(
                                          child: ScrollableTableView(
                                            columns: [
                                              "Sr.No.",
                                              "Title",
                                              "SPV",
                                              "Address",
                                              "City",
                                              "State",
                                              "Country",
                                              "Pin",
                                              "Action"
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.16,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller.blockTypeList
                                                        ?.length ??
                                                    0,
                                                (index) {
                                                  return [
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                  ];
                                                },
                                              ),
                                            ].map((record) {
                                              return TableViewRow(
                                                height: 60,
                                                cells: record.map((value) {
                                                  return TableViewCell(
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              );
                                            }).toList(),
                                          ),
                                        )
                                      : Expanded(
                                          child: ScrollableTableView(
                                            paginationController: controller
                                                .blockTypeListPaginationController,
                                            columns: [
                                              "Sr.No.",
                                              "Title",
                                              "SPV",
                                              "Address",
                                              "City",
                                              "State",
                                              "Country",
                                              "Pin",
                                              "Action"
                                            ].map((column) {
                                              return TableViewColumn(
                                                minWidth: Get.width * 0.12,
                                                label: column,
                                              );
                                            }).toList(),
                                            rows: //
                                                [
                                              ...List.generate(
                                                controller.blockTypeList.length,
                                                (index) {
                                                  var facilityTypeListDetails =
                                                      controller
                                                          .blockTypeList[index];
                                                  return [
                                                    '${facilityTypeListDetails.id}',
                                                    '${facilityTypeListDetails.name}',
                                                    '${facilityTypeListDetails.spv}',
                                                    '${facilityTypeListDetails.address}',
                                                    '${facilityTypeListDetails.city}',
                                                    '${facilityTypeListDetails.state}',
                                                    '${facilityTypeListDetails.country}',
                                                    '${facilityTypeListDetails.pin}',
                                                    "Action"
                                                  ];
                                                },
                                              ),
                                            ].map((_permitTypeList) {
                                              return TableViewRow(
                                                  height: 45,
                                                  cells: _permitTypeList
                                                      .map((value) {
                                                    return TableViewCell(
                                                        child: (value ==
                                                                'Checkbox')
                                                            ? Checkbox(
                                                                value: controller
                                                                    .isChecked
                                                                    .value,
                                                                onChanged:
                                                                    (val) {})
                                                            : (value ==
                                                                    "Action")
                                                                ? Wrap(
                                                            alignment: WrapAlignment.center, // Align buttons in the center

                                                            children: [
                                                                        // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                                        //         0
                                                                        //     ?
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.only(bottom: 10),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.only(bottom: 10),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                  TableActionButton(
                                                                                    color: ColorValues.editColor,
                                                                                    icon: Icons.edit,
                                                                                    message: 'Edit',
                                                                                    onPress: () {
                                                                                      controller.selectedItem = controller.blockTypeList!.firstWhere((element) => "${element?.id}" == _permitTypeList[0]);
                                                                                      // controller.selectedfacility.value = controller.onFetchNameBusinessTypeFromId(controller.selectedItem?. )!;
                                                                                      // print(controller.selectedBusinessType.value);
                                                                                      // controller.
                                                                                      // selectedfacilityId :
                                                                                      // print(controller.onFetchNameFromId(controller.selectedItem?.type)!);
                                                                                      controller.titleCtrlr.text = controller.selectedItem?.name ?? '';
                                                                                      // controller.descriptionCtrlr.text = controller.selectedItem?.description ?? '';
                                                                                    },
                                                                                  ),
                                                                                  TableActionButton(
                                                                                    color: ColorValues.deleteColor,
                                                                                    icon: Icons.delete,
                                                                                    message: 'Delete',
                                                                                    onPress: () {
                                                                                      controller.isDeleteDialog(business_id: _permitTypeList[0], business: _permitTypeList[1]);
                                                                                    },
                                                                                  ),
                                                                                ]),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        // : Container()
                                                                      ])
                                                            : Align( // Align the text in the center
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            value,
                                                          ),
                                                        ),);
                                                  }).toList());
                                            }).toList(),
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .blockTypeListPaginationController,
                                        builder: (context, value, child) {
                                          return Row(children: [
                                            Text(
                                                "${controller.blockTypeListPaginationController.currentPage}  of ${controller.blockTypeListPaginationController.pageCount}"),
                                            Row(children: [
                                              IconButton(
                                                onPressed: controller
                                                            .blockTypeListPaginationController
                                                            .currentPage <=
                                                        1
                                                    ? null
                                                    : () {
                                                        controller
                                                            .blockTypeListPaginationController
                                                            .previous();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: controller
                                                              .blockTypeListPaginationController
                                                              .currentPage <=
                                                          1
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: controller
                                                            .blockTypeListPaginationController
                                                            .currentPage >=
                                                        controller
                                                            .blockTypeListPaginationController
                                                            .pageCount
                                                    ? null
                                                    : () {
                                                        controller
                                                            .blockTypeListPaginationController
                                                            .next();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: controller
                                                              .blockTypeListPaginationController
                                                              .currentPage >=
                                                          controller
                                                              .blockTypeListPaginationController
                                                              .pageCount
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                            ]),
                                          ]);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
