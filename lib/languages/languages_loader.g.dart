// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class LanguagesLoader extends AssetLoader{
  const LanguagesLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> bn = {
  "text_filed": {
    "name_hint": "তোমার নাম দাও",
    "number_hint": "তোমার নাম্বার দাও"
  },
  "buttons": {
    "save": "সেইভ করুন",
    "submit": "সাবমিট করুন"
  },
  "name": "নাম",
  "no_data": "কোন ডাটা নাই",
  "required_number": "নাম্বার দিতে হবে"
};
static const Map<String,dynamic> en = {
  "text_filed": {
    "name_hint": "Enter your name",
    "number_hint": "Enter your number"
  },
  "buttons": {
    "save": "Save",
    "submit": "Submit"
  },
  "name": "Name",
  "no_data": "No data",
  "required_number": "Required number"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"bn": bn, "en": en};
}
