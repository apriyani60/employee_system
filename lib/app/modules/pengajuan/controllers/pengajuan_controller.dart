import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PengajuanController extends GetxController {
  var itemList = [].obs;
  var total = 0.obs;

  String formatNumber(String s) {
    return NumberFormat.decimalPattern('id').format(int.parse(s));
  }

  void addItem(String jenisReimbursement, String nominal) {
    itemList.add({
      'jenisReimbursement': jenisReimbursement,
      'nominal': nominal,
    });
    updateTotal();
  }

  void removeItem(int index) {
    itemList.removeAt(index);
    updateTotal();
  }

  void clearItems() {
    itemList.clear();
    updateTotal();
  }

  void updateTotal() {
    total.value = 0;
    for (var item in itemList) {
      total.value += int.parse(item['nominal'].replaceAll('.', ''));
    }
  }
}
