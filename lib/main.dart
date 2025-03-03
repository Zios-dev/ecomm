import 'package:ecom/screens/cart_screen.dart';
import 'package:ecom/screens/favourites_screen.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(const Ecom());

class Ecom extends StatelessWidget {
  const Ecom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF), // Set a default background color
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)), // Set text color to black
        appBarTheme: const AppBarTheme(// Set a default color for the AppBar
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white, // Set title text color to white
            fontSize: 20,       // Adjust font size if needed
          ),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,

      // Define routes for navigation
      routes: {
         '/home': (context) => HomeScreen(),
         '/cart': (context) => CartScreen(),
         '/favorites': (context) => FavouritesScreen(),
      },
    );
  }
}
