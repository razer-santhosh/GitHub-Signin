import 'package:http/http.dart' as http;

import '../env/env.dart';

class API {
  static Map<String, String> header = {"Content-Type": "application/json"};
  static Uri uri(endPoint) => Uri.parse('${Env.githubUrl}$endPoint');
  //Post Data Method
  static postData(postUrl, dataBody) async {
    Uri url = uri(postUrl);
    var response = await http.post(url, headers: header, body: dataBody);
    return response;
  }

  static getData(getUrl, accessToken) async {
    Uri url = uri(getUrl);
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $accessToken'});
    return response;
  }
}
