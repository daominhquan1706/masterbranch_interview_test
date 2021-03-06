import 'dart:convert';

import 'package:flutter/services.dart';

class AssetUtils {
  static Future<Map<String, dynamic>> parseJsonFromAssets(
      String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
