import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomOutlBtn extends StatelessWidget {
  final String btnName;
  final VoidCallback ontap;
  const CustomOutlBtn({super.key, required this.btnName, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: const BorderSide(color: AppColor.colorPrimary))),
          fixedSize: MaterialStateProperty.all(const Size(170, 40)),
          side: MaterialStateProperty.all(const BorderSide(color: AppColor.colorPrimary)),
          
          ),
      child: Text(
        btnName,
        style: TextStyle(
          color: AppColor.colorBlack,
        ),
      ),
    );
  }
}
