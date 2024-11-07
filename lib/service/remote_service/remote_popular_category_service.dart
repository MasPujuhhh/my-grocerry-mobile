import 'package:http/http.dart' as http;
import 'package:my_groceery_mobile/const_data.dart';


class RemotePopularCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-categories';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl?populate[category][populate]=images&pagination[start]=0&pagination[limit]=5s'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Failed to load data');
      return null;
    }
  }

}