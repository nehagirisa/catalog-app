import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/utills/routes.dart';
import 'package:catalog_app/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


void main() {
  runApp(VxState
  (store:MyStore(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: HomePage(),
        themeMode: ThemeMode.light,
        theme: MyTheme.lighttheme(context),
        darkTheme: MyTheme.darktheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.loginRoute,
        routes: {
          "/": (context) => HomePage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.cartRoute: (context) => CartPage(),
        });
  }

  
}
