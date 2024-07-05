import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color foreGroundColor;
  final VoidCallback onpress;
  const CustomButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onpress,
      required this.foreGroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            shadowColor: WidgetStatePropertyAll(color),
            foregroundColor: WidgetStatePropertyAll(foreGroundColor),
            backgroundColor: WidgetStatePropertyAll(color),
            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))))),
        onPressed: onpress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
