import 'package:get/get.dart';

import 'package:employee_system2/app/modules/pengajuan/controllers/lembur_controller_controller.dart';

import '../controllers/pengajuan_controller.dart';

class PengajuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LemburControllerController>(
      () => LemburControllerController(),
    );
    Get.lazyPut<PengajuanController>(
      () => PengajuanController(),
    );
  }
}
