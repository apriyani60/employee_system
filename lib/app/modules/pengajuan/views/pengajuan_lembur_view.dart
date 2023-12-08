import 'package:employee_system2/app/modules/pengajuan/views/pengajuan_absensi_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class PengajuanLemburView extends StatefulWidget {
  PengajuanLemburView({Key? key}) : super(key: key);

  @override
  State<PengajuanLemburView> createState() => _PengajuanLemburViewState();
}

class _PengajuanLemburViewState extends State<PengajuanLemburView> {
  List<File> files = [];

  //DateTime
  DateTime currentTime = DateTime.now();
  late String formatTgl;
  TimeOfDay? jamMulai;
  TimeOfDay? jamSelesai;

  @override
  void initState() {
    super.initState();

    var dateFormatter = DateFormat.d().add_MMM().add_y();
    formatTgl = dateFormatter.format(currentTime);
  }

  //Jam Mulai
  Future _pilihJamMulai() async {
    if (jamMulai == null) {
      jamMulai = TimeOfDay(hour: 0, minute: 0);
    }
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: 'Pilih Jam Mulai',
      cancelText: 'Batal',
      confirmText: 'Konfirmasi',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: _timePickerTheme,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => purpleColor),
                overlayColor:
                    MaterialStateColor.resolveWith((states) => secondColor),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedStartTime != null) {
      setState(() {
        jamMulai = pickedStartTime;
      });
    } else {
      setState(() {
        jamMulai = null;
      });
    }
  }

  //Jam Selesai
  Future _pilihJamSelesai() async {
    if (jamSelesai == null) {
      jamSelesai = TimeOfDay(hour: 0, minute: 0);
    }
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: 'Pilih Jam Selesai',
      cancelText: 'Batal',
      confirmText: 'Konfirmasi',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: _timePickerTheme,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => purpleColor),
                overlayColor:
                    MaterialStateColor.resolveWith((states) => secondColor),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedEndTime != null) {
      setState(
        () {
          jamSelesai = pickedEndTime;
        },
      );
    } else {
      setState(() {
        jamSelesai = null;
      });
    }
  }

  //Style Time Picker
  final _timePickerTheme = TimePickerThemeData(
    backgroundColor: whiteColor,
    helpTextStyle: TextStyle(
        fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.black),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? greyFieldColor : greyColor),
    hourMinuteTextStyle:
        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? mainColor : blackColor),
    dialHandColor: mainColor, // Warna jarum jam
    dialBackgroundColor: whiteColor,
    dialTextStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? whiteColor : blackColor),
    entryModeIconColor: purpleColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected) ? mainColor : greyColor),
      border: InputBorder.none,
      // contentPadding: EdgeInsets.all(0),
    ),
  );

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
          'Pengajuan Lembur',
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
                    'Tanggal Lembur',
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
                      DateTime? newDateTime = await showRoundedDatePicker(
                        context: context,
                        theme: ThemeData(
                          primaryColor: mainColor,
                        ),
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
                    'Waktu Lembur',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.0.h),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jam Mulai',
                              style: TextStyle(
                                color: greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 1.0.h),
                            Container(
                              width: 40.w,
                              child: TextField(
                                readOnly: true,
                                onTap: _pilihJamMulai,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 1.0.h,
                                    horizontal: 2.0.w,
                                  ),
                                  filled: true,
                                  fillColor: greyColor,
                                  prefixIcon: Icon(
                                    Remix.time_line,
                                    size: 4.h,
                                    color: greyTextColor,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.unfold_more,
                                    size: 4.h,
                                    color: greyTextColor,
                                  ),
                                  hintText: jamMulai != null
                                      ? '${jamMulai!.hour}:${jamMulai!.minute}'
                                      : 'Pilih',
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
                            ),
                          ],
                        ),
                        // SizedBox(width: 1.0.h),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jam Selesai',
                              style: TextStyle(
                                color: greyTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 1.0.h),
                            Container(
                              width: 40.w,
                              child: TextField(
                                readOnly: true,
                                onTap: _pilihJamSelesai,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 1.0.h,
                                    horizontal: 2.0.w,
                                  ),
                                  filled: true,
                                  fillColor: greyColor,
                                  prefixIcon: Icon(
                                    Remix.time_line,
                                    size: 4.h,
                                    color: greyTextColor,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.unfold_more,
                                    size: 4.h,
                                    color: greyTextColor,
                                  ),
                                  hintText: jamSelesai != null
                                      ? '${jamSelesai!.hour}:${jamSelesai!.minute}'
                                      : 'Pilih',
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3.0.h),
                  //Deskripsi
                  Text(
                    'Lokasi Lembur',
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
                        Remix.map_pin_2_line,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      hintText: 'Lokasi',
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
                  //uraian Tugas
                  Text(
                    'Uraian Tugas',
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
                        Remix.file_2_line,
                        size: 4.h,
                        color: greyTextColor,
                      ),
                      hintText: 'Tugas',
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
            ),
          ],
        ),
      ),
    );
  }
}
