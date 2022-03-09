import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/soin_corps.dart';

Future<List<SoinC>> fetchSoinC() async {
  String url = "http://iacomapp.cest-la-base.fr/soinC.php";
  final response = await http.get(url);
  return soinCFromJson(response.body);
}
