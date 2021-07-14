import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.grey.shade400,
      canvasColor: Colors.white,
      accentColor: Colors.grey.shade800,
      buttonColor: lightColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darktheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.blueGrey.shade900,
      canvasColor: darkColor,
      accentColor: Colors.white,
      buttonColor: lightColor,
      appBarTheme: AppBarTheme(
        color: Colors.blueGrey.shade900,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(headline6: context.textTheme.headline6.copyWith(color: Colors.white)),
      ));

  static Color lightColor = Vx.purple500;
  static Color darkColor = Vx.gray800;
}
