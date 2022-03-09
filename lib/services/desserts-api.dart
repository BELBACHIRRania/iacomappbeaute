import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/desserts.dart';

Future<List<Desserts>> fetchDesserts() async {
  String url = "http://iacomapp.cest-la-base.fr/desserts.php";
  final response = await http.get(url);
  return dessertsFromJson(response.body);
}
