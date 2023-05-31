// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/edit_warranty_claim/edit_warranty_claim_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/new_warranty_claim_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class EditWarrantyClaimWeb extends GetView<EditWarrantyClaimController> {
  EditWarrantyClaimWeb({super.key});

  bool valuefirst = false;

  // final controller = Get.find<HomeController>();
  final EditWarrantyClaimController controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: HeaderWidget(),
          elevation: 0,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
        ),
        body: Row(
          children: [
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens.box0
                : HomeDrawer(),
            Expanded(
              child: Center(
                child: Container(
                  margin: Dimens.edgeInsets16,
                  height: Get.height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Color.fromARGB(255, 227, 224, 224),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 236, 234, 234)
                                    .withOpacity(0.5),
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
                                "Dashboard",
                                style: Styles.greyLight14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(" / Warranty Claim List",
                                    style: Styles.greyMediumLight12),
                              ),
                              Text(" / Edit Warranty Claim",
                                  style: Styles.greyMediumLight12)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomAppBar(
                          title: 'Edit Warranty Claim'.tr,
                        ),
                        Dimens.boxHeight10,
                        Wrap(
                          children: [
                            GetBuilder<EditWarrantyClaimController>(
                                id: 'block_field',
                                builder: (controller) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextField(
                                            label: 'Warranty Claim Title: *',
                                            hintText:
                                                '${controller.editWarrantyClaimDetailsModel.value?.warranty_claim_title}',
                                            maxLine: 2,
                                            textController: controller
                                                .warrantyClaimTitleTextController,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomTextField(
                                              label:
                                                  'Warranty Brief Description: *',
                                              hintText:
                                                  '${controller.editWarrantyClaimDetailsModel.value?.warranty_description}',
                                              textController: controller
                                                  .warrantyClaimBriefDescTextController,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomRichText(
                                                  title:
                                                      'Equipment Categories: '),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.8,
                                                child:
                                                    //     CustomMultiSelectDialogField(
                                                    //   buttonText:
                                                    //       'Select Equipment Categories',
                                                    //   title: 'Equipment Categories',
                                                    //   // initialValue: [],
                                                    //   initialValue: (controller
                                                    //           .selectedEquipmentCategoryIdList
                                                    //           .isNotEmpty)
                                                    //       ? controller
                                                    //           .selectedEquipmentCategoryIdList
                                                    //       : [],
                                                    //   items: controller
                                                    //       .equipmentCategoryList
                                                    //       .map(
                                                    //         (equipmentCategory) =>
                                                    //             MultiSelectItem(
                                                    //           equipmentCategory?.id,
                                                    //           equipmentCategory
                                                    //                   ?.name ??
                                                    //               '',
                                                    //         ),
                                                    //       )
                                                    //       .toList(),
                                                    //   onConfirm:
                                                    //       (selectedOptionsList) => {
                                                    //     controller
                                                    //         .equipmentCategoriesSelected(
                                                    //             selectedOptionsList),
                                                    //     print(
                                                    //         'Equipment category list ${controller.selectedEquipmentCategoryIdList}')
                                                    //   },
                                                    //   // items: [],
                                                    // ),
                                                    Obx(
                                                  () => DropdownWidget(
                                                    dropdownList: controller
                                                        .equipmentCategoryList,
                                                    isValueSelected: controller
                                                        .isEquipmentCategorySelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedEquipmentCategory
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              CustomRichText(
                                                  title: 'Equipment Name: '),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              // Text("${controller.inventoryNameList.length}"),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.8,
                                                child: Obx(
                                                  () => DropdownWidget(
                                                    dropdownList: controller
                                                        .eqipmentNameList,
                                                    isValueSelected: controller
                                                        .isEquipmentNameSelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedEquipmentName
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),

                                                // LoginCustomTextfield(),
                                              ),

                                              // SizedBox(

                                              //   width: MediaQuery.of(context)
                                              //           .size
                                              //           .width /
                                              //       3.8,
                                              //   child:
                                              //       CustomMultiSelectDialogField(
                                              //         buttonText: 'Select Equipment Name',
                                              //         title: 'Equipment Name',
                                              //     // initialValue: [],
                                              //     initialValue: (
                                              //       controller
                                              //             .selectedEquipmentCategoryIdList
                                              //             .isNotEmpty)
                                              //         ? controller
                                              //             .selectedEquipmentCategoryIdList
                                              //         : [],
                                              //     items: controller
                                              //         .equipmentCategoryList
                                              //         .map(
                                              //           (equipmentCategory) =>
                                              //               MultiSelectItem(
                                              //             equipmentCategory?.id,
                                              //             equipmentCategory?.name ??
                                              //                 '',
                                              //           ),
                                              //         )
                                              //         .toList(),
                                              //     onConfirm:
                                              //         (selectedOptionsList) => {
                                              //       controller
                                              //           .equipmentCategoriesSelected(
                                              //               selectedOptionsList),
                                              //       print(
                                              //           'Equipment list ${controller.equipmentCategoryList}')
                                              //     },
                                              //     // items: [],
                                              //   ),
                                              // ),

                                              // SizedBox(
                                              //      width: MediaQuery.of(context).size.width / 3.8,
                                              //   child: CustomTextField(
                                              //   suffixIcon: Icon(Icons.arrow_drop_down),
                                              //   label: 'Equipment Name *',
                                              //   textController:
                                              //       controller.parentEquipmentTextController,
                                              //   onTap: () {
                                              //     controller.getEquipmentList(facilityId: '45');
                                              //     Get.defaultDialog(
                                              //       title: 'Equipment Name',
                                              //       content: GetBuilder<HomeController>(
                                              //         id: 'equipment_list',
                                              //         builder: (_controller) {
                                              //           if (controller.equipmentList.isEmpty) {
                                              //             return CircularProgressIndicator
                                              //                 .adaptive();
                                              //           }
                                              //           return Container(
                                              //             height: Get.height * .4,
                                              //             decoration: BoxDecoration(
                                              //               borderRadius:
                                              //                   BorderRadius.circular(8),
                                              //             ),
                                              //             child: SingleChildScrollView(
                                              //               child: Column(
                                              //                 children: [
                                              //                   ...List.generate(
                                              //                     controller.equipmentList.length,
                                              //                     (index) => ListTile(
                                              //                       onTap: () {
                                              //                         _controller.onSelectEquipment(
                                              //                             _controller.equipmentList[index]);
                                              //                         Get.back();
                                              //                       },
                                              //                       title: Text(
                                              //                           '${_controller.equipmentList[index].name}'),
                                              //                     ),
                                              //                   ).toList(),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           );
                                              //         },
                                              //       ),
                                              //     );
                                              //   },
                                              //                             ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      ///Affected Part
                                      SizedBox(
                                        height: 220,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: Center(
                                          child: Container(
                                            margin: Dimens.edgeInsets16,
                                            height: Get.height,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(.3)),
                                            ),
                                            constraints: BoxConstraints(
                                              maxWidth: 1100,
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  CustomAppBar(
                                                    title: 'Affected Part'.tr,
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Wrap(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 150),
                                                        child: Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Select Affected Part: '),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  3.8,
                                                              child: Obx(
                                                                () =>
                                                                    DropdownWidget(
                                                                  dropdownList:
                                                                      controller
                                                                          .affectedPartEqipmentNameList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isAffectedPartSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedAffectedPart
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueChanged,
                                                                ),
                                                              ),
                                                              //     CustomMultiSelectDialogField(
                                                              //   buttonText:
                                                              //       'Affected parts',
                                                              //   title:
                                                              //       'Select Affected Part',
                                                              //   initialValue: (controller
                                                              //           .selectedAffectedPartEquipmentIdList
                                                              //           .isNotEmpty)
                                                              //       ? controller
                                                              //           .selectedAffectedPartEquipmentIdList
                                                              //       : [],
                                                              //   items: controller
                                                              //       .affectedPartEqipmentNameList
                                                              //       .map(
                                                              //         (equipmentList) =>
                                                              //             MultiSelectItem(
                                                              //           equipmentList
                                                              //               ?.id,
                                                              //           equipmentList?.name ??
                                                              //               '',
                                                              //         ),
                                                              //       )
                                                              //       .toList(),
                                                              //   onConfirm:
                                                              //       (selectedOptionsList) =>
                                                              //           {
                                                              //     controller
                                                              //         .affectedPartSelected(
                                                              //             selectedOptionsList),
                                                              //     print(
                                                              //         'Affected part Equipment Name list ${controller.selectedAffectedPartEquipmentIdList}')
                                                              //   },
                                                              // ),
                                                            ),
                                                            SizedBox(
                                                              width: 100,
                                                            ),
                                                            ActionButton(
                                                              icon:
                                                                  Icons.remove,
                                                              label: 'Delete',
                                                              // onPress:
                                                              //     () async {},
                                                              color: Colors.red,
                                                              onPressed: () {},
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets
                                                      //               .only(
                                                      //           left: 150,
                                                      //           top: 15),
                                                      //   child: Row(
                                                      //     children: [
                                                      //       SizedBox(
                                                      //         width: MediaQuery.of(
                                                      //                     context)
                                                      //                 .size
                                                      //                 .width /
                                                      //             3.8,
                                                      //         child:
                                                      //             CustomMultiSelectDialogField(
                                                      //           buttonText:
                                                      //               'Example_part',
                                                      //           title: 'Parts',
                                                      //           initialValue: [],
                                                      //           onConfirm:
                                                      //               (selectedOptionsList) =>
                                                      //                   {},
                                                      //           items: [],
                                                      //         ),
                                                      //       ),
                                                      //       SizedBox(
                                                      //         width: 30,
                                                      //       ),
                                                      //       ActionButton(
                                                      //         icon:
                                                      //             Icons.remove,
                                                      //         label: 'Delete',
                                                      //         // onPress:
                                                      //         //     () async {},
                                                      //         color: Colors.red,
                                                      //         onPressed: () {},
                                                      //       ),
                                                      //       ActionButton(
                                                      //         icon: Icons.add,
                                                      //         label: 'Add',
                                                      //         // onPress:
                                                      //         //     () async {},
                                                      //         color:
                                                      //             Colors.blue,
                                                      //         onPressed: () {},
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomTextField(
                                            label: 'Failure Date & Time: *',
                                            suffixIcon: Icon(
                                              Icons.calendar_month,
                                            ),
                                            // textController:
                                            //     controller.categoryTextController,
                                            textController: controller
                                                .failureDateTimeCtrlrWeb,

                                            onTap: () {
                                              pickFailureDateTime_web(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomTextField(
                                            label: 'Approximate Daily Loss:*',
                                            // textController:
                                            //     controller.categoryTextController,
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          CustomRichText(title: 'Severity: '),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: 'null',
                                                      onChanged: (value) {}),
                                                  Text(
                                                    'Critical',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: 'null',
                                                      onChanged: (value) {}),
                                                  Text(
                                                    'High',
                                                    style: TextStyle(
                                                        color: Colors.orange),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: 'null',
                                                      onChanged: (index) {}),
                                                  Text(
                                                    'Medium',
                                                    style: TextStyle(
                                                        color: Colors.yellow),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: 'null',
                                                      onChanged: (index) {}),
                                                  Text(
                                                    'Low',
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              CustomTextField(
                                                textController: controller
                                                    .affectedSerialNoTextController,
                                                label: 'Affected Sr.No.:',
                                                hintText:
                                                    '${controller.editWarrantyClaimDetailsModel.value?.affected_sr_no}',
                                              ),
                                              CustomTextField(
                                                readOnly: true,
                                                hintText: 'Justin Fernandez',
                                                label: 'Manufacturer Name:',
                                              ),
                                              CustomTextField(
                                                textController: controller
                                                    .orderReferenceNoTextController,
                                                label:
                                                    'Order/Contract Reference No.:',
                                                hintText: '${controller.editWarrantyClaimDetailsModel.value?.order_reference_number}',
                                              ),
                                              CustomTextField(
                                                textController: controller
                                                    .warrantyStartDateTimeCtrlrWeb,
                                                label: 'Warranty Start Date:',
                                                suffixIcon:
                                                    Icon(Icons.calendar_month),
                                                onTap: () {
                                                  pickWarrantyStartDateTime_web(
                                                      context);
                                                },
                                              ),
                                              CustomTextField(
                                                textController: controller
                                                    .warrantyEndDateTimeCtrlrWeb,
                                                label: 'Warranty End Date:',
                                                suffixIcon:
                                                    Icon(Icons.calendar_month),
                                                onTap: () {
                                                  pickWarrantyEndDateTime_web(
                                                      context);
                                                },
                                              ),
                                              CustomTextField(
                                                textController: controller
                                                    .costOfReplacementTextController,
                                                label: 'Cost of Replacement:',
                                                hintText: '${controller.editWarrantyClaimDetailsModel.value?.cost_of_replacement}',
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),

                                          ///Additional Email
                                          SizedBox(
                                            height: 400,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            child: Center(
                                              child: Container(
                                                margin: Dimens.edgeInsets16,
                                                height: Get.height,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(.3)),
                                                ),
                                                constraints: BoxConstraints(
                                                  maxWidth: 1100,
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      CustomAppBar(
                                                        title:
                                                            'Additional Emails'
                                                                .tr,
                                                      ),
                                                      Dimens.boxHeight10,
                                                      Wrap(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.5,
                                                                child:
                                                                    DefaultTabController(
                                                                  length: 2,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(1.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              45,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(color: Colors.grey),
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(1),
                                                                          ),
                                                                          child:
                                                                              TabBar(
                                                                            labelPadding:
                                                                                EdgeInsets.symmetric(horizontal: 10.0),
                                                                            labelColor:
                                                                                Colors.black,
                                                                            indicator:
                                                                                BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(1)),
                                                                            unselectedLabelColor:
                                                                                Colors.black,
                                                                            tabs: [
                                                                              Tab(
                                                                                child: Text('Employee'),
                                                                              ),
                                                                              Tab(
                                                                                child: Text(
                                                                                  'External Emails',
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            250,
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                2,
                                                                        child: TabBarView(
                                                                            children: [
                                                                              ///First TabBar View
                                                                              Container(
                                                                                  // decoration: BoxDecoration(color: Colors.grey),
                                                                                  child: Column(
                                                                                children: [
                                                                                  SizedBox(
                                                                                    height: 15,
                                                                                  ),
                                                                                  emailDropdown(context, 'Ajit Kumar'),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  emailDropdown(context, 'Sujit Kumar'),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  emailDropdown(context, 'Amit Kumar'),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  emailDropdown(context, 'Joseph Fernandez'),
                                                                                ],
                                                                              )),

                                                                              ////Second TabBar View
                                                                              Center(child: Text('Second Tab'))
                                                                            ]),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                          /// Employee
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Wrap(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 250,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.31,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 15),
                                                  child:
                                                      Text('Equipment Images'),
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 90,
                                                              top: 30),
                                                      child: CircleAvatar(
                                                        radius: 70,
                                                        child: Text(
                                                          'Drop Files Here',
                                                          style: Styles.white13,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
                                                    ),
                                                    ////
                                                    Container(
                                                      height: 100,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    .3)),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 1100,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            CustomAppBar(
                                                              title: '#'.tr,
                                                              action: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  // Text('#'),

                                                                  Text('Name'),
                                                                  Dimens
                                                                      .boxWidth20,
                                                                  Text(
                                                                      'Upload Progress'),
                                                                  Dimens
                                                                      .boxWidth20,
                                                                  Text(
                                                                      'Status'),
                                                                  Dimens
                                                                      .boxWidth20,
                                                                  Text(
                                                                      'Description'),
                                                                  Dimens
                                                                      .boxWidth20,
                                                                  Text(
                                                                      'Remove'),
                                                                  Dimens
                                                                      .boxWidth20,
                                                                ],
                                                              ),
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Wrap(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                        'Files list will appear heres'),
                                                                  ],
                                                                ),
                                                                // Row(
                                                                //   mainAxisAlignment:
                                                                //       MainAxisAlignment.spaceEvenly,
                                                                //   children: [
                                                                //     SizedBox(
                                                                //       width:
                                                                //           MediaQuery.of(context).size.width / 3.8,
                                                                //       child:
                                                                //           CustomMultiSelectDialogField(
                                                                //         initialValue: [],
                                                                //         // initialValue: (
                                                                //         //   controller
                                                                //         //         .selectedEquipmentCategoryIdList
                                                                //         //         .isNotEmpty)
                                                                //         //     ? controller
                                                                //         //         .selectedEquipmentCategoryIdList
                                                                //         //     : [],
                                                                //         // items: controller
                                                                //         //     .equipmentCategoryList
                                                                //         //     .map(
                                                                //         //       (equipmentCategory) =>
                                                                //         //           MultiSelectItem(
                                                                //         //         equipmentCategory?.id,
                                                                //         //         equipmentCategory?.name ??
                                                                //         //             '',
                                                                //         //       ),
                                                                //         //     )
                                                                //         //     .toList(),
                                                                //         onConfirm: (selectedOptionsList) => {
                                                                //           // controller
                                                                //           //     .equipmentCategoriesSelected(
                                                                //           //         selectedOptionsList),
                                                                //           // print(
                                                                //           //     'Equipment list ${controller.equipmentCategoryList}')
                                                                //         },
                                                                //         items: [],
                                                                //       ),
                                                                //     ),
                                                                //     ActionButton(
                                                                //       icon:
                                                                //           Icons.remove,
                                                                //       label:
                                                                //           'Delete',
                                                                //       // onPress:
                                                                //       //     () async {},
                                                                //       color:
                                                                //           Colors.red,
                                                                //       onPressed:
                                                                //           () {},
                                                                //     ),
                                                                //   ],
                                                                // )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),
                                      Wrap(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomTextField(
                                                textController: controller
                                                    .immediateCorrectiveActionTextController,
                                                label:
                                                    'Immediate Corrective Action by Buyer: *',
                                                hintText: '${controller.editWarrantyClaimDetailsModel.value?.corrective_action_by_buyer}',
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 210,
                                          ),
                                          CustomTextField(
                                            textController: controller
                                                .requestManufactureTextController,
                                            label: 'Request to Manufacturer: *',
                                            hintText: '${controller.editWarrantyClaimDetailsModel.value?.request_to_supplier}',
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomRichText(
                                              title: 'Select Currency Unit: '),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            child: Obx(
                                              () => DropdownWidget(
                                                dropdownList:
                                                    controller.unitCurrencyList,
                                                isValueSelected: controller
                                                    .isUnitCurrencySelected
                                                    .value,
                                                selectedValue: controller
                                                    .selectedUnitCurrency.value,
                                                onValueChanged:
                                                    controller.onValueChanged,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      ////Supplier Name
                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: 53,
                                      //     ),
                                      //     CustomRichText(
                                      //         title: 'Supplier Name: '),
                                      //     SizedBox(
                                      //       width: 5,
                                      //     ),
                                      //     // Text("${controller.supplierNameList.length}"),
                                      //     SizedBox(
                                      //       width: MediaQuery.of(context)
                                      //               .size
                                      //               .width /
                                      //           3.8,
                                      //       child: Obx(
                                      //         () => DropdownWidget(
                                      //           dropdownList:
                                      //               controller.supplierNameList,
                                      //           isValueSelected: controller
                                      //               .isSupplierNameSelected
                                      //               .value,
                                      //           selectedValue: controller
                                      //               .selectedInventory.value,
                                      //           onValueChanged:
                                      //               controller.onValueChanged,
                                      //         ),
                                      //       ),

                                      //       // //   // LoginCustomTextfield(),
                                      //     ),
                                      //     //   SizedBox(
                                      //     //     width: MediaQuery.of(context).size.width / 3.8,

                                      //     //     child:
                                      //     //     // Obx(
                                      //     //     //   () =>
                                      //     // DropdownWidget(
                                      //     //   // dropdownList: controller.supplierNameList,
                                      //     //   // isValueSelected: controller.isSupplierNameSelected.value,
                                      //     //   // selectedValue: controller.selectedSupplier.value,
                                      //     //   onValueChanged:controller.onValueChanged,

                                      //     // ),

                                      //     //     // ),

                                      //     // //   //   // LoginCustomTextfield(),
                                      //     //  ),

                                      //     // SizedBox(
                                      //     //   width: MediaQuery.of(context).size.width / 3.8,
                                      //     //   child:
                                      //     //   Obx(
                                      //     //     () =>
                                      //     // DropdownWidget(
                                      //     //   dropdownList: controller.supplierNameList,
                                      //     //   isValueSelected: controller.isSupplierNameSelected.value,
                                      //     //   selectedValue: controller.selectedSupplier.value,
                                      //     //   onValueChanged:controller.onValueChanged,

                                      //     // ),

                                      //     //   ),

                                      //     // ),

                                      //   ],
                                      // ),

                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                    ],
                                  );
                                  // CustomTextField(
                                  //   label: 'Block: *',
                                  //   textController:
                                  //       controller.blockTextController,
                                  //   readOnly: true,
                                  //   onTap: () {
                                  //     controller.getBlockList('45');
                                  //     Get.defaultDialog(
                                  //       title: 'Block List',
                                  //       content: GetBuilder<HomeController>(
                                  //         id: 'block_list',
                                  //         builder: (_controller) {
                                  //           if (controller.blockList.isEmpty) {
                                  //             return Dimens.box0;
                                  //           }
                                  //           return Container(
                                  //             height: Get.height * .4,
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(8),
                                  //             ),
                                  //             child: SingleChildScrollView(
                                  //               child: Column(
                                  //                 children: [
                                  //                   ...List.generate(
                                  //                     controller
                                  //                         .blockList.length,
                                  //                     (index) => ListTile(
                                  //                       onTap: () {
                                  //                         _controller.onSelectBlock(
                                  //                             _controller
                                  //                                     .blockList[
                                  //                                 index]);
                                  //                         Get.back();
                                  //                       },
                                  //                       title: Text(
                                  //                           '${_controller.blockList[index].name}'),
                                  //                     ),
                                  //                   ).toList(),
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           );
                                  //         },
                                  //       ),
                                  //     );
                                  //   },
                                  // );
                                }),
                            // Row(
                            //   children: [
                            //     CustomTextField(
                            //       label: 'Order/Contract Reference Number: *',
                            //       // textController:
                            //       //     controller.parentEquipmentTextController,
                            //       // readOnly: true,
                            //       onTap: () {
                            //         // controller.getEquipmentList(facilityId: '45');
                            //         // Get.defaultDialog(
                            //         //   title: 'Equipment List',
                            //         //   content: GetBuilder<HomeController>(
                            //         //     id: 'equipment_list',
                            //         //     builder: (_controller) {
                            //         //       if (controller.equipmentList.isEmpty) {
                            //         //         return CircularProgressIndicator
                            //         //             .adaptive();
                            //         //       }
                            //         //       return Container(
                            //         //         height: Get.height * .4,
                            //         //         decoration: BoxDecoration(
                            //         //           borderRadius:
                            //         //               BorderRadius.circular(8),
                            //         //         ),
                            //         //         child: SingleChildScrollView(
                            //         //           child: Column(
                            //         //             children: [
                            //         //               ...List.generate(
                            //         //                 controller.equipmentList.length,
                            //         //                 (index) => ListTile(
                            //         //                   onTap: () {
                            //         //                     _controller.onSelectEquipment(
                            //         //                         _controller
                            //         //                                 .equipmentList[
                            //         //                             index]);
                            //         //                     Get.back();
                            //         //                   },
                            //         //                   title: Text(
                            //         //                       '${_controller.equipmentList[index].name}'),
                            //         //                 ),
                            //         //               ).toList(),
                            //         //             ],
                            //         //           ),
                            //         //         ),
                            //         //       );
                            //         //     },
                            //         //   ),
                            //         // );
                            //       },
                            //     ),
                            //   ],
                            // ),
                            // Wrap(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         CustomTextField(
                            //           label: 'Cost Of Replacement: *',
                            //           // textController:
                            //           //     controller.categoryTextController,
                            //         ),

                            //           // CustomMultiSelectDialogField(
                            //           //   buttonText: 'Select Unit Currency',
                            //           //   title: 'Unit Currency',
                            //           //   initialValue: [],
                            //           //   items: [],
                            //           //   onConfirm: (selectedOptionsList) => {},
                            //           // ),
                            //         ),
                            //       ],
                            //     ),

                            //     // Container(
                            //     //   margin: Dimens.edgeInsets16,
                            //     //   width: 100,
                            //     //   color: Colors.black,
                            //     //   child: ActionButton(
                            //     //     label: 'Add',
                            //     //     onPressed: () {},
                            //     //     icon: Icons.add,
                            //     //     color: Colors.blue,
                            //     //   ),
                            //     // )
                            //   ],
                            // ),
                            // CustomTextField(
                            //   label: 'Warranty Start Date: *',
                            //   textController: controller.startDateTimeCtrlr2Web,
                            //   suffixIcon: Icon(
                            //     Icons.calendar_month,
                            //   ),
                            //   onTap: () {
                            //     pickDateTime2_web(context);
                            //   },
                            // ),
                            // CustomTextField(
                            //   label: 'Warranty End Date: *',
                            //   textController: controller.startDateTimeCtrlr3,
                            //   suffixIcon: Icon(
                            //     Icons.calendar_month,
                            //   ),
                            //   onTap: () {
                            //     pickDateTime3_web(context);
                            //   },
                            // ),

                            // CustomTextField(
                            //   label: 'Enter Multiplier: ',
                            //   textController:
                            //       controller.enterMultiplierTextController,
                            // ),

                            // SizedBox(
                            //   height: 400,
                            //   width: MediaQuery.of(context).size.width / 1.2,
                            //   child: Center(
                            //     child: Container(
                            //       margin: Dimens.edgeInsets16,
                            //       height: Get.height,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             color: Colors.grey.withOpacity(.3)),
                            //       ),
                            //       constraints: BoxConstraints(
                            //         maxWidth: 1100,
                            //       ),
                            //       child: SingleChildScrollView(
                            //         child: Column(
                            //           children: [
                            //             CustomAppBar(
                            //               title:
                            //                   'Schedule of Supplier Actions'.tr,
                            //               action: ActionButton(
                            //                 icon: Icons.add,
                            //                 label: 'Add',
                            //                 // onPress:
                            //                 //     () async {},
                            //                 color: Colors.blue,
                            //                 onPressed: () {},
                            //               ),
                            //             ),
                            //             Dimens.boxHeight10,
                            //             Wrap(
                            //               children: [
                            //                 Row(
                            //                   children: [
                            //                     SizedBox(
                            //                       width: 20,
                            //                     ),
                            //                     Text('#'),
                            //                     SizedBox(
                            //                       width: 25,
                            //                     ),
                            //                     Text('Supplier Action'),
                            //                     SizedBox(
                            //                       width: 375,
                            //                     ),
                            //                     Text('Required by Date'),
                            //                     SizedBox(
                            //                       width: 150,
                            //                     ),
                            //                     Text('Action'),
                            //                   ],
                            //                 ),
                            //                 supplierActionData(
                            //                     '1',
                            //                     'Root Cause Analysis Report',
                            //                     context,
                            //                     0),
                            //                 supplierActionData(
                            //                     '2',
                            //                     'Material Replinishment',
                            //                     context,
                            //                     1),
                            //                 supplierActionData(
                            //                     '3',
                            //                     'Preventive Action Plan',
                            //                     context,
                            //                     2),
                            //                 supplierActionData(
                            //                     '4',
                            //                     'Claim Closure Date',
                            //                     context,
                            //                     3)
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            Wrap(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 250,
                                  width:
                                      MediaQuery.of(context).size.width / 1.31,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        child: Text('Attachments'),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 90, top: 30),
                                            child: CircleAvatar(
                                              radius: 70,
                                              child: Text(
                                                'Drop Files Here',
                                                style: Styles.white13,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          ////
                                          Container(
                                            height: 100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(.3)),
                                            ),
                                            constraints: BoxConstraints(
                                              maxWidth: 1100,
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  CustomAppBar(
                                                    title: '#'.tr,
                                                    action: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        // Text('#'),

                                                        Text('Name'),
                                                        Dimens.boxWidth20,
                                                        Text('Upload Progress'),
                                                        Dimens.boxWidth20,
                                                        Text(
                                                            'Document Category'),
                                                        Dimens.boxWidth20,
                                                        Text('Size'),
                                                        Dimens.boxWidth20,
                                                        Text('Remove'),
                                                        Dimens.boxWidth20,
                                                      ],
                                                    ),
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Wrap(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                              'Files list will appear heres'),
                                                        ],
                                                      ),
                                                      // Row(
                                                      //   mainAxisAlignment:
                                                      //       MainAxisAlignment.spaceEvenly,
                                                      //   children: [
                                                      //     SizedBox(
                                                      //       width:
                                                      //           MediaQuery.of(context).size.width / 3.8,
                                                      //       child:
                                                      //           CustomMultiSelectDialogField(
                                                      //         initialValue: [],
                                                      //         // initialValue: (
                                                      //         //   controller
                                                      //         //         .selectedEquipmentCategoryIdList
                                                      //         //         .isNotEmpty)
                                                      //         //     ? controller
                                                      //         //         .selectedEquipmentCategoryIdList
                                                      //         //     : [],
                                                      //         // items: controller
                                                      //         //     .equipmentCategoryList
                                                      //         //     .map(
                                                      //         //       (equipmentCategory) =>
                                                      //         //           MultiSelectItem(
                                                      //         //         equipmentCategory?.id,
                                                      //         //         equipmentCategory?.name ??
                                                      //         //             '',
                                                      //         //       ),
                                                      //         //     )
                                                      //         //     .toList(),
                                                      //         onConfirm: (selectedOptionsList) => {
                                                      //           // controller
                                                      //           //     .equipmentCategoriesSelected(
                                                      //           //         selectedOptionsList),
                                                      //           // print(
                                                      //           //     'Equipment list ${controller.equipmentCategoryList}')
                                                      //         },
                                                      //         items: [],
                                                      //       ),
                                                      //     ),
                                                      //     ActionButton(
                                                      //       icon:
                                                      //           Icons.remove,
                                                      //       label:
                                                      //           'Delete',
                                                      //       // onPress:
                                                      //       //     () async {},
                                                      //       color:
                                                      //           Colors.red,
                                                      //       onPressed:
                                                      //           () {},
                                                      //     ),
                                                      //   ],
                                                      // )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CustomRichText(title: 'Select Approver: '),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.8,
                                    child: Obx(
                                      () => DropdownWidget(
                                        dropdownList: controller.employeeList,
                                        isValueSelected: controller
                                            .isemployeeListSelected.value,
                                        selectedValue: controller
                                            .selectedEmployeeList.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                CustomElevatedButton(
                                  backgroundColor: ColorValues.navyBlueColor,
                                  onPressed: () {},
                                  text: 'Update',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                // CustomElevatedButton(
                                //   backgroundColor: Colors.green,
                                //   onPressed: () {
                                //     // showAlertDialog();
                                //     // controller.createWarrantyClaim();
                                //   },
                                //   text: 'Submit For Release',
                                // ),
                              ],
                            )

                            // Wrap(
                            //   children: [
                            //     Row(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         CustomTextField(
                            //           label: 'Calibration remainder In: ',
                            //           width: 300,
                            //         ),
                            //         Container(
                            //           width: 100,
                            //           child: TextField(
                            //             decoration: InputDecoration(
                            //               contentPadding:
                            //                   Dimens.edgeInsets16_0_16_0,
                            //               focusedBorder: OutlineInputBorder(
                            //                 borderSide: BorderSide(width: .2),
                            //                 borderRadius:
                            //                     BorderRadius.circular(2),
                            //               ),
                            //               enabledBorder: OutlineInputBorder(
                            //                 borderSide: BorderSide(width: .2),
                            //                 borderRadius:
                            //                     BorderRadius.circular(2),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Container(
                            //       margin: Dimens.edgeInsets16,
                            //       child: Row(
                            //         mainAxisSize: MainAxisSize.min,
                            //         children: [
                            //           Text('Calibration cirtificate'),
                            //           Dimens.boxWidth10,
                            //           ActionButton(
                            //             label: 'Upload cirtification file',
                            //             onPressed: () {},
                            //             icon: Icons.file_upload_outlined,
                            //             color: Colors.blue,
                            //           )
                            //         ],
                            //       ),
                            //     )
                            //   ],
                            // ),
                            // Container(
                            //   margin: Dimens.edgeInsets16,
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //       width: 1,
                            //       color: Colors.grey.withOpacity(.3),
                            //     ),
                            //   ),
                            //   child: DefaultTabController(
                            //     length: 3,
                            //     child: Column(
                            //       children: [
                            //         Container(
                            //           color: Colors.grey.withOpacity(.2),
                            //           child: TabBar(
                            //             tabs: [
                            //               Container(
                            //                 height: 40,
                            //                 child: Center(
                            //                   child: Text('Warranties'),
                            //                 ),
                            //               ),
                            //               Container(
                            //                 height: 40,
                            //                 child: Center(
                            //                   child: Text('Purchasing'),
                            //                 ),
                            //               ),
                            //               Container(
                            //                 height: 40,
                            //                 child: Center(
                            //                   child: Text('Files'),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         Container(
                            //           height: 400,
                            //           child: TabBarView(
                            //             children: [
                            //               WarrantyTab(),
                            //               ManufacturarTab(),
                            //               Files(),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // ),
      );

  ///Alert Dialog
  // static void showAlertDialog({
  //   int? facility_id,
  //   String? message,
  //   String? title,
  //   Function()? onPress,
  // }) async {
  //   await Get.dialog<void>(NewWarrantyClaimDialog());
  // }

  /// For Failure Date Time
  Future pickFailureDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedFailureDateTimeWeb.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedFailureDateTimeWeb.value = dateTime;
    controller.failureDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.failureDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print('FailureDateTime:${controller.failureDateTimeCtrlrWeb.text}');
    controller.failureDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedFailureDateTimeWeb.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedFailureDateTimeWeb.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

////Warranty Start Date
  Future pickWarrantyStartDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedWarrantyStartDateTime.value;
    final date = await pickDate2_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime2_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedWarrantyStartDateTime.value = dateTime;
    controller.warrantyStartDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyStartDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Warranty Start Date Time: ${controller.warrantyStartDateTimeCtrlrWeb.text}');
    controller.warrantyStartDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print(
        'Warranty Start Date sending Time: ${controller.warrantyStartDateTimeCtrlrWebBuffer}');
  }

  Future<DateTime?> pickDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedWarrantyStartDateTime.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime2_web(BuildContext context) async {
    DateTime dateTime = controller.selectedWarrantyStartDateTime.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

////Warranty End Date
  Future pickWarrantyEndDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedWarrantyEndDateTime.value;
    final date = await pickDate3_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime3_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedWarrantyEndDateTime.value = dateTime;
    controller.warrantyEndDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyEndDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Warranty End Date Time: ${controller.warrantyEndDateTimeCtrlrWeb.text}');
    controller.warrantyEndDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate3_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedWarrantyEndDateTime.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime3_web(BuildContext context) async {
    DateTime dateTime = controller.selectedWarrantyEndDateTime.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

  supplierActionData(
      String? title, String? title2, BuildContext context, int? position) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$title'),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Container(
                child: Container(
              height: 30,
              width: 40,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
              child: Center(child: Text('$title2')),
            )),
          ),
          Checkbox(
              value: valuefirst,
              onChanged: (bool? value) {
                this.valuefirst = value!;
              }),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.8,
            child: CustomTextField(
              label: '',
            ),
          ),
          // position == 1 || position == 2 || position == 3
          // ?
          ActionButton(
            icon: Icons.remove,
            label: 'Delete',
            // onPress:
            //     () async {},
            color: Colors.red,
            onPressed: () {},
          )
          // : Text('data')
        ],
      ),
    );
  }

  emailDropdown(BuildContext context, String? title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.8,
          child: CustomMultiSelectDialogField(
            buttonText: '$title',
            title: 'Email',
            initialValue: [],
            // initialValue: (
            //   controller
            //         .selectedEquipmentCategoryIdList
            //         .isNotEmpty)
            //     ? controller
            //         .selectedEquipmentCategoryIdList
            //     : [],
            // items: controller
            //     .equipmentCategoryList
            //     .map(
            //       (equipmentCategory) =>
            //           MultiSelectItem(
            //         equipmentCategory?.id,
            //         equipmentCategory?.name ??
            //             '',
            //       ),
            //     )
            //     .toList(),
            onConfirm: (selectedOptionsList) => {
              // controller
              //     .equipmentCategoriesSelected(
              //         selectedOptionsList),
              // print(
              //     'Equipment list ${controller.equipmentCategoryList}')
            },
            items: [],
          ),
        ),
        ActionButton(
          icon: Icons.delete_outline,
          label: 'Delete',
          // onPress:
          //     () async {},
          color: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}