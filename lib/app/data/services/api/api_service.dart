import 'package:get/get.dart';

class ApiService extends GetxService {
  final GetConnect _getConnect = GetConnect(
    timeout: const Duration(seconds: 30),
  );

  final String baseUrl = 'https://api.example.com'; // prod
  // final String baseUrl = 'https://api.example.com'; // local

  Future<Response<dynamic>> get(
      {required String url,
      Map<String, String>? header,
      String? contentType,
      Map<String, dynamic>? query}) {
    return _getConnect.get("$baseUrl/$url",
        headers: header, contentType: contentType, query: query);
  }

  Future<Response<dynamic>> post(
      {required String url,
      Map<String, dynamic>? body,
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

  Future<Response<dynamic>> put(
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

  Future<Response<dynamic>> patch(
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

  Future<Response<dynamic>> delete(
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
