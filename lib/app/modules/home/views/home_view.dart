import 'package:employee_system2/app/data/clipPath.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:employee_system2/app/modules/ClockIn/views/clock_in_view.dart';
import 'package:employee_system2/app/modules/ClockOut/views/clock_out_view.dart';
import 'package:employee_system2/app/modules/mainScreen/views/main_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //
  DateTime currentTime = DateTime.now();
  late String formatJam;
  late String formatTgl;

  @override
  void initState() {
    super.initState();

    var timeFormatter = DateFormat.Hm();
    var dateFormatter = DateFormat.MMMEd().add_y();
    formatJam = timeFormatter.format(currentTime);
    formatTgl = dateFormatter.format(currentTime);

    print('Sekarang pukul: $formatJam');
    print('Sekarang Tanggal: $formatTgl');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                // First ClipPath
                ClipPath(
                  clipper: FirstHomeClipper(),
                  child: Container(
                    width: Get.width,
                    height: 60.0.h,
                    color: mainColor,
                  ),
                ),
                // Second ClipPath
                ClipPath(
                  clipper: SecondHomeClipper(),
                  child: Container(
                    width: Get.width,
                    height: 25.0.h,
                    color: secondColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0.h),
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: 8.h,
                        // decoration: BoxDecoration(color: blackColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF04648),
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 2.0.w,
                            // ),
                            Container(
                              width: 60.w,
                              height: 6.h,
                              // decoration: BoxDecoration(color: secondColor),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Jacob Jones',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '12345678 - Junior UX Designer',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 12.sp,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAll(MainScreenView());
                              },
                              child: Icon(
                                Icons.logout,
                                size: 8.0.w,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        width: Get.width,
                        height: 50.0.h,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            5.w, //kanan
                            4.h, //atas
                            5.w, //kiri
                            4.h, //bawah
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Live Attendance',
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                '$formatJam',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                '$formatTgl',
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Divider(
                                color: Colors.grey.shade700,
                                endIndent: 3.0.h,
                                indent: 3.0.h,
                                height: 2.0.h,
                                // thickness: 1.5, //ketebalan
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Text(
                                'Office Hours',
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                '08:00 AM -  05:00 PM',
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.to(ClockInView());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      minimumSize: Size(
                                        38.w, //panjang
                                        6.h, //tinggi
                                      ),
                                    ),
                                    child: Text(
                                      'Clock In',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.5.w,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.to(ClockOutView());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: mainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      minimumSize: Size(
                                        38.w, //panjang
                                        6.h, //tinggi
                                      ),
                                    ),
                                    child: Text(
                                      'Clock Out',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Task',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Container(
                        width: Get.width,
                        height: 15.h,
                        decoration: BoxDecoration(color: greyColor),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Pengunguman',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.w,
                      ),
                      Container(
                        width: Get.width,
                        height: 15.h,
                        decoration: BoxDecoration(color: greyColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
