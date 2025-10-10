import { factorial } from "./Calculator";
import React, { useState, useEffect } from "react";

import { StyleSheet, Text, View, TextInput, Button } from "react-native";

export default function Factorial(props) {
  let [text, setText] = useState("");

  /*
  useEffect(() => {
    props.onResultChange(() => {
      setText('');
    })
  }, []);
  */

  return (
    <View style={styles.container}>
      <View style={[styles.container, { flexDirection: "row" }]}>
        <TextInput
          defaultValue={text}
          style={styles.input}
          placeholder="0"
          onChangeText={setText}
        />
        <Text>!</Text>
      </View>
      <Button
        title="compute"
        onPress={() => {
          let n = factorial(parseInt(text));
          props.updateResult(n);
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
  },
  input: {
    fontSize: 25,
    marginRight: 0,
    textAlign: "right",
    color: "black",
  },
});
