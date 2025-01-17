import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_escalation_matrix/view/web/view_escalation_matrix_content_web.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewEscalationMatrixScreen
    extends GetView<ViewEscalationMatrixController> {
  ViewEscalationMatrixScreen({super.key});
  final controller = Get.find<ViewEscalationMatrixController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer()
              : null,
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
              Expanded(
                child: Column(
                  children: [
                    if (Responsive.isMobile(context))
                      Expanded(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Data Coming Soon......")),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: ViewEscalationMatrixContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
