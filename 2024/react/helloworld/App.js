import { StatusBar } from "expo-status-bar";
import React from "react";
import { StyleSheet, Text, SafeAreaView, View } from "react-native";

export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      <HelloWorld />
      <HelloWorldV2 />
      <HelloWorldTo name="Marco" />
      <HelloWorldGen count={10} />
      <StatusBar style="auto" />
    </SafeAreaView>
  );
}

function HelloWorld() {
  return <Text style={styles.text}>Hello World!!!</Text>;
}

class HelloWorldV2 extends React.Component {
  render() {
    return <Text style={[styles.text, styles.red]}>Hello World!!!</Text>;
  }
}

function HelloWorldTo(props) {
  const color1 = props.color ?? "yellow";
  const name = props.name;

  return <Text style={[{ color: color1 }, styles.text]}>Hello {name}!!!</Text>;
}

function HelloWorldGen(props) {
  const data = [];
  for (let i = 1; i <= props.count; i++) {
    data.push(<HelloWorldTo name={i} color="blue" key={i.toString()} />);
  }
  return <View>{data}</View>;
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  text: {
    fontWeight: "500",
    fontSize: 20,
  },
  red: {
    color: "red",
  },
});