import 'dart:io';
import 'package:http/http.dart' as http;

import '../../show_loading.dart';

class HttpHelper{
  static Future<http.Response> post( File file,  String link,context) async {
    ///MultiPart request
    showLoading(context);
    String filename = file.path
        .split('/')
        .last;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(link),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'video',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print("This is response:" + response.body);
    print("This is response: ${res.statusCode} ");
    return response;
  }

}




