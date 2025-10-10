import { power } from "./Calculator";
import React, { useState, useEffect } from "react";

import { StyleSheet, Text, View, TextInput, Button } from "react-native";

export default function Power(props) {
  let [baseText, setBaseText] = useState("");
  let [expText, setExpText] = useState("");

  /*
  useEffect(() => {
    props.onResultChange(() => {
      setBaseText("");
      setExpText("");
    });
  }, []);
  */

  return (
    <View style={styles.container}>
      <View style={[styles.container, { flexDirection: "row" }]}>
        <TextInput
          defaultValue={baseText}
          style={styles.input}
          placeholder="0"
          onChangeText={setBaseText}
        />
        <Text>^</Text>
        <TextInput
          defaultValue={expText}
          style={styles.input}
          placeholder="0"
          onChangeText={setExpText}
        />
      </View>
      <Button
        title="compute"
        onPress={() => {
          let n = power(parseInt(baseText), parseInt(expText));
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
