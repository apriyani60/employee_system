import 'package:employee_system2/app/modules/pengajuan/views/pengajuan_absensi_view.dart';
import 'package:employee_system2/app/modules/pengajuan/views/pengajuan_lembur_view.dart';
import 'package:employee_system2/app/modules/pengajuan/views/perubahan_shift_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:employee_system2/app/data/clipPath.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:employee_system2/app/data/itemMenu.dart';
import 'package:employee_system2/app/modules/pengajuan/controllers/pengajuan_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:employee_system2/app/modules/pengajuan/views/pengajuan_cuti_view.dart';
import 'package:employee_system2/app/modules/pengajuan/views/reimbursement_view.dart';

class PengajuanView extends StatefulWidget {
  const PengajuanView({super.key});
  @override
  State<PengajuanView> createState() => _PengajuanViewState();
}

class _PengajuanViewState extends State<PengajuanView> {
  final pengajuanController = Get.put(PengajuanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0.0,
        title: Text(
          'Pengajuan',
          style: TextStyle(
            color: whiteColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: PengajuanClipper(),
                child: Container(
                  width: Get.width,
                  height: 18.0.h,
                  color: mainColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          5.w, //kanan
                          2.0.h, //atas
                          5.w, //kiri
                          0.h, //bawah
                        ),
                        child: SizedBox(
                          height: 10.0.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildMenuItem('Reimburse', Remix.wallet_3_line,
                                  () {
                                Get.to(ReimbursementView());
                              }),
                              SizedBox(
                                width: 5.0.w,
                              ),
                              _buildMenuItem('Lembur', Icons.access_time, () {
                                Get.to(PengajuanLemburView());
                              }),
                              SizedBox(
                                width: 5.0.w,
                              ),
                              _buildMenuItem(
                                  'Cuti', Icons.edit_calendar_rounded, () {
                                Get.to(PengajuanCutiView());
                              }),
                              SizedBox(
                                width: 5.0.w,
                              ),
                              _buildMenuItem(
                                  'Absensi', Icons.calendar_view_week, () {
                                Get.to(PengajuanAbsensiView());
                              }),
                              SizedBox(
                                width: 5.0.w,
                              ),
                              _buildMenuItem(
                                  'Perubahan Shift', Icons.work_history, () {
                                Get.to(PerubahanShiftView());
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget _buildMenuItem(String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 10.0.h,
        height: 10.0.h,
        // color: greyColor,
        child: Column(
          children: [
            Icon(
              icon,
              size: 3.5.h,
              color: whiteColor,
            ),
            SizedBox(height: 1.5.h),
            Text(
              label,
              style: TextStyle(
                color: whiteColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
