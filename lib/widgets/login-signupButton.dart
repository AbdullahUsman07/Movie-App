


import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
  });

  String title;
  Color? color;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(height: 60, width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(title,style: const TextStyle(fontSize: 20,color:Colors.white),),),
      ),
    );
  }
}