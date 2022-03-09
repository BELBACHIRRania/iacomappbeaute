import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/beaute.dart';

Future<List<Beaute>> fetchBeaute() async {
  String url = "http://iacomapp.cest-la-base.fr/beaute.php";
  final response = await http.get(url);
  return beauteFromJson(response.body);
}
