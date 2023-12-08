import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  DateTime currentTime = DateTime.now();
  late String formatTgl;
  List<DateTime> daftarTgl = [];

  @override
  void initState() {
    super.initState();

    var dateFormatter = DateFormat.MMM().add_y();
    formatTgl = dateFormatter.format(currentTime);

    // daftarTgl = _listTgl(currentTime);
  }

  // List<DateTime> _listTgl(DateTime selectedDate) {
  //   final int year = selectedDate.year;
  //   final int month = selectedDate.month;
  //   final int daysInMonth = DateTime(year, month + 1, 0).day;
  //   List<DateTime> dates = [];
  //   for (int day = 1; day <= daysInMonth; day++) {
  //     dates.add(DateTime(year, month, day));
  //   }
  //   return dates;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Absensi',
          style: TextStyle(
            color: blackColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2.0.h,
            horizontal: 2.0.h,
          ),
          child: Column(
            children: [
              TextField(
                readOnly: true,
                onTap: () async {
                  DateTime? bulan = await showMonthPicker(
                    context: context,
                    initialDate: currentTime,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2035),
                  );
                  if (bulan != null) {
                    setState(() {
                      formatTgl = DateFormat.MMM().add_y().format(bulan);
                      // daftarTgl = _listTgl(bulan);
                    });
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.calendar,
                    color: greyTextColor,
                    size: 4.0.h,
                  ),
                  hintText: formatTgl,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: greyTextColor,
                    size: 4.0.h,
                  ),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greyTextColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greyTextColor),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: daftarTgl.length,
              //     itemBuilder: (BuildContext context, index) {
              //       return daftarAbsen(daftarTgl[index]);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  //List Tanggal Absen
  // Widget daftarAbsen(DateTime tgl) {
  //   String listTgl = DateFormat('d MMM').format(tgl);
  //   return GestureDetector(
  //     onTap: () {
  //       showModalBottomSheet(
  //         isScrollControlled: true,
  //         context: context,
  //         backgroundColor: whiteColor,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(25),
  //             topRight: Radius.circular(25),
  //           ),
  //         ),
  //         builder: (context) => detailTgl(context),
  //       );
  //       print('Detail Absen');
  //     },
  //     child: Column(
  //       children: [
  //         ListTile(
  //           leading: Text(
  //             listTgl,
  //             style: TextStyle(
  //               color: blackColor,
  //               fontSize: 12.sp,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //           title: Row(
  //             children: [
  //               SizedBox(width: 15.0.w),
  //               Text(
  //                 '08:00',
  //                 style: TextStyle(
  //                   color: blackColor,
  //                   fontSize: 12.sp,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               SizedBox(width: 10.0.w),
  //               Text(
  //                 '17:00',
  //                 style: TextStyle(
  //                   color: blackColor,
  //                   fontSize: 12.sp,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           trailing: Icon(
  //             Icons.arrow_forward_ios,
  //             size: 24,
  //             color: secondColor,
  //           ),
  //         ),
  //         Divider(
  //           color: greyColor,
  //           height: 4.0,
  //           thickness: 2.0,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget detailTgl(BuildContext context) {
    return Container(
      height: 45.0.h, // tinggi BottomSheet
      child: Column(
        children: [
          Container(
            height: 12.0.h, // Tinggi header
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: mainColor),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.0.h,
                    vertical: 2.0.h,
                  ),
                  child: Column(
                    children: [
                      Divider(
                        color: secondColor,
                        endIndent: 15.0.h,
                        indent: 15.0.h,
                        thickness: 5.0, //ketebalan
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              CupertinoIcons.xmark,
                              color: greyColor,
                              size: 4.0.h,
                            ),
                          ),
                          SizedBox(
                            width: 4.0.w,
                          ),
                          Text(
                            'Sel, 26 Oktober 2023',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.0.h,
                    vertical: 2.0.h,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'N(09:00-1700)',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: ListTile(
                          leading: SizedBox(
                            child: Text(
                              '09:00',
                              style: TextStyle(
                                color: greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          title: Text(
                            'Clock In',
                            style: TextStyle(
                              color: greyTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_drop_down,
                            color: greyTextColor,
                            size: 4.0.h,
                          ),
                          tileColor: greyColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: ListTile(
                          leading: SizedBox(
                            child: Text(
                              '17:00',
                              style: TextStyle(
                                color: greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          title: Text(
                            'Clock Out',
                            style: TextStyle(
                              color: greyTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_drop_down,
                            color: greyTextColor,
                            size: 4.0.h,
                          ),
                          tileColor: greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
