import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/plats.dart';

Future<List<Plats>> fetchPlats() async {
  String url = "http://iacomapp.cest-la-base.fr/plats.php";
  final response = await http.get(url);
  return platsFromJson(response.body);
}
