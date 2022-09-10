import 'package:flutter/material.dart';

showMessage(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}

roundedButtonStyle({Color btnColor = Colors.amber}) {
  return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(horizontal: 100),
      primary: btnColor);
}

fieldInputDecoration(hint) {
  return InputDecoration(label: Text(hint));
}
