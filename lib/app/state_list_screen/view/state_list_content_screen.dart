import 'package:cmms/app/pm_schedule/view/pm_schedule_content_web.dart';
import 'package:cmms/app/state_list_screen/view/state_list_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../state_list_controller.dart';

class StateListScreen extends GetView<StateListController> {
  StateListScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('PM Schedule'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
              Expanded(
                child: Column(
                  children: [
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: StateListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
