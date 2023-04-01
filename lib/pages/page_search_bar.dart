import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';

class PageSearchBar extends StatelessWidget {
  const PageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        elevation: 0.0,
        title: Container(
          padding: const EdgeInsets.all(10.0),
          height: 40.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColor.colorWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            decoration: InputDecoration.collapsed(hintText: "Search"),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code_scanner),
          )
        ],
      ),
    );
  }
}
