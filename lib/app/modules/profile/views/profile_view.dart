import 'package:employee_system2/app/data/colors.dart';
import 'package:employee_system2/app/modules/task/views/task_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? versionApp;

  @override
  void initState() {
    super.initState();
    getPackage();
  }

  Future<void> getPackage() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionApp = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: blackColor,
            fontSize: 20.sp,
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
            vertical: 3.0.h,
            horizontal: 2.0.w,
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: 12.h,
                    height: 12.h,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundImage: NetworkImage(
                          'https://wallpapers-clan.com/wp-content/uploads/2023/01/anime-aesthetic-boy-pfp-35.jpg'),
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  Text(
                    'Nama Lengkap',
                    style: TextStyle(
                      color: secondColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1.0.h),
                  Text(
                    'Posisi Pekerjaan',
                    style: TextStyle(
                      color: greyTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1.0.h),
                  // Nama Perusahaan
                  Text(
                    'Nama Perusahaan',
                    style: TextStyle(
                      color: greyTextColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 3.0.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     _buildMenuItem('Personal', Icons.person, () {
                  //       Get.to(TaskView());
                  //     }),
                  //     _buildMenuItem('Pendidikan', Icons.school, () {
                  //       print('pendidikan');
                  //     }),
                  //     _buildMenuItem('Pekerjaan', Icons.work_history, () {
                  //       print('Pekerjaan');
                  //     }),
                  //     _buildMenuItem('Peringatan', Icons.warning, () {
                  //       print('Peringatan');
                  //     }),
                  //   ],
                  // ),
                  SizedBox(height: 3.0.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0.w,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Info Saya',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  // Menu Info Personal
                  ListTile(
                    title: Text(
                      'Info Personal',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.person,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  // Menu Info Pendidikan
                  ListTile(
                    title: Text(
                      'Info Pendidikan',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.school,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  // Menu Info Pekerjaan
                  ListTile(
                    title: Text(
                      'Info Pekerjaan',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.work_history,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  // Menu Info Peringatan
                  ListTile(
                    title: Text(
                      'Peringatan',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.warning,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  // Menu Info Keluarga
                  ListTile(
                    title: Text(
                      'Info Keluarga',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.people,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  // Menu Info Payroll
                  ListTile(
                    title: Text(
                      'Info Payroll',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.paypal_rounded,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),

                  // Menu Info Tambahan
                  ListTile(
                    title: Text(
                      'Info Tambahan',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.info,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),

                  // Menu File Saya
                  ListTile(
                    title: Text(
                      'File Saya',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.folder,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),

                  // Menu Asset Saya
                  ListTile(
                    title: Text(
                      'Asset Saya',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.business,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  SizedBox(height: 3.0.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0.w,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Pengaturan',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  // Menu Info Keluarga
                  ListTile(
                    title: Text(
                      'Ubah Password',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.password_rounded,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  // Menu Info Payroll
                  ListTile(
                    title: Text(
                      'PIN',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.pin,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),

                  // Menu Info Tambahan
                  ListTile(
                    title: Text(
                      'Ubah Bahasa',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: Icon(
                      Icons.translate,
                      color: stellGreyColor,
                      size: 4.0.h,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  SizedBox(height: 2.0.h),
                  Text(
                    'Versi Aplikasi: V.' + '${versionApp}',
                    style: TextStyle(
                      color: greyTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 5.h,
            color: mainColor,
          ),
          SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: blackColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
