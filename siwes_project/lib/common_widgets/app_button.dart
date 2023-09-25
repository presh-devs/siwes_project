
import 'package:flutter/material.dart';
import 'package:siwes_project/contstants/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key, required this.onPressed, required this.child,
  });

final VoidCallback onPressed;
final Widget child;
  @override
  Widget build(BuildContext context) {
    return     ElevatedButton(onPressed: onPressed, 
    style: ElevatedButton.styleFrom(
      backgroundColor: ProjectColors.primaryColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
    
    
      )
    ),
    child: child);
  }
}