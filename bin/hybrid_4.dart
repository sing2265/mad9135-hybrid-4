import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    final uri = Uri.parse('https://random-data-api.com/api/v2/users?size=10');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (Map<String, dynamic> user in jsonResponse) {
        print('${user['uid']} ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (error) {
    print('Exception Occurred: \n$error');
  }
}
