import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/models/reservations.dart';

Future<List<Reservations>> fetchReservations() async {
  String url = "http://iacomapp.cest-la-base.fr/reservations_iacombeauty.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return reservationsFromJson(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}
