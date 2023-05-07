import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/models/job_model.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'widgets/job_detail_field.dart';
import 'widgets/job_detail_multi_value_field.dart';
import 'widgets/link_to_permit_table_widget.dart';
import 'widgets/ptw.dart';

class JobDetailsScreen extends GetView<JobDetailsController> {
  JobDetailsScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      body:
          //
          Container(
        child: //
            Container(
          height: Get.height,
          width: Get.width,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeDrawer(),
                Expanded(child: JobDetailsWidgetContent()),
              ]),
        ),
      ),
    );

    /// build ends
  }

  /// class ends
}

class JobDetailsWidgetContent extends GetView<JobDetailsController> {
  JobDetailsWidgetContent({
    super.key,
  });

  ///
  final ButtonStyle editButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Color(0xffc4a278),
  );

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Container(
      height: Get.height,
      color: ColorValues.appBackGroundColor,
      child: //
          Column(//
              children: [
        Card(
          elevation: 25,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorValues.appDarkBlueColor,
              width: 3,
            ),
          ),
          child: //
              Padding(
            padding: Dimens.edgeInsets20,
            child: (controller.jobDetailsModel.value != null)
                ? //
                Obx(
                    () => //
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            //
                            children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //
                              children: [
                                /// LEFT COLUMN
                                Expanded(
                                  child: //
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //
                                          children: [
                                        JobDetailField(
                                          title: 'Job Id',
                                          value: (controller.jobDetailsModel
                                                      .value?.id !=
                                                  null)
                                              ? controller
                                                      .jobDetailsModel.value?.id
                                                      .toString() ??
                                                  ''
                                              : '',
                                        ),
                                        JobDetailField(
                                          title: 'Assigned To',
                                          value: controller.jobDetailsModel
                                                  .value?.assignedName ??
                                              "",
                                        ),
                                        JobDetailField(
                                          title: 'Job Title',
                                          value: controller.jobDetailsModel
                                                  .value?.jobTitle ??
                                              '',
                                        ),
                                        JobDetailField(
                                          title: 'Plant name',
                                          value: controller.jobDetailsModel
                                                  .value?.facilityName ??
                                              '',
                                        ),
                                        JobDetailMultiValueField(
                                          title: 'Equipment Categories',
                                          values: (controller
                                                      .jobDetailsModel
                                                      .value
                                                      ?.equipmentCatList !=
                                                  null)
                                              ? controller.jobDetailsModel.value
                                                  ?.equipmentCatList
                                                  ?.map((item) =>
                                                      (item.equipmentCatName))
                                                  .toList() as List<String>
                                              : [],
                                        ),
                                        JobDetailField(
                                          title: 'Breakdown Type',
                                          value: controller.jobDetailsModel
                                                  .value?.breakdownType ??
                                              '',
                                        ),
                                        JobDetailField(
                                          title: 'Permit ID',
                                          value: (controller.jobDetailsModel
                                                      .value?.currentPtwId !=
                                                  null)
                                              ? controller.jobDetailsModel.value
                                                      ?.currentPtwId
                                                      .toString() ??
                                                  ''
                                              : '',
                                        ),
                                        JobDetailField(
                                          title: 'Standard Action',
                                          value: controller.jobDetailsModel
                                                  .value?.standardAction ??
                                              "",
                                        ),
                                      ]),
                                ),
                                // ),
                                Dimens.boxWidth10,

                                /// RIGHT COLUMN
                                Expanded(
                                  child: //
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //
                                          children: [
                                        JobDetailField(
                                          title: 'Current Status',
                                          value: JobStatusData
                                              .getStatusStringFromInt(controller
                                                  .jobDetailsModel
                                                  .value
                                                  ?.status),
                                        ),
                                        JobDetailField(
                                          title: 'Raised By',
                                          value: controller.jobDetailsModel
                                                  .value?.createdByName ??
                                              "",
                                        ),
                                        JobDetailField(
                                          title: 'Job Description',
                                          value: controller.jobDetailsModel
                                                  .value?.jobTitle ??
                                              '',
                                        ),
                                        JobDetailField(
                                          title: 'Block Name',
                                          value: controller.jobDetailsModel
                                                  .value?.blockName ??
                                              '',
                                        ),
                                        JobDetailMultiValueField(
                                          title: 'Working Area/Equipments',
                                          values: (controller.jobDetailsModel
                                                      .value?.workingAreaList !=
                                                  null)
                                              ? controller.jobDetailsModel.value
                                                  ?.workingAreaList
                                                  ?.map(
                                                    (item) =>
                                                        (item.workingAreaName),
                                                  )
                                                  .toList() as List<String>
                                              : [],
                                        ),
                                        JobDetailMultiValueField(
                                          title: 'Work Type',
                                          values: (controller.jobDetailsModel
                                                      .value?.workType !=
                                                  null)
                                              ? controller.jobDetailsModel.value
                                                  ?.workType
                                                  ?.map((item) => (item))
                                                  .toList() as List<String>
                                              : [],
                                        ),
                                        JobDetailField(
                                          title: 'Site Permit No.',
                                          value: controller
                                                  .jobDetailsModel
                                                  .value
                                                  ?.associatedPermitList
                                                  ?.first
                                                  .sitePermitNo
                                                  .toString() ??
                                              "",
                                        ),
                                      ]),
                                ),
                              ]),

                          /// ASSIGN/RE-ASSIGN BUTTON

                          if (controller.jobDetailsModel.value?.assignedId ==
                              0) ...[
                            ElevatedButton(
                              style: editButtonStyle,
                              onPressed: () => controller.editJob(),
                              child: Text('Assign'),
                            )
                          ] //
                          else if ((controller
                                      .jobDetailsModel.value?.assignedId ??
                                  0) >
                              0) ...[
                            ElevatedButton(
                              style: editButtonStyle,
                              onPressed: () => controller.editJob(),
                              child: Text(
                                'Re-Assign',
                              ),
                            ),
                          ],
                        ]),
                  )
                : Dimens.box0,
          ),
        ),

        /// ASSOCIATED PERMITS TABLE
        (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? Padding(
                padding: Dimens.edgeInsets10_0_10_0,
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Permits',
                    ),
                  ),
                  for (var associatedPermit
                      in controller.associatedPermitList ?? [])
                    PTWCardWidget(associatedPermit: associatedPermit),
                ]),
              )
            : Container(),

        Expanded(child: LinkToPermitTableWidget())
      ]),
    );
  }
}
