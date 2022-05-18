import 'package:flutter/material.dart';

class MyConstant {
  //field
  static Color primary = const Color.fromARGB(255, 10, 13, 127);
  static Color dark = const Color.fromARGB(255, 0, 0, 0);
  static Color light = const Color.fromARGB(255, 91, 76, 92);

  static String keyRollerId = 'reollerid';
  static String keyUserName = 'username';
  static String keyPassWord = 'password';
  static String keyToken = 'token';

  static List<String> typeUsers = [
    'Owner',
    'Customer',
    'Driver',
  ];

  static String pathRegister =
      'https://www.rollerglobal.com/api/api/Member/register';
  static String pathAuthen =
      'https://www.rollerglobal.com/api/api/Member/login';
  static String pathGetProfile =
      'https://www.rollerglobal.com/api/api/Member/getprofile';
  //method

  BoxDecoration curveBorderBox() => BoxDecoration(
        border: Border.all(color: MyConstant.dark),
        borderRadius: BorderRadius.circular(20),
      );

  BoxDecoration planBox() => BoxDecoration(color: light.withOpacity(0.3));

  BoxDecoration imageBox() => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg1.jpg'),
          fit: BoxFit.cover, //กล่องปรับความกว้างยาว
        ),
      );

  TextStyle h1Style() {
    return TextStyle(
      color: primary,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      color: dark,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      color: light,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3ActiveStyle() {
    return const TextStyle(
      color: Color.fromARGB(255, 32, 1, 99),
      fontSize: 14,
      fontWeight: FontWeight.w900,
    );
  }
} //class
