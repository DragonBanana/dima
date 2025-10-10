import React, { useState } from "react";
import { StyleSheet, Text, View, TextInput, Button } from "react-native";
import Factorial from "./Factorial";
import Power from "./Power";

export default function App() {
  //let [onResultChangeList, setOnResultChangeList] = useState([]);
  let [result, setResult] = useState(0);

  let changeResult = (n) => {
    setResult(n);
    //onResultChangeList.forEach(f => f());
  };

  /*
  let addOnResultChange = (f) => {
    setOnResultChangeList((prev) => [...prev, f])
  }
  */

  return (
    <View style={[styles.container, { marginTop: 50 }]}>
      <Text style={styles.result}> {result} </Text>
      <View style={[styles.container]}>
        <Factorial
          updateResult={changeResult}
          //onResultChange={addOnResultChange}
        />
        <Power
          updateResult={changeResult}
          // onResultChange={addOnResultChange}
        />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
    fontSize: 50,
  },
  result: {
    fontSize: 50,
    color: "red",
  },
});
