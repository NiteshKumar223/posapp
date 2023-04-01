
import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';

class CustomDrawerItem extends StatelessWidget {
  final IconData icon;
  final String itemName;
  final VoidCallback ontapp;
  const CustomDrawerItem({super.key, required this.icon, required this.itemName, required this.ontapp});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapp,
      child: SizedBox(
        height: 80.0,
        width: 80.0,
        child: Column(
          children: <Widget> [
            Icon(icon,size: 40.0,color: AppColor.colorPrimary,),
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 12.0,
                color: AppColor.colorPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}