import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_system2/app/data/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class ClockOutView extends StatefulWidget {
  const ClockOutView({Key? key}) : super(key: key);

  @override
  State<ClockOutView> createState() => _ClockOutViewState();
}

class _ClockOutViewState extends State<ClockOutView> {
  TextEditingController tNote = TextEditingController();

  //DateTime
  DateTime currentTime = DateTime.now();
  late String formatJam;
  late String formatHari;
  late String formatTgl;
  late String formatThn;

  //Lokasi
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  var loc = "", jln = "", country = "", kode = "", prov = "";

  @override
  void initState() {
    super.initState();
    checkLock();

    //GetDateTime
    var timeFormatter = DateFormat.Hm();
    var dateFormatter = DateFormat.MMMd();
    var dayFormatter = DateFormat.E();
    var yearFormatter = DateFormat.y();
    formatJam = timeFormatter.format(currentTime);
    formatTgl = dateFormatter.format(currentTime);
    formatHari = dayFormatter.format(currentTime);
    formatThn = yearFormatter.format(currentTime);

    print('Sekarang pukul: $formatJam');
    print('Sekarang Hari: $formatHari');
    print('Sekarang Tanggal: $formatTgl');
    print('Sekarang Tahun: $formatThn');
  }

  //GetLokasi
  checkLock() async {
    servicestatus = await Geolocator
        .isLocationServiceEnabled(); //periksa apakah GPS diaktifkan
    if (servicestatus) {
      permission = await Geolocator.checkPermission(); //memeriksa izin lokasi

      if (permission == LocationPermission.denied) {
        //jika Izin lokasi ditolak
        permission = await Geolocator.requestPermission(); //meminta izin
        if (permission == LocationPermission.denied) {
          print('Izin lokasi ditolak');
        } else if (permission == LocationPermission.deniedForever) {
          //jika Izin lokasi ditolak secara permanen
          print("Izin lokasi ditolak secara permanen");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          // Perbarui tampilan
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      // Perbarui UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude);
    print(position.latitude);

    long = position.longitude.toString();
    lat = position.latitude.toString();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    // print('lokasi $placemarks');

    loc = placemarks[0].toJson().toString();
    print('Lokasi: $loc');

    jln = placemarks[0].street.toString();
    print('Jalan: $jln');

    country = placemarks[0].country.toString();
    print('Negara: $country');

    kode = placemarks[0].postalCode.toString();
    print('Kode Pos: $kode');

    prov = placemarks[0].subAdministrativeArea.toString();
    print('Provinsi: $prov');

    setState(() {
      // Perbarui tampilan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: ClipperIn(), // Buat custom clipper
                  child: Container(
                    width: Get.width,
                    height: 60.0.h,
                    color: mainColor, // Warna latar belakang
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 12.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/shadow.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.0.h),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset('assets/images/back.png'),
                            ),
                            SizedBox(
                              width: 32.0.w,
                            ),
                            Text(
                              '$formatJam',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 30.0.w,
                            ),
                            InkWell(
                              onTap: () {
                                //
                              },
                              child: Image.asset('assets/images/refresh.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0.h,
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
                          2.0.h, //atas
                          5.w, //kiri
                          0.h, //bawah
                        ),
                        child: Column(
                          children: [
                            Divider(
                              color: greyColor,
                              endIndent: 13.0.h,
                              indent: 13.0.h,
                              height: 3.0.h,
                              thickness: 5, //ketebalan
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                            Text(
                              'Clock Out',
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 3.0.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 7.w,
                                    color: blackColor,
                                  ),
                                  SizedBox(
                                    width: 2.0.w,
                                  ),
                                  Text(
                                    'Your Location',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                10.w, //kanan
                                1.0.h, //atas
                                8.0.w, //kiri
                                0.h, //bawah
                              ),
                              child: Text(
                                '$jln,' + '$prov' + '$kode,' + '$country',
                                style: TextStyle(
                                  color: greyTextColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.view_list,
                                    size: 7.w,
                                    color: blackColor,
                                  ),
                                  SizedBox(
                                    width: 2.0.w,
                                  ),
                                  Text(
                                    'Note(Optional)',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                8.w, //kanan
                                1.0.h, //atas
                                8.0.w, //kiri
                                0.h, //bawah
                              ),
                              child: TextField(
                                minLines: 1,
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                controller: tNote,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 1.0.h,
                                    horizontal: 2.0.w,
                                  ),
                                  filled: true,
                                  fillColor: whiteColor,
                                  hintText: 'Tulis catatan anda',
                                  hintStyle: TextStyle(color: blackColor),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: whiteColor),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: whiteColor),
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Get.offAll(NavigationPage());
                              },
                              style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                minimumSize: Size(
                                  80.0.w, //panjang
                                  6.0.h, //tinggi
                                ),
                              ),
                              child: Text(
                                'Clock Out',
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
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
            ),
          ],
        ),
      ),
    );
  }
}

class ClipperIn extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height); // Pindahkan awal path ke bawah
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 100, // Ubah ketinggian lengkungan ke atas
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0); // Tambahkan ini untuk menutup path ke kiri atas
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
