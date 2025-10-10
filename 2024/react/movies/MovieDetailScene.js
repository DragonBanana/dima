import React, { useState, useEffect } from "react";
import {
  StyleSheet,
  View,
  Text,
  Image,
  ScrollView,
  SafeAreaView,
} from "react-native";
import rest from "./MovieRest";

export default function MovieDetailScene(props) {
  const [movie, setMovie] = useState({});
  const movieId = props.route.params.movieId;

  useEffect(() => {
    rest.find(movieId, setMovie);
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.container}>
        <View style={styles.posterContainer}>
          <Image source={{ uri: movie.Poster }} style={styles.poster} />
          <View style={styles.ratingContainer}>
            <Image style={styles.star} source={require("./star.png")} />
            <Text style={styles.rating}> {movie.imdbRating}</Text>
          </View>
        </View>
        <View style={styles.textContainer}>
          <Text style={styles.textLabel}>Director: </Text>
          <Text style={styles.text}>{movie.Director}</Text>
        </View>
        <View style={styles.textContainer}>
          <Text style={styles.textLabel}>Runtime: </Text>
          <Text style={styles.text}>{movie.Runtime}</Text>
        </View>
        <View style={styles.textContainer}>
          <Text style={styles.textLabel}>Year: </Text>
          <Text style={styles.text}>{movie.Year}</Text>
        </View>
        <View style={styles.textContainer}>
          <Text style={styles.textLabel}>Actors: </Text>
          <Text style={styles.text}>{movie.Actors}</Text>
        </View>
        <View style={styles.textContainer}>
          <Text style={styles.textLabel}>Plot: </Text>
          <Text style={styles.text}>{movie.Plot}</Text>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    marginRight: 2,
    marginLeft: 2,
  },
  posterContainer: {
    width: "100%",
    alignItems: "center",
    justifyContent: "center",
    marginBottom: 5,
  },
  poster: {
    height: 500,
    width: "100%",
    marginBottom: 10,
  },
  ratingContainer: {
    alignItems: "center",
    flexDirection: "row",
  },
  star: {
    width: 40,
    height: 40,
  },
  rating: {
    fontSize: 20,
    fontWeight: "600",
  },
  textContainer: {
    width: "100%",
    flexDirection: "column",
    alignItems: "flex-start",
  },
  textLabel: {
    fontSize: 18,
    fontWeight: "500",
  },
  text: {
    flex: 1,
    fontSize: 18,
  },
});
