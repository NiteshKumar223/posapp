import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';
class CustomElevatedBtn extends StatelessWidget {
  final String btnName;
  final VoidCallback onPress;
  final double btnWidth;
  final double? elevation;
  const CustomElevatedBtn({
    super.key,
    required this.btnName,
    required this.onPress,
    required this.btnWidth, 
    this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style:ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: AppColor.colorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        fixedSize: Size(btnWidth, 50.0)
      ), 
      child: Text(
        btnName,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      
    );
  }
}