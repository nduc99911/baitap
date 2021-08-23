import 'package:get/get.dart';
class Controller extends GetxController {
  List<String> strings = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  add(String value) => strings.add(value);

  @override
  void onClose() {
    super.onClose();
  }
}