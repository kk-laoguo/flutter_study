import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';

class MineMenuItem extends StatelessWidget {
  final String title;
  final String image;
  final Color? color;
  const MineMenuItem({
    Key? key, 
    required this.title, 
    required this.image,
    this.color
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LBColor.randomColor,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: LBColor.subtitle
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
