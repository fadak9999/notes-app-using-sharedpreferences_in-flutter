import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "الصفحة الرئيسية",
          "2": "انكليزي",
          "3": "عربي",
          "page1body": "الصفحة الاولى",
          "goto": "انتقل الى",
          "titleDrawer": "اختر اللغة",
          "mod": "الوضع",
          "notes": "ملحوظات",
          "addnotes": "اضافة ملحوظة",
          "title": "العنوان",
          "Description": "الوصف",
          "save": "حفظ"
        },
//
        "en": {
          "1": "homepage",
          "2": "english",
          "3": "arabic",
          "page1body": "page1",
          "goto": "goto",
          "titleDrawer": "select a language",
          "mod": "mode",
          "notes": "Notes",
          "addnotes": "Add Notes",
          "title": "Title",
          "Description": "Description",
          "save": "save"
        },
      };
}
