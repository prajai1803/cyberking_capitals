import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

class UniService extends GetxService {
  static String _code = '';
  static String get code => _code;
  static bool get hasCode => _code.isEmpty;

  static void reset() => _code = '';

  static Future<void> init() async {
    try {
      final initialLink = await getInitialLink();
      debugPrint(initialLink ?? "No link");

      uriLinkStream.listen((Uri? uri) async {
        uniHandler(uri);
      }, onError: (error) {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void uniHandler(Uri? uri) {}
}
