import 'package:flutter/material.dart';
import 'package:mortgage_repayment_calculator/screens/main_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "PlusJakartaSans",
      ),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: MainScreen(),
      ),
    ),
  );
}
