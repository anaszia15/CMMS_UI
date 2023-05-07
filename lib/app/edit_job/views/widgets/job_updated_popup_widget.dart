import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigators/app_pages.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../edit_job_controller.dart';

class JobUpdatedDialog extends GetView<EditJobController> {
  JobUpdatedDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Job Saved',
        textAlign: TextAlign.center,
      ),
      content: Builder(builder: (context) {
        return Container(
          padding: Dimens.edgeInsets05_0_5_0,
          height: Get.height / 6,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Divider(
              color: ColorValues.greyLightColour,
              thickness: 1,
            ),
            Spacer(),
            Text('Job updated for Job Id: ${controller.jobID}'),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                style: Styles.greenElevatedButtonStyle,
                onPressed: () => Get.offAllNamed(Routes.jobList),
                child: const Text('Job List'),
              ),
              Dimens.boxWidth10,
              ElevatedButton(
                style: Styles.yellowElevatedButtonStyle,
                onPressed: () => Get.offAndToNamed(Routes.jobDetails,
                    arguments: {"jobId": controller.jobID.value}),
                child: const Text('View Job'),
              ),
              Dimens.boxWidth10,
              ElevatedButton(
                style: Styles.redElevatedButtonStyle,
                onPressed: () => Get.offAndToNamed(Routes.addJob),
                child: const Text('Add New Job'),
              ),
            ]),
          ]),
        );
      }),
      actions: [],
    );
  }
}
