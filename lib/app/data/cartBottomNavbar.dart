import 'package:employee_system2/app/data/colors.dart';
import 'package:employee_system2/app/modules/pengajuan/controllers/pengajuan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class CartBottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pengajuanController = Get.put(PengajuanController());
    return BottomAppBar(
      child: Container(
        width: 100.w,
        height: 12.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: mainColor,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            // vertical: 1.0.h,
            horizontal: 2.0.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      'Rp ${pengajuanController.formatNumber(pengajuanController.total.toString())}',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text(
                    'Jumlah Total',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //
                },
                icon: Icon(
                  Remix.send_plane_line,
                  color: secondColor,
                ),
                label: Text(
                  'Ajukan',
                  style: TextStyle(
                    color: secondColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(
                    10.w, //panjang
                    6.h, //tinggi
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
