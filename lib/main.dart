// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:first_app/custom_styles/container_style_cws/gradient_container.dart';

// main() is a top level function that is automatically executed by Dart at compile time
void main() {
  // runApp() is also the second top flutter function that takes the given
  // app's root widget and inflates and attaches it to the screen.
  // By default, it inflates the app root widget to the entire screen.
  runApp(
    // MaterialApp is a class and a widget indicating the app's style i.e Google's Material Design style.
    // It is an instance of WidgetsApp which is top level widget that contains all other widgets that are commonly required for
    // any application i.e CheckedModeBanner, SemanticsDebugger, Overlay, Navigator, Title, Localizations, MediaQuery, DefaultTextStyle.
    // Meaning that MaterialApp or CupertinoApp classes will implement the base functionality for any app through this WidgetsApp.
    // Primary role of the WidgetsApp is to bind the system back button to Navigator or quitting the application.
    // At-least one of these must be provided to the MaterialApp widget i.e home, route, builder and onGenerateRoute.
    MaterialApp(
      title: 'Roll Dice',
      // used by device to identify the app for the user.
      home: // home is the widget for default route of the app i.e "/"
          const Scaffold(
        // Scaffold is the Base & Support structure to build the visual UI or Material Design widgets.
        backgroundColor: Colors.black87,
        body: // body is the primary content area of the Scaffold. By default widget provided to body will be placed
            // on top-left side of the body.
            GradientContainerCW(
          // custom widget for Scaffold body background color
          [
            Color.fromARGB(255, 44, 18, 82),
            Color.fromARGB(225, 24, 6, 53),
            Color.fromARGB(226, 17, 3, 40),
            Color.fromARGB(227, 6, 0, 16),
          ],
        ),
      ),
      theme: // to define the default visual properties like colors, fonts and shapes for the app's Material widgets.
          ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
    ),
  );
}
