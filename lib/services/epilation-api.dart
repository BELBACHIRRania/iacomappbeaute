import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/epilation.dart';

Future<List<Epilation>> fetchEpilation() async {
  String url = "http://iacomapp.cest-la-base.fr/epilation.php";
  final response = await http.get(url);
  return epilationFromJson(response.body);
}
