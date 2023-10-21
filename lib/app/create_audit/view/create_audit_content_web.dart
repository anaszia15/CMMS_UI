import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_audit/create_audit_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreateAuditWeb extends StatefulWidget {
  CreateAuditWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAuditWeb> createState() => _CreateAuditWebState();
}

class _CreateAuditWebState extends State<CreateAuditWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAuditController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorValues.whiteColor,
          body: Column(
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
                      child: Text(" / AUDIT", style: Styles.greyMediumLight12),
                    ),
                    Text(" / CREATE AUDIT", style: Styles.greyMediumLight12)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height,
                        child: Card(
                          margin: EdgeInsets.all(20),
                          color: ColorValues.whiteColor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 10, left: 10),
                                      child: Text(
                                        " Create Audit",
                                        style: Styles.blackBold14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Dimens.boxHeight15,
                              Row(
                                children: [
                                  Spacer(),
                                  CustomRichText(title: 'Plan Title :'),
                                  Dimens.boxWidth30,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .3),
                                      child: LoginCustomTextfield(
                                          // textController: controller
                                          //     .planTittleCtrlr,
                                          )),
                                  Spacer()
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  Spacer(),
                                  CustomRichText(title: 'Description :'),
                                  Dimens.boxWidth30,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .3),
                                      child: LoginCustomTextfield(
                                        maxLine: 3,
                                        // textController: controller
                                        //     .planTittleCtrlr,
                                      )),
                                  Spacer()
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  Spacer(),
                                  CustomRichText(title: 'Audit Checklist :'),
                                  Dimens.boxWidth30,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .3),
                                      child: LoginCustomTextfield(
                                          // textController: controller
                                          //     .planTittleCtrlr,
                                          )),
                                  Spacer()
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  Spacer(),
                                  CustomRichText(
                                      title: 'Audit Schedule Date :'),
                                  Dimens.boxWidth30,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .3),
                                      child: LoginCustomTextfield(
                                          // textController: controller
                                          //     .planTittleCtrlr,
                                          )),
                                  Spacer()
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  Spacer(),
                                  CustomRichText(title: 'Audit Frequency :'),
                                  Dimens.boxWidth30,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .3),
                                      child: LoginCustomTextfield(
                                          // maxLine: 3,
                                          // textController: controller
                                          //     .planTittleCtrlr,
                                          )),
                                  Spacer()
                                ],
                              ),
                              Dimens.boxHeight15,
                              Row(
                                children: [
                                  Spacer(),
                                  CustomElevatedButton(
                                    backgroundColor: ColorValues.appRedColor,
                                    text: 'cancel',
                                    onPressed: () {
                                      // controller.AddInventory();
                                    },
                                  ),
                                  Dimens.boxWidth15,
                                  CustomElevatedButton(
                                    backgroundColor: ColorValues.appGreenColor,
                                    text: 'Submit',
                                    onPressed: () {
                                      //     controller.createPmPlan();
                                    },
                                  ),
                                  // Dimens.boxWidth15,
                                  // CustomElevatedButton(
                                  //   backgroundColor: Color(0xff77cae7),
                                  //   text: 'Save as Draft',
                                  //   onPressed: () {
                                  //     // controller.submitPurchaseOrderData();
                                  //   },
                                  // ),
                                  Spacer()
                                ],
                              ),
                              Dimens.boxHeight15,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Dimens.boxHeight40,
            ],
          ),
          //  ),
        );
      },
    );
  }
}
