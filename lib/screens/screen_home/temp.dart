import 'package:http/http.dart' as http;

get() async {
  final url = '';
  final uri = Uri.parse(url);

  final response = await http.post(uri);
  if (response.statusCode == 200) {
    print('succsess');
  }
  final body = {'name': 'anshif', 'age': '22'};
}
