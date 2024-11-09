import 'package:http/http.dart' as http;
import 'package:my_groceery_mobile/const_data.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl?populate[images]=true&populate=tags'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Failed to load data');
      return null;
    }
  }
}