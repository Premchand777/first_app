// ignore_for_file: avoid_print

// import flutter pkgs
import 'package:flutter/material.dart';

// import dart pkgs
import 'dart:math';

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

    var defaultDice = 'assets/dice-images/dice-1.png';

    return Container( // widget
      decoration: BoxDecoration( // configuration
        gradient: LinearGradient( // configuration
          begin: startAlignment,
          end: endAlignment as AlignmentGeometry,
          colors: gradientColors,
        ),
      ),
      child: Center( // widget
        // child: TealAccentVariation1('Welcome, Premchand'),
        // child: TealAccentVariation1.welcomeText2('Welcome, K Premchand'),
        child: Column( // widget
          mainAxisAlignment: MainAxisAlignment.center, // configuration
          children: [ // widget
            Image.asset(
              defaultDice,
              width: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: const ButtonStyle(
            //     backgroundColor: MaterialStatePropertyAll(
            //       Color.fromARGB(208, 32, 4, 79),
            //     ),
            //     shadowColor: MaterialStatePropertyAll(
            //       Color.fromARGB(208, 108, 96, 128),
            //     ),
            //     fixedSize: MaterialStatePropertyAll(
            //       Size(170, 20),
            //     ),
            //   ),
            //   child: const Text(
            //     'Roll',
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),

            TextButton(
              onPressed: () {
                var randomNumber = Random().nextInt(6) + 1;
                print('Clicked.. $randomNumber');
                // generate a random number from 1 to 6
                // substitute the new random number in a string & update the dice image
                defaultDice = 'assets/dice-images/dice-$randomNumber.png';
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(226, 17, 3, 40),
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 60,
                  right: 60,
                ),
                shadowColor: const Color.fromARGB(194, 194, 165, 241),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                elevation: 2.5,
              ),
              child: const Text(
                'Roll',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
