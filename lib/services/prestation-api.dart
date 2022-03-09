import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/prestation.dart';

Future<List<Prestation>> fetchPrestation() async {
  String url = "http://iacomapp.cest-la-base.fr/prestation.php";
  final response = await http.get(url);
  return prestationFromJson(response.body);
}
