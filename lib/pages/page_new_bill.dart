// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:pos_app/custom_ui/custom_elev_btn.dart';
import 'package:pos_app/utils/colors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class PageNewBill extends StatefulWidget {
  const PageNewBill({super.key});

  @override
  State<PageNewBill> createState() => _PageNewBillState();
}

class _PageNewBillState extends State<PageNewBill> {
  var prod_id = 86590000;
  var prod_name = "Fridge";
  var prod_price = 14599;

  int itemcount = 20;

  var total_price = 20 * 14599;

  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    const SnackBar(
      content: Text("Payment is Done"),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    const SnackBar(
      content: Text("Payment is Failed"),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: OutlinedButton(
                  onPressed: () => ScanBarCode(),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side:
                            const BorderSide(color: AppColor.colorPrimary))),
                    fixedSize: MaterialStateProperty.all(const Size(170, 40)),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: AppColor.colorPrimary)),
                  ),
                  child: const Text(

                    'Add Product',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppColor.colorPrimary,
                    ),
                  )),
            ),
            Padding(  
              padding: const EdgeInsets.all(5.0),
              child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side:
                            const BorderSide(color: AppColor.colorPrimary))),
                    fixedSize: MaterialStateProperty.all(const Size(170, 40)),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: AppColor.colorPrimary)),
                  ),
                  child: const Text(
                    'Hold Bill',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppColor.colorPrimary,
                    ),
                  )),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 270,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          leading: const Icon(
                            Boxicons.bxl_product_hunt,
                            size: 50.0,
                            color: AppColor.colorPrimary,
                          ),
                          title: Text("Product Name: $prod_name"),
                          subtitle: Text("Barcode Id: $prod_id"),
                          trailing: Text("Price: $prod_price")),
                    );
                  }),
            ),
            const SizedBox(height: 8),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: AppColor.colorPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Rs: ",
                          style: TextStyle(color: AppColor.colorPrimary),
                        ),
                        Text(
                          "$total_price",
                          style: TextStyle(color: AppColor.colorBlack),
                        )
                      ],
                    ),
                  ),
                  CustomElevatedBtn(
                      elevation: 0.0,
                      btnName: "Place Order",
                      onPress: () {
                        openDialog();
                      },
                      btnWidth: 150.0)
                ]),
            const SizedBox(height: 5.0),
          ],
        )
      ],
    );
  }

  Future<dynamic> openDialog() {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Select Any One Method"),
        content: SizedBox(
          height: 120,
          child: Column(children: [
            CustomElevatedBtn(
              btnName: "Online",
              onPress: () {
                var options = {
                  'key': "rzp_test_j9tvesCDxyBA2P",
                  'amount': total_price * 100,
                  'name': 'Saaqe POS',
                  'description': 'purchasing goods',
                  'timeout': 180,
                  'prefill': {'contact': '', 'email': 'test@razorpay.com'}
                };
                _razorpay.open(options);
              },
              btnWidth: 300.0,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedBtn(btnName: "Cash", onPress: () {}, btnWidth: 300.0),
          ]),
        ),
      ),
    );
  }


  @override
  dispose() {
    _razorpay.clear();
    super.dispose();
  }
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
    var pIdController;
    pIdController= scanResult;
  }
}
