import 'package:employee_system2/app/data/cartBottomNavbar.dart';
import 'package:employee_system2/app/data/itemMenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:employee_system2/app/modules/inbox/controllers/inbox_controller.dart';

class InboxView extends StatefulWidget {
  String? selectedValue;

  InboxView({Key? key, this.selectedValue}) : super(key: key);

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  final inboxController = Get.put(InboxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2.0.h,
                horizontal: 2.0.h,
              ),
              child: Column(
                children: [
                  Container(
                    width: 90.w,
                    height: 6.h,
                    // color: greyTextColor,
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 1.0.h,
                        horizontal: 2.0.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.do_disturb_on_rounded,
                                  color: whiteColor,
                                  size: 3.5.h,
                                ),
                                SizedBox(
                                  width: 1.0.h,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Telkomsel Prabayar 10.000',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Telkomsel Prabayar 10.000',
                                      style: TextStyle(
                                        color: greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Rp. 10.250',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
