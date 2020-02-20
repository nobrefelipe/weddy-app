import 'package:flutter/material.dart';

class AppStyles {

  static const Color primaryColor = Color.fromRGBO(134, 78, 250, 1);
  static const Color primaryColorAlpha = Color.fromRGBO(134, 78, 250, 0.3);
  static const Color light_pink = Color.fromRGBO(245, 240, 240, 1);
  static const Color primaryColor_Alpha = Color.fromRGBO(251, 120, 95, 0.6);
  static const Color textColor = Color.fromRGBO(70, 70, 70, 1);
  static const Color textColorAlpha = Color.fromRGBO(2, 34, 65, 0.8);
  static const Color appBgColor = Color.fromRGBO(235, 235, 235, 1);

  static const TextStyle h1 = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 30,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1
  );

  static const TextStyle h1_bold = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    letterSpacing: 0
  );


  static const TextStyle h2 = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1
  );

  static const TextStyle h2_white = TextStyle(
    fontFamily: 'firasans',
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1
  );

  static const TextStyle h2_primary = TextStyle(
    fontFamily: 'firasans',
    color: primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1
  );

  static const TextStyle h2_primary_bold = TextStyle(
    fontFamily: 'firasans',
    color: primaryColor,
    fontSize: 19,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1
  );

  static const TextStyle h2_bold = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1
  );


  static const TextStyle body_text = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );

  static const TextStyle h3_no_spacing = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: -1
  );

  static const TextStyle h4_white = TextStyle(
    fontFamily: 'firasans',
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.0
  );

  static const TextStyle body_text_medium = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );

  static const TextStyle body_text_small = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 10,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );

   static const TextStyle tags = TextStyle(
    fontFamily: 'firasans',
    color: primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );


  static const TextStyle error_text = TextStyle(
    fontFamily: 'firasans',
    color: Colors.red,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );
  

}