// Import Flutter material package for UI components
import 'package:flutter/material.dart';
// Import Google Fonts for custom text styles
import 'package:google_fonts/google_fonts.dart';

// Text style for displaying temperature
final tempTextStyle = GoogleFonts.leagueSpartan(fontSize: 100.0);

// Text style for weather message
final messageTextStyle = GoogleFonts.leagueSpartan(fontSize: 60.0);

// Text style for buttons
final buttonTextStyle = GoogleFonts.leagueSpartan(fontSize: 30.0);

// Text style for weather condition icon
final conditionTextStyle = GoogleFonts.leagueSpartan(fontSize: 100.0);

// Input decoration for city name text field
const inputFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter city name',
  helperStyle: TextStyle(color: Colors.black),
  icon: Icon(Icons.location_city, color: Colors.white),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);
