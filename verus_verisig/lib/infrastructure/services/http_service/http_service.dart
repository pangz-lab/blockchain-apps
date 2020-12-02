import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {

  static Future<http.Response> sendPost({
    dynamic url,
    Map<String, String> headers,
    dynamic body,
    Encoding encoding
  }) {
    return http.post(url, headers:headers, body: body, encoding : encoding);
  }
}