import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../preventive_maintenance_task_controller.dart';

class PreventiveMaintenanceTaskContentWeb extends StatefulWidget {
  PreventiveMaintenanceTaskContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PreventiveMaintenanceTaskContentWeb> createState() =>
      _PreventiveMaintenanceTaskContentWebState();
}

class _PreventiveMaintenanceTaskContentWebState
    extends State<PreventiveMaintenanceTaskContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreventiveMaintenanceTaskController>(
        id: 'PreventiveMaintenanceTask',
        builder: (controller) {
          return Obx(() {
            final dataSource = PmTaskDataSource(controller);

            return Column(
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
                        child: Text(" / Preventive Maintenance".toUpperCase(),
                            style: Styles.greyMediumLight12),
                      ),
                      Text(" / PM TASKS", style: Styles.greyMediumLight12)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width * 7,
                          margin: EdgeInsets.only(left: 10, top: 30),
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
                                    children: [
                                      Text(
                                        "PM Tasks ",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          CustomRichText(title: 'Date Range'),
                                          Dimens.boxWidth10,
                                          CustomTextFieldForStock(
                                            width: MediaQuery.of(context)
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
                                                'PreventiveMaintenanceTask'
                                              ]);
                                            },
                                            hintText:
                                                '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'Copy'),
                                    ),
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'Excel'),
                                    ),
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'PDF'),
                                    ),
                                    PopupMenuButton<String>(
                                      tooltip: "",
                                      elevation: 25.0,
                                      child: Container(
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        padding: EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                            right: 8,
                                            left: 8),
                                        decoration: BoxDecoration(
                                          color: ColorValues.appLightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                      itemBuilder: (BuildContext context) => <
                                          PopupMenuEntry<String>>[]..addAll(
                                            controller
                                                .columnVisibility.value.entries
                                                .map((e) {
                                          return PopupMenuItem<String>(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    return Row(
                                                      children: [
                                                        Checkbox(
                                                          value: value[e.key],
                                                          onChanged:
                                                              (newValue) {
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
                                    Spacer(),
                                    Container(
                                      width: 200,
                                      height: 35,
                                      margin: Dimens.edgeInsets0_0_16_0,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          contentPadding:
                                              Dimens.edgeInsets10_0_0_0,
                                          hintText: 'search'.tr,
                                          hintStyle: Styles.grey12,
                                        ),
                                        onChanged: (value) =>
                                            controller.search(value),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                controller.pmTaskList.isEmpty == true
                                    ? Center(child: Text('No data'))
                                    : Expanded(
                                        child: ValueListenableBuilder(
                                            valueListenable:
                                                controller.columnVisibility,
                                            builder: (context, value, child) {
                                              final dataSource =
                                                  PmTaskDataSource(controller);

                                              return PaginatedDataTable2(
                                                // fixedLeftColumns: 1,
                                                dataRowHeight:
                                                    Get.height * 0.10,
                                                columnSpacing: 10,
                                                source:
                                                    dataSource, // Custom DataSource class
                                                headingRowHeight:
                                                    Get.height * 0.12,
                                                minWidth:
                                                    2000, //Get.width * 1.2,
                                                showCheckboxColumn: false,
                                                rowsPerPage:
                                                    10, // Number of rows per page
                                                availableRowsPerPage: [
                                                  10,
                                                  20,
                                                  30,
                                                  50
                                                ],
                                                columns: [
                                                  for (var entry
                                                      in value.entries)
                                                    if (entry.value)
                                                      buildDataColumn(
                                                        entry.key,
                                                        controller.filterText[
                                                            entry.key]!,
                                                        controller.columnwidth[
                                                            entry.key],
                                                      ),
                                                  buildDataColumn(
                                                    'Actions',
                                                    controller.titleFilterText,
                                                    200,
                                                  ),
                                                ],
                                              );
                                            }),
                                      )
                              ],
                            ),
                          ),
                        ),
                        if (controller.openFromDateToStartDatePicker)
                          Positioned(
                            right: 150,
                            top: 85,
                            child: DatePickerWidget(
                              selectionMode: DateRangePickerSelectionMode.range,
                              monthCellStyle: DateRangePickerMonthCellStyle(
                                todayCellDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorValues.appDarkBlueColor),
                              ), // last date of this year
                              // controller: DateRangePickerController(),
                              initialSelectedRange: PickerDateRange(
                                controller.fromDate.value,
                                controller.toDate.value,
                              ),

                              onSubmit: (value) {
                                print('po valu ${value.toString()}');
                                PickerDateRange? data =
                                    value as PickerDateRange;

                                var pickUpDate =
                                    DateTime.parse(data.startDate.toString());
                                controller.fromDate.value = pickUpDate;
                                var dropDate =
                                    DateTime.parse(data.endDate.toString());
                                dropDate != null
                                    ? controller.toDate.value = dropDate
                                    : controller.toDate.value = pickUpDate;

                                controller.getPmTaskListByDate();
                                controller.openFromDateToStartDatePicker =
                                    !controller.openFromDateToStartDatePicker;
                                controller
                                    .update(['PreventiveMaintenanceTask']);

                                // Get.toNamed(
                                //   Routes.stockManagementGoodsOrdersScreen,
                                // );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
        });
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
                  contentPadding: EdgeInsets.fromLTRB(
                      5, 0, 5, 0), // Reduced vertical padding
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
}

class PmTaskDataSource extends DataTableSource {
  final PreventiveMaintenanceTaskController controller;

  late List<PmTaskListModel?> filteredPmTaskList;

  PmTaskDataSource(this.controller) {
    filterpmTasks();
  }

  ///
  void filterpmTasks() {
    filteredPmTaskList = <PmTaskListModel?>[];
    filteredPmTaskList = controller.pmTaskList.where((pmTask) {
      return (pmTask?.id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (pmTask?.plan_title ?? '')
              .toLowerCase()
              .contains(controller.titleFilterText.value.toLowerCase()) &&
          (pmTask?.last_done_date ?? '').toString().toLowerCase().contains(
              controller.lastDoneDateFilterText.value.toLowerCase()) &&
          (pmTask?.due_date ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.dueDateFilterText.value.toLowerCase()) &&
          (pmTask?.done_date ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.doneDateFilterText.value.toLowerCase()) &&
          (pmTask?.frequency_name ?? '')
              .toLowerCase()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (pmTask?.assigned_to_name ?? '')
              .toLowerCase()
              .contains(controller.assignFilterText.value.toLowerCase()) &&
          (pmTask?.permit_code ?? '')
              .toLowerCase()
              .contains(controller.ptwFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final pmTaskDetails = filteredPmTaskList[index];

    controller.pmTaskId.value = pmTaskDetails?.id ?? 0;
    var cellsBuffer = [
      "pmTaskId", // '${pmTaskDetails?.id ?? ''}',
      '${pmTaskDetails?.plan_title ?? ''}',
      '${pmTaskDetails?.last_done_date ?? ''}',
      '${pmTaskDetails?.due_date ?? ''}',
      '${pmTaskDetails?.done_date ?? ''}',
      '${pmTaskDetails?.frequency_name ?? ''}',
      '${pmTaskDetails?.assigned_to_name ?? ''}',
      '${pmTaskDetails?.permit_code ?? ''}',
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
            child: (value == 'pmTaskId')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${pmTaskDetails?.id}',
                      ),
                      Dimens.boxHeight5,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                            color:
                                //  controller.pmTaskList
                                //             .firstWhere(
                                //               (e) =>
                                //                   e?.Task_id ==
                                //                   pmTaskDetails?.Task_id,
                                //               orElse: () =>
                                //                   PmTaskListModel(Task_id: 00),
                                //             )
                                //             ?.status_id ==
                                //         406
                                //     ? ColorValues.rejectedStatusColor
                                //     : controller.pmTaskList
                                //                 .firstWhere(
                                //                   (e) =>
                                //                       e?.Task_id ==
                                //                       pmTaskDetails?.Task_id,
                                //                   orElse: () =>
                                //                       PmTaskListModel(Task_id: 00),
                                //                 )
                                //                 ?.status_id ==
                                //             401
                                //         ? ColorValues.appLightBlueColor
                                //         : controller.pmTaskList
                                //                     .firstWhere(
                                //                       (e) =>
                                //                           e?.Task_id ==
                                //                           pmTaskDetails?.Task_id,
                                //                       orElse: () => PmTaskListModel(
                                //                           Task_id: 00),
                                //                     )
                                //                     ?.status_id ==
                                //                 405
                                //             ? ColorValues.approveStatusColor
                                //             :
                                ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${pmTaskDetails?.status_short}${pmTaskDetails?.status}',
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
                          message: 'View',
                          onPress: () {
                            final _flutterSecureStorage =
                                const FlutterSecureStorage();

                            _flutterSecureStorage.delete(key: "pmTaskId");
                            int pmTaskId = pmTaskDetails?.id ?? 0;
                            if (pmTaskId != 0) {
                              Get.toNamed(Routes.pmTaskView,
                                  arguments: {'pmTaskId': pmTaskId});
                            }
                          },
                        ),
                        TableActionButton(
                          color: ColorValues.appGreenColor,
                          icon: Icons.remove_red_eye_outlined,
                          message: 'Execute',
                          onPress: () {
                            final _flutterSecureStorage =
                                const FlutterSecureStorage();

                            _flutterSecureStorage.delete(key: "pmTaskId");
                            int pmTaskId = pmTaskDetails?.id ?? 0;
                            if (pmTaskId != 0) {
                              Get.toNamed(Routes.pmExecution,
                                  arguments: {'pmTaskId': pmTaskId});
                            }
                          },
                        ),
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "pmTaskId");
        int pmTaskId = pmTaskDetails?.id ?? 0;
        if (pmTaskId != 0) {
          Get.toNamed(Routes.pmTaskView, arguments: {'pmTaskId': pmTaskId});
        }
      },
    );
  }

  @override
  int get rowCount => filteredPmTaskList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
