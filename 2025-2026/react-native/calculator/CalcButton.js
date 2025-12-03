import React from "react";
import {Button, View} from "react-native";
import {styles} from "./Styles";

export default class CalcButton extends React.Component {
  render() {
    return <View style={styles.buttonCell}>
      <Button title={this.props.title} onPress={this.props.callback}/>
    </View>
  }
}
