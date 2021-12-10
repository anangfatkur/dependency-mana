import 'package:get/get.dart';

class ShopController extends GetxController {
  var quantity = 0.obs;
  var total = 0.obs;
}

class BindingsController extends GetxController {
  var count = 0.obs;

  void add() => count++;
}
