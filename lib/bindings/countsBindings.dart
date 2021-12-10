import 'package:dependency_mana/controllers/ShopC.dart';
import 'package:get/get.dart';

class CountsBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(
      BindingsController(),
    );
  }

}