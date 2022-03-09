import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/menus.dart';

Future<List<Menus>> fetchMenus() async {
  String url = "http://iacomapp.cest-la-base.fr/menus.php";
  final response = await http.get(url);
  return menusFromJson(response.body);
}
