import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final myC = Get.put(MyController());
  //YOUTUBE Penggunaan lazyput
  final myC = Get.lazyPut(() => MyController(), tag: 'tag-text', fenix: true);
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
  final myC = Get.put(
    MyController(),
    permanent: true,
    tag: 'tag-count',
  );

  // final MyController myC = Get.find();
  // final myC = Get.find<MyController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.to(() => CountPage),
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "${myC.count}",
          style: const TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}

class CountPage extends StatelessWidget {
  // final MyController myC = Get.find();
  final myC = Get.find<MyController>(tag: 'tag-count');
  CountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.to(CountPage),
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
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

class TextPage extends StatelessWidget {
  // final textC = Get.put(
  //   MyController(),
  //   permanent: false,
  //   tag: 'tag-text',
  // );
  final myC = Get.find<MyController>(tag: 'tag-text');

  TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.to(CountPage),
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
      body: Center(
        child: TextField(
          controller: myC.textController,
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var count = 0.obs;

  var textController = TextEditingController();

  void add() => count++;
}
