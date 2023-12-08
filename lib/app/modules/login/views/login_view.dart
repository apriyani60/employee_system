import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:employee_system2/app/data/clipPath.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:employee_system2/app/navigation_page.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController tUsername = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                ClipPath(
                  clipper: LoginClipper(),
                  child: Container(
                    height: 28.h,
                    width: Get.width,
                    color: mainColor,
                    child: Image.asset(
                      'assets/images/Ellipse.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Text(
                      'Login to your account',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 4.0.h,
                    ),
                    Container(
                      width: 93.w,
                      height: Get.height,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          5.w, //kanan
                          4.h, //atas
                          5.w, //kiri
                          0.h, //bawah
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                            TextField(
                              // keyboardType: TextInputType.emailAddress,
                              minLines: 1,
                              style: TextStyle(color: blackColor),
                              controller: tUsername,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0.h,
                                  horizontal: 2.0.w,
                                ),
                                filled: true,
                                fillColor: greyColor,
                                // hintText: '',
                                // hintStyle: TextStyle(color: greyColor),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                            TextField(
                              keyboardType: TextInputType.visiblePassword,
                              minLines: 1,
                              style: TextStyle(color: blackColor),
                              controller: tpassword,
                              obscureText: isHide,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0.h,
                                  horizontal: 2.0.h,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(isHide
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                  onPressed: () {
                                    setState(
                                      () {
                                        isHide = !isHide;
                                      },
                                    );
                                  },
                                ),
                                filled: true,
                                fillColor: greyColor,
                                // hintText: '',
                                // hintStyle: TextStyle(color: greyColor),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: greyColor),
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Row(
                              children: [
                                // Text(
                                //   'Remember me',
                                //   style: TextStyle(
                                //     color: greyTextColor,
                                //     fontSize: 16.sp,
                                //     fontWeight: FontWeight.w700,
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: 7.0.h,
                                //   height: 2.0.h,
                                // ),
                                TextButton(
                                  onPressed: () {
                                    //
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      color: greyTextColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.offAll(NavigationPage());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                minimumSize: Size(
                                  90.0.w, // Panjang
                                  6.0.h, // Tinggi
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                TextButton(
                                  onPressed: () {
                                    //
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
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
          ],
        ),
      ),
    );
  }
}
