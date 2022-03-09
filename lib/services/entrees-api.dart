import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/entrees.dart';

Future<List<Entrees>> fetchEntrees() async {
  String url = "http://iacomapp.cest-la-base.fr/entrees.php";
  final response = await http.get(url);
  return entreesFromJson(response.body);
}
