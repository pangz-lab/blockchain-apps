import 'dart:convert';
import 'package:http/http.dart';
import 'package:verus_verisig/domain/entities/payload_interface.dart';
import 'package:verus_verisig/infrastructure/services/http_service/http_service.dart';

class FileValidatorService {
  static const _url = 'https://verus.io/api/verusSignatureHash';
  static const _referer = 'https://verus.io/verify-signatures';

  Future<Response> validate(PayloadInterface payload) {
    print("Send request..");
    return HttpService.sendPost(
      url: _url,
      headers: <String,String> {
        "authority" : "verus.io",
        // "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36 Edg/86.0.622.68",
        "content-type" : "application/json",
        "accept": "*/*",
        "origin" : "https://verus.io",
        "sec-fetch-site" : "same-origin",
        "sec-fetch-mode" : "cors",
        "sec-fetch-dest" : "empty",
        "referer" : _referer,
        "accept-language" : "en-US,en;q=0.9",
      },
      body: jsonEncode(payload.toJson())
    );
  }
}