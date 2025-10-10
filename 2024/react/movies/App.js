import * as React from "react";
import MovieListScene from "./MovieListScene";
import MovieDetailScene from "./MovieDetailScene";
import { createStackNavigator } from "@react-navigation/stack";
import { NavigationContainer } from "@react-navigation/native";

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={MovieListScene} />
        <Stack.Screen
          name="Detail"
          component={MovieDetailScene}
          options={({ route }) => ({ title: route.params.title })}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
