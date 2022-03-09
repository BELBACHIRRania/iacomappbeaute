import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/soin_visage.dart';

Future<List<SoinV>> fetchSoinV() async {
  String url = "http://iacomapp.cest-la-base.fr/soinV.php";
  final response = await http.get(url);
  return soinVFromJson(response.body);
}
