import 'package:flutter/material.dart';
import 'movies_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/movies": (context) => const MovieDetail(),
      },
      home: Scaffold(
          appBar: AppBar(title: const Text("Movies")), 
          body: const Movies()),
    );
  }
}

class Movies extends StatefulWidget {

  const Movies({Key? key}): super(key: key);

  @override
  _MoviesState createState() => _MoviesState();

}

class _MoviesState extends State<Movies> {

  List _movies = [];

  _updateMovies(String input) async {
    // await make asynchronous function to be synchronous
    List movies = await search(input);
    setState(() {
      _movies = movies; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.black,
            ),
          onChanged: (input) => _updateMovies(input),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _movies.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile (
                contentPadding: const EdgeInsets.all(10.0),
                title: Text(
                  _movies[index]["Title"],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  )
                ),
                leading: Image.network(
                  _movies[index]["Poster"],
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context, 
                    "/movies",
                    arguments: MovieArguments(_movies[index]["imdbID"]),
                  );
                },
              );
            }),
        ),
      ],
      );
  }
}

class MovieArguments {
  String movieId;
  MovieArguments(this.movieId);
}

class MovieDetail extends StatefulWidget {

  const MovieDetail({Key? key}): super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();

}

class _MovieDetailState extends State<MovieDetail> {

  var _movie;
  var _first = true;

  @override
  Widget build(BuildContext context) {


    if(_first) {
      // We are retrieving the id of the movie using arguments
      var args = ModalRoute.of(context)?.settings.arguments as MovieArguments;
      findMovie(args.movieId).then(
        (movie) => setState(() {
          _movie = movie;
          _first = false;
        })
      );
    }

    if (_movie == null) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text("")), 
          body: const Text(""))
        );
    }

    print(_movie);

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text("${_movie['Title']}"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
              )
          ), 
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.network(
                  _movie["Poster"],
                  fit: BoxFit.cover,
                  height: 400.0,
                  width: 400.0,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Year",
                  style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "${_movie['Year']}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )
              ]),
            ))
        );

  }


}