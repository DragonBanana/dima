import {StyleSheet} from "react-native";

export const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    fontSize: 40
  },
  display: {
    backgroundColor: "gray",
    width: "100%",
    alignItems: "flex-end",
    paddingHorizontal: 10
  },
  buttonsGrid: {
    backgroundColor: "#bebebe",
    width: "100%",
    flexDirection: "row",
    flexWrap: "wrap"
  },
  buttonCell: {
    width: "25%",
    padding: 10
  }
});
