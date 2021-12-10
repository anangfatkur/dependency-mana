import 'package:dependency_mana/controllers/ShopC.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../shop/widgets/shop_item.dart';

class ShopPage extends StatelessWidget {

  final shopC = Get.put(ShopController(), tag: 'total');
  final quailtyC = Get.create(() => ShopController());
  
  ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Page"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ShopItem(),
      ),
      floatingActionButton: CircleAvatar(
        child: Obx(
          () => Text("${shopC.total}"),
        ),
      ),
    );
  }
}
