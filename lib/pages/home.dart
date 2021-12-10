import 'package:dependency_mana/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BindingsHomePage extends StatelessWidget {
  const BindingsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          // onPressed: () => Get.to(
          //   () => CountPage(),
          //   binding: BindingsBuilder(() {
          //     Get.put(
          //       BindingsController(),
          //     );
          //   }),
          // ),
          onPressed: () => Get.toNamed(RouteName.counts),
          child: const Text("Next >>"),
        ),
      ),
    );
  }
}
