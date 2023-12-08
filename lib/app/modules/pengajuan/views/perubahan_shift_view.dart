import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:employee_system2/app/data/dateTimeStyle.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class PerubahanShiftView extends StatefulWidget {
  const PerubahanShiftView({super.key});

  @override
  State<PerubahanShiftView> createState() => _PerubahanShiftViewState();
}

class _PerubahanShiftViewState extends State<PerubahanShiftView> {
  List<File> files = [];

  //DateTime
  DateTime currentTime = DateTime.now();
  late String formatTgl;

  @override
  void initState() {
    super.initState();

    var dateFormatter = DateFormat.d().add_MMM().add_y();
    formatTgl = dateFormatter.format(currentTime);
  }

  //Tambahkan File
  getMultipleFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> pickedFiles = result.paths.map((path) => File(path!)).toList();
      setState(() {
        files.addAll(pickedFiles);

        print('berhasil upload File');
      });
    } else {
      // membatalkan memilih file
      print('Batal memilih File');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        title: Text(
          'Perubahan Shift',
          style: TextStyle(
            color: secondColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 3.h, color: secondColor),
        ),
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2.0.h,
                horizontal: 3.0.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal Perubahan Shift',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  TextField(
                    readOnly: true,
                    onTap: () async {
                      DateTime? newDateTime = await showRoundedDatePicker(
                        context: context,
                        theme: DatePickerThemes.DatePickerStyles(),
                        textNegativeButton: "Batal",
                        textPositiveButton: "OK",
                      );
                      if (newDateTime != null) {
                        setState(() {
                          formatTgl = DateFormat.d()
                              .add_MMM()
                              .add_y()
                              .format(newDateTime);
                        });
                        print('Tangal Reimbursement : ${formatTgl}');
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1.0.h,
                        horizontal: 2.0.w,
                      ),
                      filled: true,
                      fillColor: greyColor,
                      prefixIcon: Icon(
                        Remix.calendar_2_fill,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      suffixIcon: Icon(
                        Icons.unfold_more,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      hintText: formatTgl,
                      hintStyle: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
                  SizedBox(height: 3.0.h),
                  Text(
                    'Shift Saat Ini',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  TextField(
                    readOnly: true,
                    onTap: () async {
                      //
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1.0.h,
                        horizontal: 2.0.w,
                      ),
                      filled: true,
                      fillColor: greyColor,
                      prefixIcon: Icon(
                        Icons.work_history,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.unfold_more,
                      //   size: 4.h,
                      //   color: greyTextColor,
                      // ),
                      hintText: 'N(09:00-17:00)',
                      hintStyle: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
                  SizedBox(height: 3.0.h),
                  Text(
                    'Shift Baru',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  TextField(
                    readOnly: true,
                    onTap: () async {
                      //
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1.0.h,
                        horizontal: 2.0.w,
                      ),
                      filled: true,
                      fillColor: greyColor,
                      prefixIcon: Icon(
                        Icons.work_history,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.unfold_more,
                      //   size: 4.h,
                      //   color: greyTextColor,
                      // ),
                      hintText: 'Pilih Shift Baru',
                      hintStyle: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
                  SizedBox(height: 3.0.h),
                  Text(
                    'Keterangan',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1.0.h,
                        horizontal: 2.0.w,
                      ),
                      filled: true,
                      fillColor: greyColor,
                      prefixIcon: Icon(
                        Remix.draft_line,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      hintText: 'Detail',
                      hintStyle: TextStyle(
                        color: greyTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
                  SizedBox(height: 3.0.h),
                  Text(
                    'Unggah File',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    color: blackColor,
                    strokeWidth: 3,
                    dashPattern: [10, 4],
                    child: Row(
                      children: [
                        Container(
                          height: 15.0.h,
                          width: 27.0.w,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  getMultipleFile();
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.0.h),
                                        child: Image.asset(
                                          height: 7.0.h,
                                          width: 7.0.h,
                                          'assets/images/upload.png',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Tambahkan File',
                                      style: TextStyle(
                                        color: greyTextColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 15.0.h,
                          width: 65.0.w,
                          decoration: BoxDecoration(
                            // color: greyColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: files.length,
                            itemBuilder: (context, index) {
                              File file = files[index];
                              return ListTile(
                                // leading: Container(
                                //   width: 5.0.h,
                                //   height: 5.0.h,
                                //   color: greyColor,
                                // ),
                                title: Text(
                                  file.path
                                      .split('/')
                                      .last, // Menampilkan nama file
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    // Implementasi penghapusan file di sini
                                    setState(() {
                                      files.removeAt(index);
                                    });
                                  },
                                  child: Icon(
                                    Icons.do_disturb_on_rounded,
                                    color: secondColor,
                                    size: 3.5.h,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.0.h),
                  ElevatedButton.icon(
                    onPressed: () {
                      //
                    },
                    icon: Icon(Remix.send_plane_line),
                    label: Text(
                      "Kirim Pengajuan",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(
                        90.w, //panjang
                        6.h, //tinggi
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
