import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/actualite.dart';

Future<List<Actualite>> fetchActualite() async {
  String url = "http://iacomapp.cest-la-base.fr/actualites_beauty.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return actualiteFromJson(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}
