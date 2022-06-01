import 'package:flutter/material.dart';

class IFYColors {
  static Color backgroundGrey = const Color.fromRGBO(67, 67, 67, 1);
  static Color buttonGray = const Color.fromARGB(255, 129, 128, 128);
  static Color accentRed = const Color.fromRGBO(225, 29, 72, 1);
  static Color altbuttonTransparent = const Color.fromARGB(50, 255, 255, 255);
  static Color altbuttonHighlight = const Color.fromARGB(100, 255, 255, 255);
  static Color inputFieldBackground = const Color.fromARGB(180, 255, 255, 255);
  static Color internListButtonBackground = const Color.fromARGB(255, 173, 173, 173);
}

class IFYButtons {

  //Primary Accented Button
  static ButtonStyle primaryButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(IFYColors.accentRed),
    textStyle: MaterialStateProperty.all(IFYFonts.primaryButtonFont),
    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
    minimumSize: MaterialStateProperty.all(const Size.fromHeight(63)),
    //fixedSize: MaterialStateProperty.all(const Size(200, 40)),
  );

  //Secondary Non-accented Button
  static ButtonStyle secondaryButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(IFYColors.buttonGray),
    textStyle: MaterialStateProperty.all(IFYFonts.secondaryButtonFont),
    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
    minimumSize: MaterialStateProperty.all(const Size.fromHeight(63)),
  );


  //Alternative Primary Button
  static ButtonStyle primaryAltbutton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    textStyle: MaterialStateProperty.all(IFYFonts.primaryAltbuttonFont),
    side: MaterialStateProperty.all(const BorderSide(width: 1.0, color: Colors.white)),
    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
    minimumSize: MaterialStateProperty.all(const Size(150, 37)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)),
    ),
    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered) ||
            states.contains(MaterialState.pressed) ||
            states.contains(MaterialState.focused)) {
          return Colors.black;
        }
        return Colors.white; // Defer to the widget's default.
      },
    ),
    overlayColor: MaterialStateProperty.all(Colors.white),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );


    //Alternative Primary Button
  static ButtonStyle secondaryAltbutton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    textStyle: MaterialStateProperty.all(IFYFonts.primaryAltbuttonFont),
    side: MaterialStateProperty.all(const BorderSide(width: 1.0, color: Colors.white)),
    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
    minimumSize: MaterialStateProperty.all(const Size(150, 37)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)),
    ),
    foregroundColor: MaterialStateProperty.all(Colors.white), // Defer to the widget's default.
    shadowColor: MaterialStateProperty.all(IFYColors.altbuttonTransparent),
    overlayColor: MaterialStateProperty.all(IFYColors.altbuttonHighlight),
  );

  static ButtonStyle textButton = ButtonStyle(
    textStyle: MaterialStateProperty.all(IFYFonts.textButtonFont),
    foregroundColor: MaterialStateProperty.all(Colors.white),
  );

  static ButtonStyle internListButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(IFYColors.buttonGray),
    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 2)),
    minimumSize: MaterialStateProperty.all(const Size.fromHeight(100)),
  );
}

class IFYFonts {
  static TextStyle introHeader = const TextStyle(
    fontFamily: "RobotoCondensed",
    fontSize: 24,
    color: Colors.white,
  );
  static TextStyle introSubheader = const TextStyle(
    fontFamily: "RobotoThin",
    fontSize: 20,
    color: Colors.white70
  );
  static TextStyle primaryButtonFont = const TextStyle(
    fontFamily: "RobotoCondensed",
    fontSize: 24,
    color: Colors.white,
  );
  static TextStyle secondaryButtonFont = const TextStyle(
    fontFamily: "RobotoThin",
    fontSize: 22,
    color: Colors.white,
  );
  static TextStyle textButtonFont = const TextStyle(
    fontFamily: "RobotoThin",
    fontSize: 20,
  );
  static TextStyle primaryAltbuttonFont = const TextStyle(
    fontFamily: "RobotoCondensed",
    fontSize: 16,
  );

  static TextStyle inputPreText = const TextStyle(
    fontFamily: "RobotoThin",
    fontSize: 15,
    color: Colors.white70
  );
  static TextStyle inputFieldText = const TextStyle(
    fontFamily: "RobotoThin",
    fontSize: 20,
    fontWeight: FontWeight.w200,
    color: Colors.black
  );
  static TextStyle imageButtonText = const TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 20,
    color: Colors.white,
  );

  static TextStyle internListNameText = const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 18,
    color: Colors.white
  );

  static TextStyle internListDescriptionText = const TextStyle(
    fontFamily: 'RobotoThin',
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w100,
    fontSize: 14,
    color: Colors.white
  );

  static TextStyle scoreButtonText = const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 20,
    color: Colors.white
  );

  static TextStyle profileMainScoreText = const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 36,
    color: Colors.white
  );

  static TextStyle profileQualText = const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 18,
    color: Colors.white
  );

  static TextStyle skillListName = const TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 18,
    color: Colors.black
  );
}

class IFYImages {

}