import { StatusBar } from 'expo-status-bar';
import {Button, StyleSheet, Text, View} from 'react-native';
import React, { useState } from "react"
import CalcButton from "./CalcButton";
import {styles} from "./Styles";

export default function App() {
  let [display, setDisplay] = useState("")
  let [lastOperator, setLastOperator] = useState("")
  let [result, setResult] = useState(0)

  function clear() {
    setDisplay("")
    setLastOperator("")
    setResult(0)
  }

  function setOperator(operator) {
    setLastOperator(operator)
    setResult(parseFloat(display))
    setDisplay("")
  }

  function compute() {
    let term = parseFloat(display)
    let newResult
    switch (lastOperator) {
      case "+":
        newResult = result + term
        break
      case "-":
        newResult = result - term
        break
      case "*":
        newResult = result * term
        break
      case "/":
        newResult = result / term
        break
      case "!":
        newResult = factorial(result)
        break
      default:
        console.error("Something went wrong...")
    }
    setResult(newResult)
    setDisplay(newResult)
  }

  function factorial(n) {
    if (n === 0) {
      return 1
    }
    return n * factorial(n - 1)
  }

  return (
    <View style={styles.container}>
      <View style={styles.display}>
        <Text style={styles.text}>{display}</Text>
      </View>
      <View style={styles.buttonsGrid}>
        <CalcButton title={"1"} callback={() => {setDisplay(display + "1")}}/>
        <CalcButton title={"2"} callback={() => {setDisplay(display + "2")}}/>
        <CalcButton title={"3"} callback={() => {setDisplay(display + "3")}}/>
        <CalcButton title={"+"} callback={() => {setOperator("+")}}/>
        <CalcButton title={"4"} callback={() => {setDisplay(display + "4")}}/>
        <CalcButton title={"5"} callback={() => {setDisplay(display + "5")}}/>
        <CalcButton title={"6"} callback={() => {setDisplay(display + "6")}}/>
        <CalcButton title={"-"} callback={() => {setOperator("-")}}/>
        <CalcButton title={"7"} callback={() => {setDisplay(display + "7")}}/>
        <CalcButton title={"8"} callback={() => {setDisplay(display + "8")}}/>
        <CalcButton title={"9"} callback={() => {setDisplay(display + "9")}}/>
        <CalcButton title={"*"} callback={() => {setOperator("*")}}/>
        <CalcButton title={"c"} callback={clear}/>
        <CalcButton title={"0"} callback={() => {setDisplay(display + "0")}}/>
        <CalcButton title={"="} callback={compute}/>
        <CalcButton title={"/"} callback={() => {setOperator("/")}}/>
        <CalcButton title={"!"} callback={() => {setOperator("!")}}/>
      </View>
      <StatusBar style="auto" />
    </View>
  );
}
