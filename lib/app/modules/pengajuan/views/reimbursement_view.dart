import 'dart:io';
import 'package:employee_system2/app/data/cartBottomNavbar.dart';
import 'package:employee_system2/app/data/itemMenu.dart';
import 'package:employee_system2/app/modules/pengajuan/controllers/pengajuan_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class ReimbursementView extends StatefulWidget {
  String? selectedValue;

  ReimbursementView({Key? key, this.selectedValue}) : super(key: key);

  @override
  State<ReimbursementView> createState() => _ReimbursementViewState();
}

class _ReimbursementViewState extends State<ReimbursementView> {
  List<File> files = [];

  final TextEditingController tnominal = TextEditingController();

  final pengajuanController = Get.put(PengajuanController());

  //DateTime
  DateTime currentTime = DateTime.now();
  late String formatTgl;

  //Format Rupiah
  static const _locale = 'id';

  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));

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
  void initState() {
    super.initState();

    var dateFormatter = DateFormat.d().add_MMM().add_y();
    formatTgl = dateFormatter.format(currentTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        title: Text(
          'Pengajuan Reimbursement',
          style: TextStyle(
            color: secondColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            pengajuanController.clearItems();
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Tanggal Reimbursement
                  Text(
                    'Tanggal Reimbursement',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
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
                  //Tambahkan Item Pengeluaran
                  Text(
                    'Item Pengeluaran',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  addItem(),
                  // SizedBox(height: 1.0.h),
                  ElevatedButton.icon(
                    onPressed: () {
                      fromInputItem();
                    },
                    icon:
                        Icon(Remix.add_box_line, size: 3.h, color: blackColor),
                    label: Text(
                      "Tambah Item",
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(
                        100.w, //panjang
                        6.0.h, //tinggi
                      ),
                    ),
                  ),
                  SizedBox(height: 3.0.h),
                  Text(
                    'Deskripsi Reimbursement',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
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
                      hintText: 'Deskripsi Reimbursement',
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CartBottomNavbar(),
    );
  }

  Future<dynamic> fromInputItem() {
    return Get.defaultDialog(
      actions: [],
      radius: 10,
      titleStyle: TextStyle(
        color: blackColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      ),
      title: 'Tambahkan Item',
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jenis Reimbursement',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 1.0.h),
              DropdownButton2<String>(
                key: UniqueKey(),
                isExpanded: true,
                hint: Row(
                  children: [
                    Icon(
                      Remix.wallet_3_line,
                      color: greyTextColor,
                    ),
                    SizedBox(width: 2.0.h),
                    Expanded(
                      child: Text(
                        'Pilih Jenis Reimbursement',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: greyTextColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: greyTextColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: widget.selectedValue,
                onChanged: (value) {
                  setState(() {
                    widget.selectedValue = value;
                    print(widget.selectedValue);
                  });
                },

                //btn Dropdown Style
                buttonStyleData: ButtonStyleData(
                  height: 6.0.h,
                  width: 90.0.w,
                  padding: EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: greyColor, //warna button
                  ),
                ),

                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.unfold_more,
                    color: greyTextColor,
                  ),
                  iconSize: 4.0.h,
                ),
                // Dropdown Style
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 15.0.h,
                  width: 90.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: whiteColor,
                  ),
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 5.0.h,
                ),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Text(
                'Masukkan Nominal',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 1.0.h),
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                controller: tnominal,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.0.h,
                    horizontal: 2.0.w,
                  ),
                  filled: true,
                  fillColor: greyColor,
                  prefixIcon: Container(
                    alignment: Alignment.center,
                    width: 5.h,
                    height: 5.h,
                    child: Text(
                      'Rp',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  hintText: 'nominal',
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: greyTextColor,
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
                onChanged: (string) {
                  if (string.isNotEmpty) {
                    string = _formatNumber(string.replaceAll('.', ''));
                    tnominal.value = TextEditingValue(
                      text: string,
                      selection: TextSelection.collapsed(
                        offset: string.length,
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 2.0.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (widget.selectedValue != null &&
                      tnominal.text.isNotEmpty) {
                    pengajuanController.addItem(
                        widget.selectedValue!, tnominal.text);
                    pengajuanController.updateTotal();
                    Get.back();

                    setState(() {
                      widget.selectedValue = null;
                      tnominal.clear();
                    });
                  } else {
                    Get.snackbar(
                      'Error',
                      'Harap pilih jenis reimbursement dan isi nominal.',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(
                    90.0.w, // Panjang
                    6.0.h, // Tinggi
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addItem() {
    return Flexible(
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: pengajuanController.itemList.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              height: 6.0.h,
              width: Get.width,
              margin: EdgeInsets.only(bottom: 2.0.h),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pengajuanController.itemList[index]['jenisReimbursement'],
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          pengajuanController.itemList[index]['nominal'],
                          style: TextStyle(
                            color: greyTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 1.0.h),
                        InkWell(
                          onTap: () {
                            pengajuanController.removeItem(index);
                          },
                          child: Icon(
                            Remix.close_circle_line,
                            size: 3.h,
                            color: secondColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
