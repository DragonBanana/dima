import 'package:http/http.dart' as http;
import 'dart:convert';

String endpoint = "http://www.omdbapi.com/";
String apikey = "ff183404";

// Asynchronous function
// returns Future<...>
// we return a list of dynamic (not good practice)
Future<List<dynamic>> search(String input) async {

  if (input == "") {
    return [];
  }

  var response = await http.get(Uri.parse(endpoint + "?apikey=" + apikey + "&s=" + input));

  final responseJson = json.decode(response.body);

  if (responseJson['Search'] != null) {

      return responseJson["Search"]
        .where((movie) => movie["Poster"] != "N/A")
        .toList();

  }

  return [];

}

// Another asynchronous function
// we can omit the returned type
// Dart can infer the type
findMovie(String movieId) async {
  if (movieId == "") {
    return [];
  }

  print(endpoint + "?apikey" + apikey + "&i=" + movieId);

  var response = await http.get(Uri.parse(endpoint + "?apikey=" + apikey + "&i=" + movieId));

  return jsonDecode(response.body);
}