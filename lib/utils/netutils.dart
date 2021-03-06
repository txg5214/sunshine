import 'dart:async';
import 'package:http/http.dart' as http;

class NetUtils {
  static  get(String url, {Map<String, dynamic> params}) async {
    try {
  
      if (params != null && params.isNotEmpty) {
        StringBuffer sb = new StringBuffer("?");
        params.forEach((key, value) {
          value = value.toString();
          sb.write("$key" + "=" + "$value" + "&");
        });

        String paramsStr = sb.toString();
        paramsStr = paramsStr.substring(0, paramsStr.length - 1);
        url += paramsStr;
      }

      http.Response res = await http.get(url);
      if (res.statusCode != 200) {
        throw res.body;
      }
      return res.body;
    } catch (err) {
       print(err);
    }
  }

  static Future<String> post(String url, {Map<String, String> params}) async {
    http.Response res = await http.post(url, body: params);
    return res.body;
  }
}
