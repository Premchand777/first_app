// ignore_for_file: avoid_print

// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:first_app/dice.roller.dart';

// import project pkgs
// import 'package:first_app/custom_styles/text_style_cws/teal_accent_variation_1.dart';

// Variables must be declared using the keywords 'const', 'final', 'var' or a type name
// variable declaration with var
var startAlignment = Alignment.topLeft;
// variables can declared only with the type.
Alignment? endAlignment;
// variables can't be declared using both var and type, but possible with const and type & final and type.
// variables can't be declared using both var and final.
// variables can't be declared using both const and final.

// gradient container custom widget
// example of defining a custom widget
class GradientContainerCW extends StatelessWidget { // stateless widgets are immutable meaning their state can't be changed.
  // default constructor function.
  // super.key purpose is to pass the "key"(Keys) from this class to StatelessWidget superclass.
  // Keys are useful when we want to assign a key the widget being created.
  // Keys are special objects in flutter to uniquely identify and manage(add, remove, reorder, rebuild, preserve state) widgets
  // in the Widgets Tree and update the UI more efficiently
  const GradientContainerCW(this.gradientColors, {super.key}); // {[key]} -> named arguments, without braces they are positional arguments.

  // final means an object's type is fixed but values can be varied at runtime.
  final List<Color> gradientColors;

  @override
  // A Widget is an immutable configuration description part for an Element on the user interface.
  // Widgets will be inflated into Elements which manage the underlying Render tree.
  // Each widget has its own BuildContext. And BuildContext of the widget returned by build method is not.
  // same as BuildContext of the widgets(child widgets) returned by that widget.

  // BuildContext is the handle to the location of the widget in widgets tree.
  // BuildContext objects are Element objects but these are implemented to avoid direct element objects changes.
  // BuildContext objects gives the info about the location at which the widget is being built in the widgets tree and
  // set of inherited widgets for this location in the tree.
  // A widget might be built with multiple different BuildContext objects over time as widget moved around the tree or
  // inherited into the tree at multiple places at once.

  // Avoid caching values returned from methods of BuildContext class because a BuildContext can change
  // for a widget can change over time until unless it is single synchronous operation.

  // Avoid storing instances of BuildContext because they may become invalid if related widget is unmounted from widgets tree.
  Widget build(BuildContext context) {
    // keyword "const" is used to optimize performance at compile time.
    // Dart caches the objects specified by const. So it will reference cached objects at run time by saving memory.
    const endAlignment = Alignment.bottomRight;

    return Container( // widget
      decoration: BoxDecoration( // configuration
        gradient: LinearGradient( // configuration
          begin: startAlignment,
          end: endAlignment as AlignmentGeometry,
          colors: gradientColors,
        ),
      ),
      child: const Center( // widget
        // child: TealAccentVariation1('Welcome, Premchand'),
        // child: TealAccentVariation1.welcomeText2('Welcome, K Premchand'),
        child: DiceRoller()
      ),
    );
  }
}
