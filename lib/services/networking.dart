// Import dart:convert for JSON decoding
import 'dart:convert';
// Import http package for making network requests
import 'package:http/http.dart' as http;

// NetworkHelper handles HTTP requests and JSON decoding
class NetworkHelper {
  // The URL to fetch data from
  final String url;

  NetworkHelper(this.url);

  // Fetches data from the URL and decodes the JSON response
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw Exception('Failed to load data');
    }
  }
}
