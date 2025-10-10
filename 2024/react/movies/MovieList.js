import React from "react";
import {
  FlatList,
  Text,
  TouchableHighlight,
  Image,
  View,
  StyleSheet,
} from "react-native";

export default function MovieList(props) {
  return (
    <FlatList
      data={props.movies}
      renderItem={({ item, index }) => {
        return <MovieRow navigate={props.navigate} movie={item} />;
      }}
      keyExtractor={(item, index) => {
        return item.imdbID;
      }}
    />
  );
}

function MovieRow(props) {
  console.log(props);
  return (
    <TouchableHighlight
      activeOpacity={0.5}
      underlayColor="darkblue"
      onPress={() => props.navigate(props.movie)}
    >
      <View style={styles.container}>
        <Image source={{ uri: props.movie.Poster }} style={styles.poster} />
        <View style={[styles.container, styles.description]}>
          <Text style={styles.title}>{props.movie.Title}</Text>
          <Text style={styles.year}>{props.movie.Year}</Text>
        </View>
      </View>
    </TouchableHighlight>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: "white",
    flex: 1,
    padding: 8,
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
  },
  poster: {
    marginRight: 10,
    height: 250,
    width: 150,
  },
  description: {
    flexDirection: "column",
    alignItems: "flex-start",
    justifyContent: "space-between",
  },
  title: {
    color: "black",
    fontSize: 20,
    fontWeight: "500",
    fontStyle: "italic",
  },
  year: {
    color: "black",
    fontSize: 16,
    fontWeight: "400",
  },
});
