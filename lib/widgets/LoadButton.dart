

import 'package:flutter/material.dart';
import 'package:movie_app/utlis/text.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  LoadMoreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            right: 10.0,
            child: ElevatedButton(
              onPressed: () async {
                onPressed();
              },
              style: ElevatedButton.styleFrom(elevation: 10.0),
              child: Custom_Text(
                text: 'Get more',
                color: Colors.white,
                font: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
