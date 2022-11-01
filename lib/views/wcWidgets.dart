import 'package:flutter/material.dart';

// ----- Ver Menú -----
GestureDetector button(VoidCallback function, Color color, String text,
    double width, double height) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: const Color(0xFFD6F0CC),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Color(0xFFD6F0CC),
          ),
        ),
      ),
    ),
  );
}
