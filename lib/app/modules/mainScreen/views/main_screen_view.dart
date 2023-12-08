import 'package:employee_system2/app/data/clipPath.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:employee_system2/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/main_screen_controller.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: MainScreenClipper(),
            child: Container(
              height: 60.0.h,
              width: Get.width,
              color: secondColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee System',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 19.sp,
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2.0.h),
                        Row(
                          children: [
                            Text(
                              'XYC',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 3.0.w),
                            Text(
                              'Payment',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 30.sp,
                                // fontWeight: FontWeight.w600,
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
          ),
          Padding(
            //start, top, end, bottom
            padding: EdgeInsetsDirectional.fromSTEB(
              10.0.w, //kanan
              72.0.h, //atas
              10.0.w, // kiri
              10.0.h, //bawah
            ),
            child: Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(LoginView());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(
                          90.0.w, //panjang
                          6.0.h, //tinggi
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: OutlinedButton(
                      onPressed: () {
                        //
                      },
                      style: OutlinedButton.styleFrom(
                        primary: whiteColor,
                        side: BorderSide(color: whiteColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(
                          90.0.w, // Panjang
                          6.0.h, // Tinggi
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
