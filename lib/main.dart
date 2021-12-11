import 'package:dependency_mana/routes/app_routes.dart';
import 'package:dependency_mana/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: const Locale('en'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageTranslations(title: 'title'.trArgs(['anang', 'Kopi'])),
      getPages: AppPages.pages,
    );
  }
}

class HomePage extends StatelessWidget {
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
        child: Column(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.setData(),
      ),
    );
  }
}

class TextPage extends StatelessWidget {
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

  Future<void> setData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 99);

    count.value = prefs.getInt('counter')!.toInt();
  }
}

class MyHomePageTranslations extends StatefulWidget {
  const MyHomePageTranslations({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<MyHomePageTranslations> createState() => _MyHomePageTranslations();
}

class _MyHomePageTranslations extends State<MyHomePageTranslations> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'title'.trParams(
            {
              'name ': 'Anang',
              'things': 'Kopi',
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.updateLocale(
                Locale('id'),
              );
            },
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'body'.tr,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
