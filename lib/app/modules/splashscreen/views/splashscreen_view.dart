import 'package:employee_system2/app/data/colors.dart';
import 'package:employee_system2/app/modules/home/views/home_view.dart';
import 'package:employee_system2/app/modules/login/views/login_view.dart';
import 'package:employee_system2/app/modules/mainScreen/views/main_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  @override
  void initState() {
    super.initState();
    SplashscreenStart();
  }

  SplashscreenStart() async {
    await Future.delayed(Duration(seconds: 3));

    Get.offAll(MainScreenView());
    // Get.offAll(LoginView());
    // Get.offAll(MainPageView());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
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
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 240,
    );
    path.lineTo(size.width, 0);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
