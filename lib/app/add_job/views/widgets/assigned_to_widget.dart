import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../add_job_controller.dart';
import '../../../widgets/dropdown.dart';

class AssignedToWidget extends StatelessWidget {
  AssignedToWidget({super.key});

  ///
  var controller = Get.find<AddJobController>();

  ///
  @override
  Widget build(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Assigned To: ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
      Dimens.boxHeight5,
      DropdownWidget(
        controller: controller,
        dropdownList: controller.assignedToList,
        isValueSelected: controller.isAssignedToSelected.value,
        selectedValue: controller.selectedAssignedTo.value,
        onValueChanged: controller.onValueChanged,
      ),
      Dimens.boxHeight20,
    ]);
  }
}
