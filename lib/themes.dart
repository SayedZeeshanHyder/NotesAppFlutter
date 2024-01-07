import 'package:flutter/material.dart';

class Themes {

  static const lightBrown = Color(0xFFC4A484);

  static final lightTheme = ThemeData(

    primaryColor: Colors.black,

    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.brown,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    //Scaffold Theme
    scaffoldBackgroundColor: Colors.white,


    //Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.brown,
      foregroundColor: Colors.white,
    ),



    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
    ),
  );

  static final darkTheme = ThemeData(

    primaryColor: Colors.white,

    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBrown,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    //Scaffold Theme
    scaffoldBackgroundColor: Colors.grey.shade800,


    //Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: lightBrown,
      foregroundColor: Colors.black,
    ),


    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightBrown,
        foregroundColor: Colors.black,
      ),
    ),

  );
}
