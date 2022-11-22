import { StatusBar } from "expo-status-bar";
import Slider from "@react-native-community/slider";
import React, { useState } from "react";
import { StyleSheet, Text, View, Button } from "react-native";

export default function App() {
  const [counter, setCounter] = useState(0);

  return (
    <View style={styles.container}>
      <View style={styles.containerText}>
        <Text style={{ fontWeight: "500", fontSize: 20, textAlign: "center" }}>
          {counter}
        </Text>
      </View>
      <Button
        title="Plus ONE"
        onPress={() => {
          setCounter(counter + 1);
        }}
      />
      <Slider
        minimumValue={0}
        maximumValue={100}
        value={counter}
        onValueChange={(value) => {
          setCounter(Math.floor(value));
        }}
      />
      <StatusBar style="auto" />
    </View>
  );
}

class AppOOP extends React.Component {
  state = { counter: 0 };
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.containerText}>
          <Text
            style={{ fontWeight: "500", fontSize: 20, textAlign: "center" }}
          >
            {this.state.counter}
          </Text>
        </View>
        <Button
          title="Plus TWO"
          onPress={() => {
            this.setState({ counter: this.state.counter + 2 });
          }}
        />
        <StatusBar style="auto" />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "stretch",
    justifyContent: "center",
  },
  containerText: {
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});