import 'package:get/get.dart';

class ApiService extends GetxService {
  final GetConnect _getConnect = GetConnect(
    timeout: const Duration(seconds: 10),
  );

  // final String baseUrl = 'http://192.168.29.217:4011'; // local
  final String baseUrl = "https://demo-studentapi.sankhyank.com";

  Future<Response> get(
      {required String url,
      Map<String, String>? header,
      String? contentType,
      Map<String, dynamic>? query}) {
    return _getConnect.get("$baseUrl/$url",
        headers: header, contentType: contentType, query: query);
  }

  Future<Response> post(
      {required String url,
      dynamic body,
      Map<String, String>? header,
      String? contentType,
      Map<String, dynamic>? query}) {
    return _getConnect.post(
      "$baseUrl/$url",
      body ?? {},
      headers: header,
      contentType: contentType,
      query: query,
    );
  }

  Future<Response> put(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      String? contentType,
      Map<String, dynamic>? query}) {
    return _getConnect.put(
      "$baseUrl/$url",
      body ?? {},
      headers: header,
      contentType: contentType,
      query: query,
    );
  }

  Future<Response> patch(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      String? contentType,
      Map<String, dynamic>? query}) {
    return _getConnect.patch(
      "$baseUrl/$url",
      body ?? {},
      headers: header,
      contentType: contentType,
      query: query,
    );
  }

  Future<Response> delete(
      {required String url,
      Map<String, String>? header,
      String? contentType,
      Map<String, dynamic>? query}) {
    return _getConnect.delete(
      "$baseUrl/$url",
      headers: header,
      contentType: contentType,
      query: query,
    );
  }
}
