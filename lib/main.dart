import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter/services.dart';
//set a colorScheme
var kcolorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 15, 102, 18));

// Custom gradient decoration for cards
var kCardGradient = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 108, 214, 154),
      Color.fromARGB(255, 174, 230, 198),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  borderRadius: BorderRadius.circular(12),
);

var kDarkCardGradient = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 20, 60, 80),
      Color.fromARGB(255, 40, 80, 100),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  borderRadius: BorderRadius.circular(12),
);

var kDarkTheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 7, 80, 100), 
  brightness: Brightness.dark,
);

void main() {
  //to lock the orientation of the device
  /*
  WidgetsFlutterBinding.ensureInitialized();    //make sure orientation property binded well with the app
  SystemChrome.setPreferredOrientations(
  [
    DeviceOrientation.portraitUp,
  ]
  ).then ((fn) {
*/
 runApp(
    MaterialApp(
      //TO ADD MAIN WIDGET HERE
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kDarkTheme.primaryContainer,
          foregroundColor: kDarkTheme.onPrimaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkTheme.primary,
            foregroundColor: kDarkTheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardThemeData().copyWith(
          shadowColor: Colors.grey,
          margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: kDarkTheme.secondaryContainer,
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
          titleLarge: GoogleFonts.lato(
            fontWeight: FontWeight.normal, 
            color: kDarkTheme.onSecondaryContainer, 
            fontSize: 20,
          ),
        ),
      ),

      theme: ThemeData().copyWith(
        colorScheme: kcolorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kcolorScheme.primaryContainer,
          foregroundColor: kcolorScheme.onPrimaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primary,
            foregroundColor: kcolorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardThemeData().copyWith(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          shadowColor: Colors.grey,
          elevation: 2,
          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(12),
          ),
          color: kcolorScheme.secondaryContainer, 
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: GoogleFonts.lato(
            fontWeight: FontWeight.normal, 
            color: kcolorScheme.onSecondaryContainer, 
            fontSize: 20,
          ),
        ),
      ),
      themeMode: ThemeMode.system, 
      home: const Expenses(), //set home page as expenses widget
    ),
  );
 // });
 
}