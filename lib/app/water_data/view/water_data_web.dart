import 'package:cmms/app/audit_list/audit_list_controller.dart';
import 'package:cmms/app/checklist_mis_plan/checklist_mis_plan_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/water_data/water_data_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';

class WaterDataWeb extends StatefulWidget {
  WaterDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WaterDataWeb> createState() => _WaterDataWebState();
}

class _WaterDataWebState extends State<WaterDataWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaterDataController>(
      id: 'stock_Mangement_Date',
      builder: (controller) {
        // final dataSource = AuditPlanPlanListDataSource(controller);
        return SingleChildScrollView(
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
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        child: Text(" / MIS", style: Styles.greyMediumLight12)),
                    Text(" / WATER DATA", style: Styles.greyMediumLight12)
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: Get.width * 7,
                    margin: EdgeInsets.only(left: 10, top: 30, right: 10),
                    height: Get.height,
                    child: Card(
                      color: Color.fromARGB(255, 245, 248, 250),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "WATER DATA",
                                  style: Styles.blackBold14,
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    CustomRichText(title: 'Date :'),
                                    Dimens.boxWidth10,
                                    CustomTextFieldForStock(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      numberTextField: true,
                                      onTap: () {
                                        controller
                                                .openFromDateToStartDatePicker =
                                            !controller
                                                .openFromDateToStartDatePicker;
                                        controller
                                            .update(['stock_Mangement_Date']);
                                      },
                                      textController: controller.waterDateTc,
                                    ),
                                  ],
                                ),
                                Dimens.boxWidth10,
                                ActionButton(
                                  icon: Icons.add,
                                  label: "Add New",
                                  onPressed: () {
                                    // controller.clearValue();
                                    // Get.offNamed(
                                    //   Routes.createMisPlan,
                                    //   // arguments: {
                                    //   //   'type': controller.type.value
                                    //   // }
                                    // );
                                  },
                                  color: ColorValues.addNewColor,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorValues.greyLightColour,
                          ),
                          Row(
                            children: [
                              PopupMenuButton<String>(
                                tooltip: "",
                                elevation: 25.0,
                                child: Container(
                                  height: 35,
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.only(
                                      top: 4, bottom: 4, right: 8, left: 8),
                                  decoration: BoxDecoration(
                                    color: ColorValues.appLightBlueColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'Column Visibility',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[]..addAll(
                                          controller
                                              .columnVisibility.value.entries
                                              .map((e) {
                                        return PopupMenuItem<String>(
                                            child: ValueListenableBuilder(
                                                valueListenable:
                                                    controller.columnVisibility,
                                                builder:
                                                    (context, value, child) {
                                                  return Row(
                                                    children: [
                                                      Checkbox(
                                                        value: value[e.key],
                                                        onChanged: (newValue) {
                                                          controller
                                                              .setColumnVisibility(
                                                                  e.key,
                                                                  newValue!);
                                                        },
                                                      ),
                                                      Text(e.key),
                                                    ],
                                                  );
                                                }));
                                      })),
                                onSelected: (String value) {
                                  // Handle column selection
                                },
                              ),
                              // Container(
                              //   height: 35,
                              //   margin: EdgeInsets.only(left: 10),
                              //   child: CustomElevatedButton(
                              //       backgroundColor:
                              //           ColorValues.appLightBlueColor,
                              //       onPressed: () {},
                              //       text: 'Copy'),
                              // ),
                              // Container(
                              //   height: 35,
                              //   margin: EdgeInsets.only(left: 10),
                              //   child: CustomElevatedButton(
                              //       backgroundColor:
                              //           ColorValues.appLightBlueColor,
                              //       onPressed: () {},
                              //       text: 'Excel'),
                              // ),
                              // Container(
                              //   height: 35,
                              //   margin: EdgeInsets.only(left: 10),
                              //   child: CustomElevatedButton(
                              //       backgroundColor:
                              //           ColorValues.appLightBlueColor,
                              //       onPressed: () {},
                              //       text: 'PDF'),
                              // ),
                              Spacer(),
                              Container(
                                width: 200,
                                height: 35,
                                margin: Dimens.edgeInsets0_0_16_0,
                                child: TextField(
                                  onChanged: (value) {}, // =>
                                  //       controller.search(value),
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    contentPadding: Dimens.edgeInsets10_0_0_0,
                                    hintText: 'search'.tr,
                                    hintStyle: Styles.grey12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              margin: Dimens.edgeInsets15,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
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
                              child: ScrollableTableView(
                                columns: [
                                  // 'Water Data ID',
                                  'Ground Water in KL units ',
                                  'Water Procured from Third Party for Module cleaning in KL units ',
                                  'Water Procured from Third Party for Drinking in KL units ',
                                  'Water Procured from Third Party for Domestic and others purposes in KL units ',
                                  'water used for drinking in KL units ',
                                  'Water used for Module cleaning in KL units ',
                                  'Water used for domestic and other purpose in KL units ',
                                  'Total Water Withdrawal in KL units ',
                                  'Total Water consumed in KL units ',
                                  'Total Water withdrawal yearly limit as per NOC in KL units ',
                                  'Total Groundwater Withdrawal Limit left in KL units',
                                  "Action",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.15,
                                  );
                                }).toList(),
                                rows: [
                                  [
                                    "200",
                                    "34590",
                                    "20",
                                    "10",
                                    "40",
                                    "400",
                                    "435",
                                    "453",
                                    '546',
                                    "6546",
                                    "76",
                                    "Action",
                                  ],
                                  [
                                    "200",
                                    "34590",
                                    "20",
                                    "10",
                                    "40",
                                    "400",
                                    "435",
                                    "453",
                                    '546',
                                    "6546",
                                    "76",
                                    "Action",
                                  ],
                                  [
                                    "200",
                                    "34590",
                                    "20",
                                    "10",
                                    "40",
                                    "400",
                                    "435",
                                    "453",
                                    '546',
                                    "6546",
                                    "76",
                                    "Action",
                                  ],
                                  [
                                    "200",
                                    "34590",
                                    "20",
                                    "10",
                                    "40",
                                    "400",
                                    "435",
                                    "453",
                                    '546',
                                    "6546",
                                    "76",
                                    "Action",
                                  ],
                                  [
                                    "200",
                                    "34590",
                                    "20",
                                    "10",
                                    "40",
                                    "400",
                                    "435",
                                    "453",
                                    '546',
                                    "6546",
                                    "76",
                                    "Action",
                                  ],
                                  [
                                    "200",
                                    "34590",
                                    "20",
                                    "10",
                                    "40",
                                    "400",
                                    "435",
                                    "453",
                                    '546',
                                    "6546",
                                    "76",
                                    "Action",
                                  ],
                                ].map((record) {
                                  return TableViewRow(
                                    height: 60,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: value == "Action"
                                            ? Wrap(children: [
                                                TableActionButton(
                                                  color: ColorValues.viewColor,
                                                  icon: Icons
                                                      .remove_red_eye_outlined,
                                                  message: 'view',
                                                  onPress: () {
                                                    controller
                                                        .clearStoreIdData();
                                                    // controller.clearValue();
                                                    int auditId =
                                                        1; //AuditPlanPlanningListDetails?.id ?? 0;
                                                    if (auditId != 0) {
                                                      Get.toNamed(
                                                        Routes.viewMisPlan,
                                                        //  arguments: {
                                                        //   'auditId': auditId,
                                                        // 'type': controller.type.value
                                                        // }
                                                      );
                                                    }
                                                  },
                                                ),
                                                TableActionButton(
                                                  color: ColorValues.editColor,
                                                  icon: Icons.edit,
                                                  message: 'Edit',
                                                  onPress: () {
                                                    // int id =
                                                    //     AuditPlanPlanningListDetails?.planId ?? 0;
                                                    // if (id != 0) {
                                                    //   Get.toNamed(Routes.AuditPlanPlanning,
                                                    //       arguments: {"id": id});
                                                    // }
                                                  },
                                                ),
                                                // TableActionButton(
                                                //   color: ColorValues
                                                //       .appGreenColor,
                                                //   icon: Icons.check,
                                                //   message:
                                                //       'Approve/Reject',
                                                //   onPress: () {
                                                //     // int id =
                                                //     //     AuditPlanPlanningListDetails?.planId ?? 0;
                                                //     // if (id != 0) {
                                                //     //   Get.toNamed(
                                                //     //     Routes.viewMcPlaning,
                                                //     //     arguments: {'id': id, "type": 1},
                                                //     //   );
                                                //     // }
                                                //   },
                                                // ),
                                              ])
                                            : value == "0001"
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        value,
                                                      ),
                                                      Dimens.boxHeight10,
                                                      // Align(
                                                      //   alignment: Alignment
                                                      //       .centerRight,
                                                      //   child: Container(
                                                      //     padding: Dimens
                                                      //         .edgeInsets8_2_8_2,
                                                      //     decoration:
                                                      //         BoxDecoration(
                                                      //       color: ColorValues
                                                      //           .addNewColor,
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   4),
                                                      //     ),
                                                      //     child: Text(
                                                      //       '',
                                                      //       style: Styles
                                                      //           .white10
                                                      //           .copyWith(
                                                      //         color: Colors
                                                      //             .white,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  )
                                                : Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      right: 120,
                      top: 100,
                      child: DatePickerWidget(
                        minDate: DateTime(DateTime.now().year),
                        maxDate: DateTime(DateTime.now().year, 13,
                            0), // last date of this year
                        controller: DateRangePickerController(),
                        selectionChanges: (p0) {
                          print('po valu ${p0.value.toString()}');
                          controller.waterDateTc.text =
                              DateFormat('yyyy-MM-dd').format(p0.value);
                          controller.openFromDateToStartDatePicker =
                              !controller.openFromDateToStartDatePicker;
                          controller.update(['stock_Mangement_Date']);
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

DataColumn2 buildDataColumn(
  // String columnName,
  String header,

  /// ColumnSize columnSize,
  RxString filterText,
  double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  return //
      DataColumn2(
    // size: columnSize,
    fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          SizedBox(
            height: Get.height * 0.05,
            child: TextField(
              onChanged: (value) {
                filterText.value = value;
                //   onSearchCallBack(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: 'Filter',
                contentPadding:
                    EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black16W500,
            ),
          ),
        ]),
    // ),
  );
}

class ChecklistMisPlanListDataSource extends DataTableSource {
  final WaterDataController controller;

  late List<AuditPlanListModel?> filteredAuditPlanList;

  ChecklistMisPlanListDataSource(this.controller) {
    filtersModuleCliningPlan();
  }

  ///
  void filtersModuleCliningPlan() {
    filteredAuditPlanList = <AuditPlanListModel?>[];
    filteredAuditPlanList = controller.auditPlanList.where((auditList) {
      return (auditList.id ?? '')
              .toString()
              .contains(controller.planIdFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.planTitleFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.noOfDaysFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.createdByFilterText.value.toLowerCase()) &&
          (auditList.facility_name ?? '')
              .toString()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (auditList.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredAuditPlanList": filteredAuditPlanList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final AuditPlanPlanningListDetails = filteredAuditPlanList[index];

    // controller.PlanId.value = AuditPlanPlanningListDetails?.planId ?? 0;
    var cellsBuffer = [
      "planId",
      "S1234590", // '${AuditPlanPlanningListDetails?.plan_number ?? ''}',
      "CheckLIst001", // '${AuditPlanPlanningListDetails?.status ?? ''}',
      // "", // '${AuditPlanPlanningListDetails?.status ?? ''}',
      "22-11-2023", // '${AuditPlanPlanningListDetails?.status ?? ''}',
      "Weekly", // '${AuditPlanPlanningListDetails?.frequency ?? ''}',
      'Actions',
    ];

    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        // print({"entry.value removed": entry.key});
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'planId')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AuditPlanPlanningListDetails?.id}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                            color:
                                // controller.AuditPlanListPlan
                                //         .firstWhere(
                                //           (e) =>
                                //               e?.planId ==
                                //               AuditPlanPlanningListDetails!
                                //                   .planId,
                                //           orElse: () =>
                                //               AuditPlanListPlanModel(
                                //                   planId: 00),
                                //         )
                                //         ?.status ==
                                //     342
                                // ? ColorValues.approveColor
                                // :
                                ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${AuditPlanPlanningListDetails?.short_status}',
                            style: Styles.white10.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        TableActionButton(
                          color: ColorValues.viewColor,
                          icon: Icons.remove_red_eye_outlined,
                          message: 'view',
                          onPress: () {
                            controller.clearStoreIdData();
                            // controller.clearValue();
                            int auditId = AuditPlanPlanningListDetails?.id ?? 0;
                            if (auditId != 0) {
                              Get.toNamed(
                                Routes.viewMisPlan,
                                //  arguments: {
                                //   'auditId': auditId,
                                // 'type': controller.type.value
                                // }
                              );
                            }
                          },
                        ),
                        TableActionButton(
                          color: ColorValues.editColor,
                          icon: Icons.edit,
                          message: 'Edit',
                          onPress: () {
                            // int id =
                            //     AuditPlanPlanningListDetails?.planId ?? 0;
                            // if (id != 0) {
                            //   Get.toNamed(Routes.AuditPlanPlanning,
                            //       arguments: {"id": id});
                            // }
                          },
                        ),
                        TableActionButton(
                          color: ColorValues.appGreenColor,
                          icon: Icons.check,
                          message: 'Approve/Reject',
                          onPress: () {
                            // int id =
                            //     AuditPlanPlanningListDetails?.planId ?? 0;
                            // if (id != 0) {
                            //   Get.toNamed(
                            //     Routes.viewMcPlaning,
                            //     arguments: {'id': id, "type": 1},
                            //   );
                            // }
                          },
                        ),
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreIdData();
        // controller.clearValue();
        int auditId = AuditPlanPlanningListDetails?.id ?? 0;
        if (auditId != 0) {
          Get.toNamed(
            Routes.viewMisPlan,
            // arguments: {
            //   'auditId': auditId,
            // }
          );
        }
      },
    );
  }

  @override
  int get rowCount => filteredAuditPlanList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
