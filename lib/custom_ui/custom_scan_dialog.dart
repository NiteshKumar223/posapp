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
  String? scanResult ;
  final pIdController = TextEditingController();
  final pNameController = TextEditingController();
  final pPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
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
                "Add New Product",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                CustomTxtField( 
                  controller: pIdController,
                  labelText: 'Product Id',
                  iconbtn: IconButton(
                    icon: const Icon(Icons.qr_code_scanner,color: AppColor.colorPrimary,),
                    onPressed: ()  => ScanBarCode(),
                  ),
                ),
                const SizedBox(height: 10.0),
                CustomTxtField(
                  controller: pNameController,
                  labelText: "Product Name",
                ),
                const SizedBox(height: 10.0),
                CustomTxtField(
                  controller: pPriceController,
                  labelText: "Product Price",
                ),
            ]),
          ),
          const Spacer(),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
    pIdController.text = scanResult;
  }
  
}

class CustomTxtField extends StatelessWidget {
  final String labelText;
  final IconButton? iconbtn;
  final TextEditingController? controller;
  
  const CustomTxtField({super.key, required this.labelText, this.iconbtn, this.controller});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
      cursorColor: AppColor.colorPrimary,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColor.colorPrimary),
        suffix: iconbtn,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.colorPrimary),
            borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.colorPrimary),
            borderRadius: BorderRadius.circular(25)),
      ),
      ),
    );
  }
}
