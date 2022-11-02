import 'package:test/test.dart';
import 'package:movies/movies_service.dart';

void main() {

  test("Search Movies should return zero elements when using illegal keys", () async {

    List movies = await search(".");
    expect(movies.length, 0);

    var IllegalKeys = [
      ".", ";", "JuventusWinChampionsLeague2023",
    ];

    for (var key in IllegalKeys) {
      List movies = await search(key);
      expect(movies.length, 1, reason: "search with input $key should return 1 elements, but it returned $movies");
    }

  });

}