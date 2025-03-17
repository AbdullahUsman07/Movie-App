
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Text extends StatelessWidget {
   Custom_Text({super.key,required this.text,required this.color, required this.font,this.fontWeight=FontWeight.normal});

  final String text;
  final Color color;
  final double font;
  FontWeight? fontWeight ;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lora(color:color,fontSize: font,fontWeight: fontWeight),
    );
  }
}