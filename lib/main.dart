import 'package:flutter/material.dart';
import 'package:flutter_application_3/views/home_page.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      useMaterial3: false
    ),
  ));
}