import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/new_permit_list/widgets/facility_selection_dropdown_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import '../../job_list_controller.dart';
// import '../widgets/facility_selection_dropdown_widget.dart';

class NewPermitListMobile extends GetView<NewPermitListController> {
  NewPermitListMobile({Key? key, this.newPermitListModel}) : super(key: key);

  final NewPermitListModel? newPermitListModel;

  @override
  Widget build(BuildContext context) {
    ///
    return //
        Scaffold(
      body: //
          Container(
                child: 
            Column(
          children: [
            SizedBox(height: 50,),
            //DropDown
             FacilitySelectionDropdownWidget(),
            Expanded(
              child: ListView.builder(
                  //physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.newPermitList != null
                      ? controller.newPermitList?.length
                      : 0,
                  itemBuilder: (context, index) {
                    final newPermitListModel = (controller.newPermitList != null)
                        ? controller.newPermitList![index]
                        : NewPermitListModel();
                    var status = newPermitListModel?.current_status.toString() ?? '';
                    print('Current Status: $status');
                    return GestureDetector(
                      onTap: () {
                        var _newPermitListId = newPermitListModel?.permitId ?? 0;
                        controller.showNewPermitListDetails(_newPermitListId);
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: Colors.lightBlue.shade50,
                          elevation: 10,
                          shadowColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                //
                                children: [
                                  Row(
                                      //
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Permit Id: ${newPermitListModel?.permitId ?? 0}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorValues.navyBlueColor,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: (status.toLowerCase() ==
                                                      "created")
                                                  ? Color(0xff58c3ca)
                                                  : (status.toLowerCase() ==
                                                          "assigned")
                                                      ? Color(0xff58c352)
                                                      : (status.toLowerCase() ==
                                                              "linked")
                                                          ? Color(0xff787099)
                                                          : (status.toLowerCase() ==
                                                                  "in progress")
                                                              ? Color(
                                                                  0xffbf8c4b)
                                                              : (status.toLowerCase() ==
                                                                      "closed")
                                                                  ? Color(
                                                                      0xff3438cd)
                                                                  : (status.toLowerCase() ==
                                                                          "cancelled")
                                                                      ? Color(0xFFBF4844)
                                                                      : Color.fromARGB(
                                                                          255,
                                                                          227,
                                                                          223,
                                                                          108),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            child: Center(
                                              child: Text(
                                                status,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  Row(children: [
                                    Expanded(
                                      child: Text(
                                        'Permit Type Name: ',
                                        style: const TextStyle(
                                          color: ColorValues.blackColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${newPermitListModel?.permitTypeName ?? 'Unassigned'}',
                                        style: const TextStyle(
                                          color: ColorValues.blackColor,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Row(//
                                      children: [
                                    Expanded(
                                      child: Text(
                                         '${newPermitListModel?.workingAreaName ?? ''}',
                                        // 'Not Assigned',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 239, 87, 27),
                                        ),
                                      ),
                                    )
                                  ]),
                                  Row(//
                                      children: [
                                    Expanded(
                                      child: Text(
                                        'Description: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        newPermitListModel?.description ?? '',
                                        style: const TextStyle(),
                                      ),
                                    )
                                  ]),
                                  Row(//
                                      children: [
                                    Expanded(
                                      child: Text(
                                        'Equipment: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        newPermitListModel?.equipment ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ]),
                                  Row(
                                      //
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Work Area Name: ',
                                          style: TextStyle(
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              newPermitListModel?.workingAreaName ?? ''),
                                        ),
                                      ]),
                                  Row(//
                                      children: [
                                    Expanded(
                                      child: Text(
                                        'Approved Time: ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        (newPermitListModel?.approved_datetime != null)
                                            ? DateFormat('dd-MMM-yyyy hh:mm')
                                                .format(
                                                    newPermitListModel!.approved_datetime!)
                                            : '',
                                        style: TextStyle(color: Colors.grey),
                                        // 'Time djhb'
                                      ),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
                ),
              ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addNewPermitList(),
        backgroundColor: ColorValues.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorValues.whiteColor,
        ),
      ),
    );
  }

  ///
}