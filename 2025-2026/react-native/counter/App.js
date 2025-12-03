import {StatusBar} from 'expo-status-bar';
import {Button, StyleSheet, Text, View} from 'react-native';
import React, {useState} from "react"
import Slider from "@react-native-community/slider";

export default function App() {
  const [counter, setCounter] = useState(0)

  function setCounterConstrained(newValue) {
    if (typeof newValue == "number") {
      if (newValue <= 100) {
        setCounter(newValue)
      } else {
        setCounter(100)
      }
    }
    else {
      console.log("I can't check the value of anything different from a number...")
      console.log(newValue)
    }
  }

  return (
    <View style={styles.container}>
      <Text style={styles.text}>{counter}</Text>
      <Button title="Add 1" onPress={() => {
        setCounterConstrained(counter + 1);
      }}/>
      <Button title="Add 3" onPress={() => {
        setCounterConstrained(c => c + 1);
        setCounterConstrained(c => c + 1);
        setCounterConstrained(c => c + 1);
      }}/>
      <View style={styles.sliderContainer}>
        <Slider minimumValue={0} maximumValue={100} onValueChange={(value) => {
          setCounterConstrained(Math.floor(value))
        }}/>
      </View>
      <StatusBar style="auto"/>
    </View>
  );
}

//export default class App extends React.Component {
//  state = {counter: 0, counter2: 10}
//  render() {
//    return <View style={styles.container}>
//      <Text style={styles.text}>{this.state.counter}   {this.state.counter2}</Text>
//      <Button title="Add 2" onPress={() => {
//        this.setState({counter: this.state.counter+2, counter2: this.state.counter2+2})
//      }}/>
//    </View>
//  }
//}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#645252',
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    fontSize: 40
  },
  sliderContainer: {
    width: 150
  }
});
