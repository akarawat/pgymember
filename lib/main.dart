import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gamespace_memberapi/provider/globals.dart' as globals;

import 'pages/login_page.dart';

void main() {
  getVersion();
  runApp(MyApp());
}

void getVersion() async {
  final response = await http.get(Uri.parse('http://54.255.168.206:3000'));
  if (response.statusCode == 200 ||
      response.statusCode == 201 ||
      response.statusCode == 400) {
    Map jsonData = json.decode(response.body) as Map;
    globals.appVer = jsonData['Message'].toString() != null
        ? jsonData['Message'].toString()
        : "";
    // return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    globals.appVer = ('Failed to load album');
    // throw Exception('Failed to load album');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(globals.appVer);
    return MaterialApp(
        title: 'Image Loader',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          accentColor: Colors.lightBlueAccent,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 22.0, color: Colors.lightBlueAccent),
            headline2: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: Colors.redAccent,
            ),
            bodyText1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent,
            ),
          ),
        ),
        home: LoginPage());
  }
}
