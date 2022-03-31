import 'package:flutter/material.dart';
import 'ClimateFile.dart';
import 'inputcity.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Climate App",
    // home: Climate(),
    home: cityName(),
  ));
}
