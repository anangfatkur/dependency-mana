import 'package:dependency_mana/controllers/ShopC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountsPage extends StatelessWidget {
  final countC = Get.put(BindingsController());
  CountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counts Page"),
      ),
      body: Center(
        child: Obx(
          () => Text("${countC.count}"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countC.add(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
