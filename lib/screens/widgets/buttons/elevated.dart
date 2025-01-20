import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget 
{

  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    this.onPressed,
    
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton
            (
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(backgroundColor),
                foregroundColor: WidgetStatePropertyAll(foregroundColor),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                  ),
                )
                ),
              onPressed: onPressed,
              child: Text(text),
            );
  }
}