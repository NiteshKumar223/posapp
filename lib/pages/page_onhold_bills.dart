import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../custom_ui/custom_elev_btn.dart';
import '../utils/colors.dart';

class PageOnHoldBills extends StatefulWidget {
  const PageOnHoldBills({super.key});

  @override
  State<PageOnHoldBills> createState() => _PageOnHoldBillsState();
}

class _PageOnHoldBillsState extends State<PageOnHoldBills> {
  
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
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height-215,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        leading:  const Icon(Icons.pause_circle_filled_outlined,
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
  
}
