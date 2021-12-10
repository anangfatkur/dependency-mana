import 'package:dependency_mana/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final myC = Get.put(MyController());
  //YOUTUBE Penggunaan lazyput
  // final myC = Get.lazyPut(() => MyController(), tag: 'tag-text', fenix: true);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const HomePage(),
      home: const HomePageCreate(),
    );
  }
}

class HomePage extends StatelessWidget {
  // final myC = Get.put(
  //   MyController(),
  //   permanent: true,
  //   tag: 'tag-count',
  // );

  // final MyController myC = Get.find();
  // final myC = Get.find<MyController>();
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => CountPage),
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
      body: Center(
        child:
            // Text(
            //   "${myC.count}",
            //   style: const TextStyle(fontSize: 35),
            // ),
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Page"),
            OutlinedButton(
              onPressed: () => Get.to(CountPage()),
              child: const Text("Next >>"),
            ),
          ],
        ),
      ),
    );
  }
}

class CountPage extends StatelessWidget {
  // final MyController myC = Get.find();
  // final myC = Get.find<MyController>(tag: 'tag-count');
  // final count = 0.obs;

  //MENGGUNAKAN GET PUT BIASA
  final c = Get.put(MyController());
  CountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count Page"),
        actions: [
          IconButton(
            onPressed: () => Get.to(CountPage),
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
      body:
          // Center(
          //   child: Obx(
          //     () => Text(
          //       "${myC.count}",
          //       style: const TextStyle(fontSize: 35),
          //     ),
          //   ),
          // ),
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              // "$count",
              "${c.count}",
              style: const TextStyle(fontSize: 30),
            ),
          ),
          OutlinedButton(
            onPressed: () => Get.to(CountPage()),
            child: const Text("Next >>"),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () => myC.add()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.setData(),

        //YOUTUBE MENGGUNAKAN PUTASYNC LEBIH CEPAT PENULISAN KODE NYA
        // Get.putAsync<SharedPreferences>(
        //   () async {
        //     final prefs = await SharedPreferences.getInstance();
        //     await prefs.setInt('counter', 99);

        //     count.value = prefs.getInt('counter')!.toInt();
        //     return prefs;
        //   },
        // ),
      ),
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

  // void add() => count++;

  //Get biasa menggunakan async
  Future<void> setData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 99);

    count.value = prefs.getInt('counter')!.toInt();
  }
}
