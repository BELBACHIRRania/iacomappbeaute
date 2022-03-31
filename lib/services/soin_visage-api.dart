import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/article.dart';

Future<List<Article>> fetchArticle() async {
  String url = "http://iacomapp.cest-la-base.fr/soinV.php";
  final response = await http.get(url);
  return articleFromJson(response.body);
}
