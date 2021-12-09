import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myC = Get.put(MyController());
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // final MyController myC = Get.find();
  final myC = Get.find<MyController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            "${myC.count}",
            style: const TextStyle(fontSize: 35),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => myC.add()),
    );
  }
}

class MyController extends GetxController {
  var count = 0.obs;

  void add() => count++;
}
