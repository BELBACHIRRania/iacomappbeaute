import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/jus.dart';

Future<List<Jus>> fetchJus() async {
  String url = "http://iacomapp.cest-la-base.fr/jus.php";
  final response = await http.get(url);
  return jusFromJson(response.body);
}
