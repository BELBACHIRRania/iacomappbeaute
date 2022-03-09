import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/manucure.dart';

Future<List<Manucure>> fetchManucure() async {
  String url = "http://iacomapp.cest-la-base.fr/manucure.php";
  final response = await http.get(url);
  return manucureFromJson(response.body);
}
