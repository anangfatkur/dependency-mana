import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': {
          'home_title': 'Hello %name Beli @things',
          'body': 'You have pushed the button this any times:',
        },
        'id': {
          'home_title': 'Ini Halaman Utama ',
          'body': 'Anda sudah mengklik sebanyak :',
        },
        'id_JW': {
          'home_title': 'Ini Halaman Ngarep',
          'body': 'Wes klik peng :',
        },
      };
}
