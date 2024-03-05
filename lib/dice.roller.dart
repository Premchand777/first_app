// ignore_for_file: avoid_print

// import dart pkgs
import 'dart:math';

// import flutter pkgs
import 'package:flutter/material.dart';

final randomizer = Random();

// defining stateful widget. it is a widget that has a mutable state.

// State is the logic behind the StatefulWidget. It is information that can be read
// synchronously when the widget is built. And it might change during the lifetime of the widget.

// StatefulWidget instances themselves are immutable and store their State in the objects
// created by createState method or in the objects to which that State subscribes.

// Multiple States can be associated with a StatefulWidget if that widget is inserted into the tree at multiple places.

// StatefulWidget keeps same State object when its moving from one location to another location in the tree if GlobalKey is used.

// StatefulWidgets are of two categories
// 1. widgets built by State.initState and State.dispose and commonly used at root of an app or page,
// and communicate with sub widgets via ChangeNotifiers, Streams etc. (CPU and GPU cycles are Cheap)
// 2. widgets that depend on State.setState or InheritedWidgets. (CPU and GPU cycles are Costly because of rebuilds)
// According to 2 category of StatefulWidget, be mindful of implementing in optimized way.
// Performance consideration points for 2 category above:
// 1. Push the state to the leaves. For example, if your page has a ticking clock, rather than
// putting the state at the top of the page and rebuilding the entire page each time the clock ticks,
// create a dedicated clock widget that only updates itself.
// 2. Minimize the number of nodes transitively created by the build method and any widgets it creates.
// Ideally, a stateful widget would only create a single widget, and that widget would be a RenderObjectWidget.
// (Obviously this isn't always practical, but the closer a widget gets to this ideal, the more efficient it will be.)
// 3. If a subtree does not change, cache the widget that represents that subtree and re-use it each time it can be used.
// To do this, assign a widget to a `final` state variable and re-use it in the build method.
// It is massively more efficient for a widget to be re-used than for a new (but identically-configured) widget to be created.
// 4. Another caching strategy consists in extracting the mutable part of the widget into a StatefulWidget which accepts a child parameter.
// 5. Use `const` widgets where possible. (This is equivalent to caching a widget and re-using it.)
// 6. Avoid changing the depth of any created subtrees or changing the type of any widgets in the subtree.
// 7. If the depth must be changed for some reason, consider wrapping the common parts of the subtrees in widgets
// that have a GlobalKey that remains consistent for the life of the stateful widget.
// (The KeyedSubtree widget may be useful for this purpose if no other widget can conveniently be assigned the key.)
// 8. When trying to create a reusable piece of UI, prefer using a widget rather than a helper method.
// For example, if there was a function used to build a widget, a State.setState call would require Flutter
// to entirely rebuild the returned wrapping widget. If a Widget was used instead, Flutter would be able to
// efficiently re-render only those parts that really need to be updated.
// Even better, if the created widget is `const`, Flutter would short-circuit most of the rebuild work.

// To define a StatefulWidget we must create a parent class that extends the StatefulWidget,
// overrides the createState method and returns State object.
// Next, must create a child class that extends the created StatefulWidget parent class and
// overrides the build method and returns the widget.
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceNo = 2;

  @override
  Widget build(BuildContext context) {
    return Column( // widget
      mainAxisAlignment: MainAxisAlignment.center, // configuration
      children: [ // widget
        Image.asset(
          'assets/dice-images/dice-$currentDiceNo.png',
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
          onPressed: () { // configuration
            // setState notifies the flutter that internal state of this widget has changed.
            // the provided callback will be executed immediately. and it must not return a future i.e async.
            // It causes flutter to schedule the build for this State object.
            setState(() {
              currentDiceNo = randomizer.nextInt(6) + 1;
            });
          },
          style: TextButton.styleFrom( // configuration
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
          child: const Text( // widget
            'Roll',
            style: TextStyle( // configuration
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}