import '../bindings/countsBindings.dart';
import '../pages/counts.dart';
import '../pages/home.dart';
import '../routes/routes_name.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => const BindingsHomePage(),
    ),
    GetPage(
      name: RouteName.counts,
      page: () => CountsPage(),
      binding: CountsBindings(),
    ),
  ];
}
