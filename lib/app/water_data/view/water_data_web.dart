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

final List<Map<String, dynamic>> statutoryData = [
  {
    'Ground Water in KL units': 'Fire NOC status',
    'Water Procured from Third Party for Module cleaning in KL units': '10',
    'validity': '5',
    'Water Procured from Third Party for Drinking in KL units': '5',
    'Water Procured from Third Party for Domestic and others purposes in KL units':
        '5',
    'water used for drinking in KL units': '5',
    'Water used for Module cleaning in KL units': '5',
    'Water used for domestic and other purpose in KL units': '5',
    'Total Water Withdrawal in KL units': '5',
    'Total Water consumed in KL units': '5',
    'Total Water withdrawal yearly limit as per NOC in KL units': '5',
    'Total Groundwater Withdrawal Limit left in KL units': '5',
  },
  {
    'Ground Water in KL units': 'Fire NOC status',
    'Water Procured from Third Party for Module cleaning in KL units': '10',
    'validity': '5',
    'Water Procured from Third Party for Drinking in KL units': '5',
    'Water Procured from Third Party for Domestic and others purposes in KL units':
        '5',
    'water used for drinking in KL units': '5',
    'Water used for Module cleaning in KL units': '5',
    'Water used for domestic and other purpose in KL units': '5',
    'Total Water Withdrawal in KL units': '5',
    'Total Water consumed in KL units': '5',
    'Total Water withdrawal yearly limit as per NOC in KL units': '5',
    'Total Groundwater Withdrawal Limit left in KL units': '5',
  },
  {
    'Ground Water in KL units': 'Fire NOC status',
    'Water Procured from Third Party for Module cleaning in KL units': '10',
    'validity': '5',
    'Water Procured from Third Party for Drinking in KL units': '5',
    'Water Procured from Third Party for Domestic and others purposes in KL units':
        '5',
    'water used for drinking in KL units': '5',
    'Water used for Module cleaning in KL units': '5',
    'Water used for domestic and other purpose in KL units': '5',
    'Total Water Withdrawal in KL units': '5',
    'Total Water consumed in KL units': '5',
    'Total Water withdrawal yearly limit as per NOC in KL units': '5',
    'Total Groundwater Withdrawal Limit left in KL units': '5',
  },

  // Add more data as needed
];

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
                    margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                    height: Get.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 10, right: 10),
                              child: Column(
                                children: [
                                  Card(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                top: 20,
                                              ),
                                              child: Text(
                                                "Water Data",
                                                style: Styles.blackBold16,
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 20,
                                                right: 20,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text('Date :'),
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
                                                              .openFromDateToStartDatePicker =
                                                          !controller
                                                              .openFromDateToStartDatePicker;
                                                      controller.update([
                                                        'stock_Mangement_Date'
                                                      ]);
                                                    },
                                                    textController:
                                                        controller.waterDateTc,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: ColorValues.greyLightColour,
                                        ),
                                        Container(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          width: Get.width,
                                          height: Get.height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: DataTable2(
                                              headingRowHeight: 45,
                                              columnSpacing: 12,
                                              horizontalMargin: 12,
                                              minWidth: 600,
                                              columns: [
                                                DataColumn2(
                                                  label: Text(
                                                    'Ground Water in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Water Procured from Third Party for Module cleaning in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Water Procured from Third Party for Drinking in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Water Procured from Third Party for Domestic and others purposes in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'water used for drinking in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Water used for Module cleaning in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Water used for domestic and other purpose in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Total Water Withdrawal in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Total Water consumed in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Total Water withdrawal yearly limit as per NOC in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Total Groundwater Withdrawal Limit left in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  size: ColumnSize.L,
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Action',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ],
                                              rows: statutoryData.map(
                                                (data) {
                                                  return DataRow(
                                                    cells: [
                                                      DataCell(Text(data[
                                                          'Ground Water in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water Procured from Third Party for Module cleaning in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water Procured from Third Party for Drinking in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water Procured from Third Party for Domestic and others purposes in KL units'])),
                                                      DataCell(Text(data[
                                                          'water used for drinking in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water used for Module cleaning in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water used for domestic and other purpose in KL units'])),
                                                      DataCell(Text(data[
                                                          'Total Water Withdrawal in KL units'])),
                                                      DataCell(Text(data[
                                                          'Total Water consumed in KL units'])),
                                                      DataCell(Text(data[
                                                          'Total Water withdrawal yearly limit as per NOC in KL units'])),
                                                      DataCell(Text(data[
                                                          'Total Groundwater Withdrawal Limit left in KL units'])),
                                                      DataCell(
                                                        Row(
                                                          children: [
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              icon: Icons
                                                                  .remove_red_eye_outlined,
                                                              message: 'View',
                                                            ),
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .editColor,
                                                              icon: Icons.edit,
                                                              message: 'Edit',
                                                              onPress: () {},
                                                            ),
                                                            TableActionButton(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      156,
                                                                      210,
                                                                      156),
                                                              icon:
                                                                  Icons.replay,
                                                              message: 'Re-New',
                                                              onPress: () {},
                                                            ),
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .deleteColor,
                                                              icon:
                                                                  Icons.delete,
                                                              message: 'Delete',
                                                              onPress: () {},
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
