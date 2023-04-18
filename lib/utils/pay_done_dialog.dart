import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:pos_app/pages/page_my_home.dart';
import 'package:pos_app/utils/colors.dart';


class PayDoneDialog extends StatelessWidget {
  const PayDoneDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        AntDesign.checkcircle,
        size: 55,
      ),
      iconColor: AppColor.colorPrimary,
      iconPadding: const EdgeInsets.all(10),
      title: const Text("Payment Sucessfully Completed"),
      titleTextStyle: const TextStyle(color: AppColor.colorPrimary),
      actions: [
        Center(
          child: ElevatedButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageMyHome(),
                    ),
                  ),
              child: const Text('OK')),
        )
      ],
    );
  }
}
