import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pos_app/custom_ui/custom_elev_btn.dart';

import '../utils/colors.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String? scanResult;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 200.0,
      decoration: BoxDecoration(
          color: AppColor.colorWhite,
          ),
      child: Column(
        children: [
          // const SizedBox(height: 10.0),
          Container(
            height: 50.0,
            width: 285,
            decoration: const BoxDecoration(
              color: AppColor.colorPrimary,
            ),
            child: Center(
              child: Text(
                "Add Product",
                style: TextStyle(
                    fontSize: 25.0,
                    color: AppColor.colorWhite,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              Text("Product Id : $scanResult"),
              Text("Product Name: Namkeen $scanResult"),
              Text("Product Price : Rs.159/- $scanResult"),
            ]),
          ),
          const Spacer(),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedBtn(
                btnName: "Scan", 
                onPress: () => ScanBarCode(), 
                btnWidth: 80,
                elevation: 0.0,
              ),
              CustomElevatedBtn(
                btnName: "Add", 
                onPress: (){}, 
                btnWidth: 80,
                elevation: 0.0,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future ScanBarCode() async {
    String scanResult;

    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = "Failed to get platform version";
    }
    if (!mounted) return;
    setState(() => this.scanResult = scanResult);
  }
}
