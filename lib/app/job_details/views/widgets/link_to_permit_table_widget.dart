import 'package:cmms/app/app.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../job_details_controller.dart';

class LinkToPermitTableWidget extends StatelessWidget {
  LinkToPermitTableWidget({super.key});

  ///
  final controller = Get.find<JobDetailsController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Container(
      height: 1000,
      // height: Get.height * 0.3,
      child: //
          Obx(
        () => //
            SingleChildScrollView(
          child: Column(
              //
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        ActionButton(
                          label: "Link to Existing Permit",
                          onPressed: () => controller.linkToExistingPermit(),
                          color: ColorValues.appYellowColor,
                        ),
                        ActionButton(
                          label: "Create New Permit",
                          onPressed: () => controller.createNewPermit(),
                          color: ColorValues.appLightBlueColor,
                        ),
                      ],
                    ),
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: //
                Flexible(
                  child: DataTable2(
                    headingRowHeight: Get.height * 0.06,
                    border:
                        TableBorder.all(color: ColorValues.appLightBlueColor),
                    dataRowHeight: Get.height * 0.08,
                    horizontalMargin: 12,
                    columns: [
                      DataColumn(label: Text('Permit To Work')),
                      DataColumn(label: Text('Site Permit No.')),
                      DataColumn(label: Text('Permit Type')),
                      DataColumn(label: Text('Assigned To')),
                      DataColumn(label: Text('Permit Status')),
                      DataColumn(label: Text('Permit Date')),
                      DataColumn(label: Text('Job Card')),
                    ],
                    rows: List<DataRow>.generate(
                      controller.permitDropdownValues.length,
                      (rowIndex) => DataRow(
                        cells: [
                          DataCell(
                            // DropdownWidget(
                            //   controller: controller,
                            //   dropdownList: employeeList,
                            //   isValueSelected: isEmployeeSelected,
                            //   selectedValue: selectedEmployeeName,
                            //   onValueChanged: (list, selectedValueText) {
                            //     final rowIndex = currentIndex;
                            //     controller.onEmployeeSelected(
                            //         selectedValueText, rowIndex);
                            //   },
                            // ),
                            DropdownButtonFormField(
                              items:
                                  controller.associatedPermitList?.map((item) {
                                return DropdownMenuItem(
                                    child: Text(item.permitTypeName ?? ''),
                                    value: item);
                              }).toList(),
                              value: controller.permitDropdownValues[rowIndex],
                              onChanged: (value) => controller.setDropdownValue(
                                  rowIndex, value?.toString() ?? ''),
                            ),
                          ),
                          for (int i = 0; i < 5; i++)
                            DataCell(
                              TextField(
                                controller: controller.textControllers[rowIndex]
                                    [i],
                                onChanged: (value) =>
                                    controller.setTextValue(rowIndex, i, value),
                              ),
                            ),
                          DataCell(
                            TableActionButton(
                              color: ColorValues.appPurpleColor,
                              icon: Icons.add,
                              label: 'Job Card',
                              onPress: () {
                                controller.goToJobCardScreen();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //),
              ]),
        ),
      ),
    );
  }

  ///
}
