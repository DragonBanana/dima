const apikey = "b8c79639";
const endpoint = "http://www.omdbapi.com/";

class MovieRest {
  search(text, callback) {
    if (text === "") {
      callback([]);
      return;
    }

    fetch(endpoint + "?apikey=" + apikey + "&s=" + text)
      .then((response) => response.json())
      .then((responseJson) => {
        if (responseJson.Search) {
          const movies = responseJson.Search.filter(
            (movie) => movie.Poster != "N/A"
          );
          callback(movies);
        }
      })
      .catch((error) => {
        console.error(error);
        callback([]);
      });
  }

  find(movieId, callback) {
    if (movieId == "null") {
      callback([]);
      return;
    }

    fetch(endpoint + "?apikey=" + apikey + "&i=" + movieId)
      .then((response) => response.json())
      .then((responseJson) => {
        callback(responseJson);
      })
      .catch((error) => {
        console.error(error);
        callback([]);
      });
  }
}

const REST = new MovieRest();
export default REST;
