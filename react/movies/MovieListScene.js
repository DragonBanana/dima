import React, { useState } from "react";
import { StyleSheet, SafeAreaView, TextInput } from "react-native";
import MovieList from "./MovieList";
import rest from "./MovieRest";

export default function MovieListScene(props) {
  const [movies, setMovies] = useState([]);

  return (
    <SafeAreaView style={styles.container}>
      <TextInput
        style={styles.input}
        placeholder="Search"
        onChangeText={(text) => {
          rest.search(text, setMovies);
        }}
      />
      <MovieList
        navigate={(movie) =>
          props.navigation.navigate("Detail", {
            movieId: movie.imdbID,
            title: movie.Title,
          })
        }
        movies={movies}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "white",
  },
  input: {
    height: 50,
    margin: 5,
    color: "black",
    fontSize: 20,
  },
});
