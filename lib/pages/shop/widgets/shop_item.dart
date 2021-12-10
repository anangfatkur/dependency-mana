import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/ShopC.dart';

class ShopItem extends StatelessWidget {
  final shopC = Get.find<ShopController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            shopC.quantity.value--;
            Get.find<ShopController>(tag: 'total').total.value--;
          },
          icon: const Icon(Icons.remove),
        ),
        Obx(
          () => Text(
            "${shopC.quantity}",
            style: const TextStyle(fontSize: 25),
          ),
        ),
        IconButton(
          onPressed: () {
            shopC.quantity.value++;
            Get.find<ShopController>(tag: 'total').total.value++;
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
