import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shop/shop.dart';

class HomePageCreate extends StatelessWidget {
  const HomePageCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Page"),
            OutlinedButton(
              onPressed: () => Get.to(ShopPage()),
              child: const Text("Shop >>>"),
            ),
          ],
        ),
      ),
    );
  }
}
