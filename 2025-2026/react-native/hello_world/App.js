import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import React from "react"

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>Hello World!</Text>
      <HelloWorld/>
      <HelloWorldTo name="Mario" color="red"/>
      <HelloWorldTo name="Luigi" color="green"/>
      <HelloWorldTo name="Franco"/>
      <HelloWorldClass color="blue"/>
      <HelloWorldGenerator count={10}/>
      <StatusBar style="auto" />
    </View>
  );

  //return React.createElement(
  //  HelloWorldTo,
  //  {name: "Wario", color: "orange"}
  //)
}

function HelloWorld() {
  return <Text style={styles.text}>Hello World! I am a function!</Text>
}

function HelloWorldTo(props) {
  return <Text style={[styles.text, {color: props.color ?? "black"}]}>Hello {props.name}</Text>
}

class HelloWorldClass extends React.Component {
  render() {
    return <Text style={[styles.text, {color: this.props.color}]}>Hello World! I am a class!</Text>
  }
}

function HelloWorldGenerator(props) {
  const data = []
  for (let i=0; i < props.count; i++) {
    data.push(<HelloWorldTo name={i} color="gray" key={i}/>)
  }
  return <View>{data}</View>
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    fontSize: 30,
    color: "red"
  }
});
