import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:employee_system2/app/data/itemMenu.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class PengajuanCutiView extends StatefulWidget {
  const PengajuanCutiView({Key? key}) : super(key: key);

  @override
  State<PengajuanCutiView> createState() => _PengajuanCutiViewState();
}

class _PengajuanCutiViewState extends State<PengajuanCutiView> {
  final jCuti = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  // File Picker
  List<File> files = [];

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
          'Pengajuan Cuti',
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
                  // Tanggal Cuti
                  Text(
                    'Tanggal Cuti',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  TextField(
                    readOnly: true,
                    onTap: () async {
                      showCustomDateRangePicker(
                        context,
                        dismissible: false,
                        minimumDate:
                            DateTime.now().subtract(const Duration(days: 0)),
                        maximumDate:
                            DateTime.now().add(const Duration(days: 30)),
                        endDate: endDate,
                        startDate: startDate,
                        backgroundColor: whiteColor,
                        primaryColor: mainColor,
                        onApplyClick: (start, end) {
                          setState(() {
                            endDate = end;
                            startDate = start;
                          });
                        },
                        onCancelClick: () {
                          setState(() {
                            endDate = null;
                            startDate = null;
                          });
                        },
                      );
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1.0.h,
                        horizontal: 2.0.w,
                      ),
                      filled: true,
                      fillColor: greyColor,
                      prefixIcon: Icon(
                        Remix.calendar_todo_line,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      suffixIcon: Icon(
                        Icons.unfold_more,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      hintText: (startDate != null && endDate != null)
                          ? '${DateFormat('d MMM y').format(startDate!)} - ${DateFormat('d MMM y').format(endDate!)}'
                          : '',
                      hintStyle: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
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
                  //Jenis Cuti
                  SizedBox(height: 3.0.h),
                  Text(
                    'Jenis Cuti',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  TextField(
                    controller: jCuti,
                    readOnly: true,
                    onTap: () async {
                      final selectedJenisCuti = await showModalBottomSheet(
                        context: context,
                        backgroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        builder: (context) => selectJenisCuti(context),
                      );
                      if (selectedJenisCuti != null) {
                        jCuti.text = selectedJenisCuti;
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
                        Remix.briefcase_2_line,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      suffixIcon: Icon(
                        Icons.unfold_more,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      hintText: '',
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
                  //Deskripsi
                  Text(
                    'Deskripsi Cuti',
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
                      hintText: 'Alasan',
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
                  //Deskripsi
                  Text(
                    'Unggah File',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
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
                  //Delegasi
                  SizedBox(height: 3.0.h),
                  Text(
                    'Delegasi',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
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
                        Icons.person_2_outlined,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      suffixIcon: Icon(
                        Icons.unfold_more,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      hintText: 'Opsional',
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
                  //Jenis Cuti
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
            ),
          ],
        ),
      ),
    );
  }

  Widget selectJenisCuti(BuildContext context) {
    return Container(
      height: 50.0.h, // tinggi BottomSheet
      child: Column(
        children: [
          Container(
            height: 12.0.h, // Tinggi header
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: mainColor,
            ),
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
                            'Pilih Jenis Cuti',
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
          SizedBox(height: 1.5.h),
          Expanded(
            child: Wrap(
              spacing: 2.0.w,
              runSpacing: 0.2.h,
              children: listjenisCuti.map((jenisCuti) {
                return GestureDetector(
                  onTap: () {
                    Get.back(result: jenisCuti);
                  },
                  child: Chip(
                    label: Text(jenisCuti),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: purpleColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelStyle: TextStyle(
                        color: purpleColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
